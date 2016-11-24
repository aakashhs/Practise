class History
	def self.view_challenge_history(challenge_name, connection, client, username, count_login, flash="")
		result = connection.exec "select * from challengehistory where challenge_name = '#{challenge_name}' and username = '#{username}' order by id desc"
		client.write("
<html><head><meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<link rel = 'stylesheet' type = 'text/css' href = 'hp.css' >
		</head><div id = \"wrapper\"><body><div id = \"header\" >
<header><table bgcolor = 'black' style=\"width:100%\"><tr >
			<td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">RUBY</h1></td>
<td  style = \"text-align:center;width:88%;color:white;\">
			<h1 style = \"padding-top:1%;padding-left:4vw;\">Challenge History</h1></td><td style = \"width:6%;\">
			
			<div class=\"dropdown\" >")
    
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img class = 'topim'
                  src='msuser1.png' alt='logo' />#{username}</a>")
                  client.write("<div class='dropdown-content'><a href = 'homepage'><img class = 'im' src='home.png' />Home</a>
		<a href='userhistory'><img class = 'im' 
                  src='history.png' alt='logo' /> User History(#{count_login})</a>
		<a href = 'contactus'><img class = 'im' src = 'feedback.png' /> Contact Us</a>
		<a href='tasklist'><img class = 'im' src='logout.png' />Log out</a>
                </div>
              </div></td></tr></table>
			</header></div><br>")
if flash != ""
client.write("<div id=\"Text\" style=\"color : green;\"><center> <p> The pdf has been successfully #{flash}! </p> </center></div><script type = \"text/javascript\">
    		setTimeout ( \"vanish()\", 30000 );
		function vanish(){
			document.getElementById(\"Text\").style.display = \"none\";
		}
		</script>")
end
client.write("<br/><br/><div id = \"content\"><article><table border = 1 cellpading = 10  colspan = 5 align = 'center'><tr><td>date</td><td>time</td><td>input</td><td>Output</td></tr>")
		result.each {|row| json_row = row.to_json
			json_data = JSON.parse(json_row);client.write("<tr><td>#{json_data['date']}</td><td>#{json_data['time']}</td><td><pre>#{json_data['input']}</pre></	td><td><pre>#{json_data['output']}</pre></td></tr>")}
		client.write("</table><br/>
<center><input type = 'submit' name = 'DownloadChallengePDF' value = 'Get PDF' id = 'downloadpdf'></center><br><br><br>
<div id=\"myModal\" class=\"modal\">
  <div class=\"modal-content\">
    <span class=\"close\">[close]</span>
<form>
<input type=\"radio\" name = \"Downloadtask\" value = \"Downloadtask\">Download<br/>
<input type=\"radio\" name = \"Downloadtask\" value = \"Downloadtaskmail\">Mail<br/>
<input type=\"submit\" value = \"OK\" id=\"ok\"><br/>
</form>
  </div>
</div>
<script src = 'hp.js'>
</script>

</article></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
	end

	def self.view_login_history(connection, client, username, flash = "")
		result = connection.exec "select * from loginhistory where username = '#{username}' order by id desc"
client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("
<html><head><meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><link rel = 'stylesheet' type = 'text/css' href = 'hp.css' ></head><div id = \"wrapper\"><body><div id = \"header\">
<header><table bgcolor = 'black' style=\"width:100%\"><tr >
			<td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">RUBY</h1></td>
<td  style = \"text-align:center;width:88%;color:white;\">
			<h1 style = \"padding-top:1%;padding-left:4vw;\">User History</h1></td><td style = \"width:6%;\">
			<div class=\"dropdown\" >")
			
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img class = 'topim' 
                  src='msuser1.png' alt='logo' />#{username}</a>")
                client.write("<div class='dropdown-content'>
                  <a href = 'homepage'><img class = 'im' src='home.png' />Home</a>
		<a href = 'contactus'><img class = 'im' src = 'feedback.png' /> Contact Us</a>
		<a href='tasklist'><img class = 'im' src='logout.png' />Log out</a>
                </div>
              </div></td></tr></table>
			</header></div><br>")
if flash != ""
client.write("<div id=\"Text\" style=\"color : green;\"><center> <p> The pdf has been successfully #{flash}! </p> </center></div><script type = \"text/javascript\">
    		setTimeout ( \"vanish()\", 30000 );
		function vanish(){
			document.getElementById(\"Text\").style.display = \"none\";
		}
		</script>")
end

client.write("<br><br><div id = \"content\"><article><table><table align = 'center' border = 1 cellpading = 10 colspan = 5><tr><td><b>username<b></td><td><b>time<b></td><td><b>date<b></td></tr>")
		result.each {|row| 
			client.write("<tr><td>#{row['username']}</td><td>#{row['time']}</td><td>#{row['date']}</td></tr>")}
		client.write("</table><br/>
		<center><input type = 'submit' name = 'loginhistoryPDF' value = 'Login History Pdf' id = 'downloadpdf'></center><br><br><br><br><br>
		<div id=\"myModal\" class=\"modal\">
		  <div class=\"modal-content\">
		    <span class=\"close\">[close]</span>
			<form>
				<input type=\"radio\" name = \"DarthVader\" value = \"DarthVader\">Download as Pdf<br/>
				<input type=\"radio\" name = \"DarthVader\" value = \"DarthVadermail\">Mail the Pdf<br/>
				<input type=\"submit\" value = \"OK\" id=\"ok\"><br/>
			</form>
		  </div>
		</div>
		<script src = 'hp.js'>
		</script>

		</article></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
	end


end
