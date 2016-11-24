class Contact
	def self.emailus(client, username = "Guest", count_login = "", flash = false)
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<html>
		<meta charset=\"utf-8\">
		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><head>
		<link rel='stylesheet' type = 'text/css' href = 'cp.css' >
		</head><div id = \"wrapper\"><body><div id = \"header\"><header><table bgcolor = 'black' style=\"width:100%;\"><tr ><td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">RUBY</h1></td>
<td  style = \"text-align:center;width:88%;color:white;\">
			<h1 style = \"padding-top:1%;\">Contact Form</h1></td><td style = \"width:6%;\"><div class=\"dropdown\" >")
		if username == "Guest"
			client.write("<a href='#' class='dropbtn' style=\"font-size:112%;\"><img class = 'topim' 
                  src='msuser1.png' alt='logo' /> Guest</a>")
		else
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img class = 'topim' 
                  src='msuser1.png' alt='logo' /> #{username}</a>")	
		end
                
                client.write("<div class='dropdown-content'> <a href = 'homepage'><img class = 'im' />Home</a>")
		if username != "Guest"
		client.write("<a href='userhistory'><img class = 'im'
                  src='history.png' alt='logo' /> User History(#{count_login})</a>
		<a href='tasklist'><img class = 'im' src='logout.png' />Log out</a>")	
		else
		client.write("<a href='login$fromXandar$' id><img class = 'im' 
                  src='login.png' alt='logo' /> Log In</a>
		<a href='signup$fromXandar$'><img class = 'im' src='signup.png' /> Sign Up</a>") 
		end
                client.write("</div>
              </div></td></tr></table></header></div>")
client.write("<div id=\"Text\" style=\"color : green;\"><center> <p> Your Feedback has been successfully mailed! </p> </center></div><script type = \"text/javascript\" >
    		setTimeout ( \"vanish()\", 30000 );
		function vanish(){
			document.getElementById(\"Text\").style.display = \"none\";
		}
		</script>") if flash == true
client.write("<div id = \"content\"><article><br><br>
			<form id = 'i' name = 'aakash'><div class = \"contact\">
			<h1>Your Name:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"name\" required></textarea><br><br>
			<h1>Your Mail Id:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"mailid\" required></textarea><br><br>
			<h1>Message:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"10\" cols= \"100\" name = \"body\" required></textarea><br><br>
			<input type = 'submit' name = 'Send' value = 'send'></div>
			</form>
			</article><br><br></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
	end
end
