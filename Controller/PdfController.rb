class PdfController
	def self.handle(response, client, connection, s)
		if response =~ /Downloadtask/			
			Download.download_challenge(response, connection, s)
			if s.getMailPdf() == true
				(s.setin_login(false); MailPdf.mail_pdf(client, s, s.getPdfName());s.setMailPdf(false))
			else
				History.view_challenge_history(connection, client, s, "downloaded")
			end
		elsif response =~ /SendPdf/
			Email.send_pdf(response, s.getPdfName())
			if s.getin_login() == true
				History.view_login_history(connection, client, s, "mailed")
			else
				History.view_challenge_history(connection, client, s, "mailed")
			end
		elsif response =~ /DarthVader/		
			Download.download_login(response, connection, s)
			if s.getMailPdf() == true
				(s.setin_login(true);MailPdf.mail_pdf(client, s, s.getPdfName());s.setMailPdf(false)) 
			else
				History.view_login_history(connection, client, s, "downloaded")
			end
		end
	end
end
