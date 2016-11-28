class MailPdf
	def self.mail_pdf(client, s, pdf_name = "")
		username = s.getUsername()
		challenge_name = s.getChallengeName()
		count_login = s.getCountLogin()
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<html><head><meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<link rel = 'stylesheet' type = 'text/css' href = 'mp.css'>
</head><div id = \"wrapper\"><body><div id = \"header\" ><header><table class = 'a' ><tr ><td class = 'b'><h1 class = 'ha'>RUBY</h1></td>
<td class = 'c' ><h1 class = 'hb'>Send PDF</h1></td><td class = 'd'><div class=\"dropdown\" >")
			client.write("<a href='profile' class='dropbtn'><img class = 'topim' 
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
					<h1>Your name :</h1><textarea form = \"i\"   rows= \"1\" cols= \"100\" name = \"name\" id = \"name\" required></textarea><br><br>
					<h1>Your Mail-id :</h1><textarea form = \"i\" rows= \"1\" cols= \"100\" name = \"sender\" id = \"sender\" required></textarea><br><br>
					<h1>To :</h1><textarea form = \"i\" rows= \"1\"  cols= \"100\" name = \"mailid\" id = \"tomail\"></textarea><br><br>
					<h1>Cc:</h1><textarea form = \"i\" rows= \"1\" cols= \"100\"  name = \"Cc\" id=\"ccid\"></textarea><br><br>
					<h1>Bcc:</h1><textarea form = \"i\" rows= \"1\" cols= \"100\"  name = \"Bcc\" id=\"bccid\"></textarea><br><br>
					<h1>Subject:</h1><textarea form = \"i\"  rows= \"2\" cols= \"100\" name = \"Subject\" required></textarea><br><br>
					<h1>Message:</h1><textarea form = \"i\"  rows= \"10\" cols= \"100\" name = \"body\" required></textarea><br><br>
					<a href = '#'>#{pdf_name}_history.pdf</a><br><br>
					<input type = 'submit' name = 'SendPdf' value = 'sendpdf' onclick = \"return checkFill()\"></div>
					</form>
					<script src = 'mp.js' ></script>
					</article><br><br></div><div id = \"footer\"><footer><table class = 'foot'><tr><td class = 'p'><div class = 'copyright'><i>&copy; Developed by - Aakash Hs</i></div></td><td class = 'q'><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png'  id = 'goog'></a></div></td><td  class = 'r'><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\"  id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
	end
end
