class Send
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
	
end
