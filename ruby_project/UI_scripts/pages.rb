class Pages
	def self.login_page(client)
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<!DOCTYPE html-5><html><head>	<meta charset=\"utf-8\">	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><link rel = 'stylesheet' type = 'text/css' href = 'lp.css'>	</head><header ><table style=\"width:100%;\"><tbody><tr><td style=\"width:10%;color:white;padding-top:1%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>JAVA</h1></td><td style=\"width:84%;color:white;text-align:center;padding-right:4%;padding-top:1%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>Login</h1></td><td style = 'width:6%;'><button class = 'back' onclick='history.go(-1);' >go back?</button></td></tr></tbody></table></header><br><br><body>	<form method = 'get'>		<div class = \"login\">		<center>			    <label><b>User Name :</b></label><input type=\"text\" placeholder=\"Enter Username\" name=\"uname\" required autofocus><br /><br /><br />			    <label><b>Password :</b></label>&nbsp;&nbsp;			    <input type=\"password\" placeholder=\"Enter Password\" name=\"psw\" required><br /><br /><br />			    <button type=\"submit\">Login</button><br>				<a href='signup' style=\"color: cadetblue;\">Sign Up?</a>			</center>		</div>		<footer ><table bgcolor = 'black' style=\"width:100%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer>	</form></body></html>")
	end

	def self.fail_page(client)
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<!DOCTYPE html-5><html><head>	<meta charset=\"utf-8\">	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">	<link rel = 'stylesheet' type = 'text/css' href = 'lp.css'></head><header><table style=\"width:100%;\"><tbody><tr><td style=\"width:10%;color:white;padding-top:1%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>JAVA</h1></td><td style=\"width:84%;color:white;text-align:center;padding-right:8%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>Login</h1></td><td style = 'width:6%;'><button class = 'back' onclick='history.go(-2);' >go back?</button></td></tr></tbody></table></header><br><br><body>	<form method = 'get'>		<div class = \"login\">			<center>			    <label><b>User Name :</b></label>			    <input type=\"text\" placeholder=\"Enter Username\" name=\"uname\" style = \"border-color : red;\" required autofocus><br /><br /><br />			    <label><b>Password :</b></label>&nbsp;&nbsp;			    <input type=\"password\" placeholder=\"Enter Password\" name=\"psw\" style = \"border-color : red;\" required><br /><br /><br />			    <button type=\"submit\">Login</button>		<br><a href='signup' style=\"color: cadetblue;\">Sign Up?</a>			<p id = \"fail\">Authentication Failed!!</p>			</center>		</div>		<footer ><table bgcolor = 'black' style=\"width:100%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></form></body></html>")
	end
	def self.signup(client, message = "", back = -1)
		client.write("<html>
<head><link rel = 'stylesheet' type = 'text/css' href = 'sp.css'>
</head>
<body>
<div id=\"load\"></div>
<div id=\"myModal\" class=\"modal\">

  <!-- Modal content -->
  <div class=\"modal-content\">
    <span class=\"close\" onclick=\"history.go(#{back});\">&times;</span>
<form method = 'get' >
<br>
<h1>SIGN UP</h1>
<br>
<label>Name:</label><br>
<input type = 'text' placeholder=\"Name\" name = 'Name' id='name' required onblur = 'redden(this)' /><br><br>
<label>Email-Id:</label><br>
<input type = 'text' placeholder=\"Email-id\" name = 'Emailid' id = 'email' required onblur = 'redden(this)' onchange='return validateForm();' /><br><br>
<textarea type=\"text\" placeholder=\"latlang\" style = \"display:none\" readonly id = \"info\" name=\"latitude\"></textarea>
<label>Address:</label><br>
<textarea placeholder = \"Drag pointer on map to select your address\"  readonly name = \"address\" id = \"address\"rows = 3 cols = 19></textarea>
<script type=\"text/javascript\" src=\"http://maps.google.com/maps/api/js?sensor=false\"></script>
					<script type=\"text/javascript\" src = 'maps.js' >
					</script>
					<div id=\"mapCanvas\"></div><br>
					  <div id=\"infoPanel\" style='width:50%;'>
					    <div id=\"markerStatus\"></div>
					    
					    <div id=\"info\"></div>
					    <div id=\"address\"></div>
					  </div><br>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><label>User Name :</label><br><input placeholder=\"User Name\" type = 'text' name = 'Userid' required id='userid' maxlength = '10' onblur = 'redden(this)' /><br><br>
<div id = 'taken' style = \"color:red;\">#{message}</div>
<label>Password :</label><br>
<input placeholder=\"Password\" type = 'password' name = 'password' required id = 'pass' onblur = 'redden(this)' /><br><br>
<label>Confirm Password :</label><br>
<input placeholder=\"Confirm Password\" type = 'password' name = 'confirmPassword' required id = 'cpass' onblur = 'redden(this)'  /><br>
<span id='message'></span><br>
<input type = 'submit' name = 'Submit' value = 'Submit' id='submit' required /><br>
</form>
</div>
</div>
<script src = 'sp.js' >

</script>
</body>
</html>")
	end
	def self.load_Page(nav, client, connection, response, username, count_login, challenge_name)
		puts count_login
		if nav == "Klingon"
			Tasklist.load_task_list(client, connection, username, count_login)
		elsif nav == "Xandar"
			Contact.emailus(client, username, count_login)
		elsif nav == "vulcan"
			challenge_name = Execution.execute_desc(response, client, connection, username, count_login, challenge_name)
		end
	end
end
