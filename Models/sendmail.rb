class Email
	def self.mail(response)
		options = { 
		   :address              => "smtp.gmail.com",
		   :port                 => 587,
		   :user_name            => 'a.hs771994',
		   :password             => 'ClarkKent',
		   :authentication       => 'plain',
		   :enable_starttls_auto => true  }

		Mail.defaults do
		  delivery_method :smtp, options
		end
		name = CGI.unescape(response.scan(/name=(.*)&mailid/).flatten.pop)
		mailid = CGI.unescape(response.scan(/mailid=(.*)&body/).flatten.pop)
		body = CGI.unescape(response.scan(/body=(.*)&Send/).flatten.pop)
		Mail.deliver do
			to 'a.hs771994@gmail.com'
			from 'a.hs771994@gmail.com'
			subject 'from website!!'
			body "Name :#{name}\nMail - id : #{mailid}\nMessage : #{body}"
		end
		Mail.deliver do
			to mailid
			from 'a.hs771994@gmail.com'
			subject 'Concerning your feedback'
			body "Dear #{name},\n\tYour feedback on our application has been received with gratitude and is being reviewed by our developers. We promise to respond soon on this matter. \nThanking you,\n\nregards,\nTaskApp\nNOTE: This is an auto-generated email. Kindly do not reply."
		end
	end

	def self.send_pdf(response, pdf_name)
		name = CGI.unescape(response.scan(/name=(.*)&sender/).flatten.pop)
		sender = CGI.unescape(response.scan(/sender=(.*)&mailid/).flatten.pop)
		mailid = CGI.unescape(response.scan(/mailid=(.*)&Cc/).flatten.pop)
		ccid = CGI.unescape(response.scan(/Cc=(.*)&Bcc/).flatten.pop)
		bccid = CGI.unescape(response.scan(/Bcc=(.*)&Subject/).flatten.pop)
		subid = CGI.unescape(response.scan(/Subject=(.*)&body/).flatten.pop)
		body = CGI.unescape(response.scan(/body=(.*)&Send/).flatten.pop)
		options = { :address              => "smtp.gmail.com",
			:port                 => 587,
			:user_name            => 'a.hs771994',
			:password             => 'ClarkKent',
			:authentication       => 'plain',
			:enable_starttls_auto => true }
		Mail.defaults do
		  	delivery_method :smtp, options
		end
		Mail.deliver do
			to mailid if mailid != ""
			cc ccid if ccid != ""
			bcc bccid if bccid != ""
			reply_to sender
			from 'a.hs771994@gmail.com'
			subject subid
			body "\nMessage : #{body}\n\nYou can reply to #{name} by clicking on reply...\n\n 
 via - TaskApp"
			add_file "#{pdf_name.gsub(' ','_')}_history.pdf"
		end
		system("rm #{pdf_name.gsub(' ','_')}_history.pdf")
	end
end
