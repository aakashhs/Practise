class MailPdf
	def self.mail_pdf(client, username, count_login, pdf_name = "")
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<html><head><meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<link rel = 'stylesheet' type = 'text/css' href = 'mp.css'>
</head><div id = \"wrapper\"><body><div id = \"header\" ><header><table bgcolor = 'black' style=\"width:100%\"><tr ><td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">RUBY</h1></td>
<td  style = \"text-align:center;width:88%;color:white;\"><h1 style = \"padding-top:1%;\">Send PDF</h1></td><td style = \"width:6%;\"><div class=\"dropdown\" >")
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img class = 'topim' 
                  src='msuser1.png' alt='logo' />#{username}</a>")
			       client.write("<div class='dropdown-content' >           
					<a href = 'homepage'><img class = 'im' src='home.png' />Home</a>
		<a href='userhistory'><img class = 'im' 
                  src='history.png' alt='logo' /> User History(#{count_login})</a>
		<a href = 'contactus'><img class = 'im' src = 'feedback.png' /> Contact Us</a>
		<a href='tasklist'><img class = 'im' src='logout.png' />Log out</a>
			       </div>
			     </div></td></tr></table></header><br><br></div><div id = \"content\"><article><br><br>
					<form id = 'i' name = 'aakash'><div class = \"contact\">
					<p><block>NOTE:</block> if you are entering multiple email id's, separate them with semicolons'(;)</p>
					<br/><br/>
					<h1>Your name :</h1><textarea form = \"i\" style=\"resize:none\" rows= \"1\" cols= \"100\" name = \"name\" id = \"name\" required></textarea><br><br>
					<h1>Your Mail-id :</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"sender\" id = \"sender\" required></textarea><br><br>
					<h1>To :</h1><textarea form = \"i\" rows= \"2\" cols= \"100\" name = \"mailid\" id = \"tomail\"></textarea><br><br>
					<h1>Cc:</h1><textarea form = \"i\" rows= \"2\" cols= \"100\" name = \"Cc\" id=\"ccid\"></textarea><br><br>
					<h1>Bcc:</h1><textarea form = \"i\" rows= \"2\" cols= \"100\" name = \"Bcc\" id=\"bccid\"></textarea><br><br>
					<h1>Subject:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"Subject\" required></textarea><br><br>
					<h1>Message:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"10\" cols= \"100\" name = \"body\" required></textarea><br><br>
					<a href = '#'>#{pdf_name}_history.pdf</a><br><br>
					<input type = 'submit' name = 'SendPdf' value = 'sendpdf' onclick = \"return checkFill()\"></div>
					</form>
					<script src = 'mp.js' ></script>
					</article><br><br></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
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
			add_file "#{File.expand_path(File.dirname(__FILE__))}/#{pdf_name.gsub(' ','_')}_history.pdf"
		end
		system("rm #{File.expand_path(File.dirname(__FILE__))}/#{pdf_name.gsub(' ','_')}_history.pdf")
	end
end
