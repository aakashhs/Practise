class MailController
	def self.handle(response, client, connection, s)
		if response =~ /contactus/ and response !~ /send/ and response !~ /png/			
			Contact.emailus(client, s)
		elsif response =~ /send/ and response !~ /SendPdf/			
			Email.mail(response)
			Contact.emailus(client, s, true)
		end
	end
end
