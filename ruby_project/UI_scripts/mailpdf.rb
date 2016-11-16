class MailPdf
	def self.mail_pdf(client, username, count_login, pdf_name = "")
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<html><head><meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><style>
#wrapper {
	min-height:100%;
	position:relative;
}
#header {
			border-radius: 8px;
	background:black;
	padding:10px;
}
#content {
	padding-bottom:50px; /* Height of the footer element */
}
#footer {
padding-top:10px;
			border-radius: 8px;
	background:black;
	width:100%;
	height:50px;
	position:absolute;
	bottom:0;
	left:0;
}
				ul {
			       list-style-type: none;
			       margin: 0;
			       padding: 0;
			       overflow: hidden;
			       background-color: black;
			   	}

			  	 li {
			       float: left;
			   }

			   li a, .dropbtn {
			       display: inline-block;
			       color: white;
			       text-align: left;
			       padding: 12px 16px;
				min-width: 120px;
			       text-decoration: none;
			   }

			   li a:hover, .dropdown:hover .dropbtn {
			       background-color: #eecffa;color:black;
			   }

			   li.dropdown {
			       display: inline-block;
			   }

			   .dropdown-content {
			       display: none;
			       position: absolute;
			       background-color: #f9f9f9;
			       min-width: 120px;
			       box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
			   }

			   .dropdown-content a {
			       color: black;
			       padding: 12px 16px;
			       text-decoration: none;
			       display: block;
			       text-align: left;
			   }

			   .dropdown-content a:hover {background-color: #FFE4B5}

			   .dropdown:hover .dropdown-content {
			       display: block;
			   }
			textarea, select {
				    width: 100%;
				    padding: 12px 20px;
				    margin: 8px 0;
				    display: inline-block;
				    border: 1px solid #ccc;
				    border-radius: 4px;
				    box-sizing: border-box;
				}


				input[type=submit] {
				    width: 20%;
				    background-color: #4CAF50;
				    color: white;
				    padding: 14px 20px;
				    margin: 8px 0;
				    border: none;
				    border-radius: 4px;
				    cursor: pointer;
				}

				input[type=submit]:hover {
				    background-color: #45a049;
				}

				div.contact {
				width: 60%;
				    height: 1500px;
				    background-color: white;
				    margin:0 auto;
				    margin-top: 40px;
				    padding-top: 30px;
				    padding-left: 40px;
				     padding-right: 40px;
					padding-bottom: 30px;
				    border-radius: 5px;
				    color: black;
				    font-weight: bolder;
				    font-size: 18px;
	
				}
		#goog:hover, #twit:hover {background-color: #eecffa;border-radius: 4px;}
		</style></head><div id = \"wrapper\"><body bgcolor = #eecffa><div id = \"header\" style=\"height: 70px;\"><header><table bgcolor = 'black' style=\"width:100%\"><tr ><td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">RUBY</h1></td>
<td  style = \"text-align:center;width:88%;color:white;\">
			<h1 style = \"padding-top:1%;\">Send PDF</h1></td><td style = \"width:6%;\">
<ul>
			     <li class='dropdown'>")
			      if Encoding::Images.include?("#{username}.jpg")
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align:sub;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["#{username}.jpg"]}' alt='logo' />#{username}</a>")
			else
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align:sub;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["msuser1.jpg"]}' alt='logo' />#{username}</a>")
			end
			       client.write("<div class='dropdown-content' >           
					<a href = 'homepage'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["home.png"]}' />Home</a>
		<a href='userhistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["history.jpg"]}' alt='logo' /> User History(#{count_login})</a>
		<a href = 'contactus'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'data:image/jpeg;base64,#{Encoding::Images["contact_us.png"]}' /> Contact Us</a>
		<a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["logout.jpg"]}' />Log out</a>
			       </div>
			     </li>
			   </ul></td></tr></table></header><br><br></div><div id = \"content\"><article><br><br>
					<form id = 'i' name = 'aakash'><div class = \"contact\">
					<p><block>NOTE:</block> if you are entering multiple email id's, separate them with semicolons'(;)</p>
					<br/><br/>
					<h1>Your name :</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"name\" id = \"name\" required></textarea><br><br>
					<h1>Your Mail-id :</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"sender\" id = \"sender\" required></textarea><br><br>
					<h1>To :</h1><textarea form = \"i\" rows= \"2\" cols= \"100\" name = \"mailid\" id = \"tomail\"></textarea><br><br>
					<h1>Cc:</h1><textarea form = \"i\" rows= \"2\" cols= \"100\" name = \"Cc\" id=\"ccid\"></textarea><br><br>
					<h1>Bcc:</h1><textarea form = \"i\" rows= \"2\" cols= \"100\" name = \"Bcc\" id=\"bccid\"></textarea><br><br>
					<h1>Subject:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"Subject\" required></textarea><br><br>
					<h1>Message:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"10\" cols= \"100\" name = \"body\" required></textarea><br><br>
					<a href = '#'>#{pdf_name}_history.pdf</a><br><br>
					<input type = 'submit' name = 'SendPdf' value = 'sendpdf' onclick = \"return checkFill()\"></div>
					</form>
					<script>function checkFill() {
					var contentto = document.getElementById('tomail').value;
					var contentcc = document.getElementById('ccid').value;
					var contentbcc = document.getElementById('bccid').value;
					if (contentto.length < 1 && contentcc.length < 1 && contentbcc.length<1)
					{ alert(\"Atleast one of the to-mail or cc or bcc fields must be filled\"); 
					return false;} else { return true; }
					}</script>
					</article><br><br></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,#{Encoding::Images["google_plus.png"]}' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,#{Encoding::Images["Twitter_logo.png"]}\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
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
			:enable_starttls_auto => true  }
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
