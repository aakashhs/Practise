class Execution
	def self.load_drop_down(client, connection, challenge_name, username, count_login = "")
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>");
		result = connection.exec "select count(*) from challengehistory where challenge_name = '#{challenge_name}' and username = '#{username}'"
		count = 0
		result.each {|row| json_row = row.to_json
			json_data = JSON.parse(json_row);count = json_data['count'].to_i}
		client.write("<html><head><meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<link rel = 'stylesheet' type = 'text/css' href = 'ep.css' ></head><div id = \"wrapper\">
		<body><div id = \"header\">
		<header><table class = 'a'><tr >
			<td class = 'b'><h1 class = 'ha'>RUBY</h1></td>
<td  class = 'c'>
			<h1 class = 'hb'>#{challenge_name}</h1></td><td class = 'd'><div class=\"dropdown\" >")
                if username == "Guest"
			client.write("<a href='#' class='dropbtn' ><img class = 'topim' 
                  src='msuser1.png' alt='logo' />Guest</a>")
		else
			
			client.write("<a href='profile' class='dropbtn' ><img class = 'topim'
                  src='msuser1.png' alt='logo' />#{username}</a>")
			
		end
               client.write("<div class='dropdown-content'>                  
		<a href = 'homepage'><img class = 'im' src='home.png' />Home</a>
		<a href = 'contactus'><img class = 'im' src = 'feedback.png' /> Contact Us</a>")
		if username != "Guest"
		client.write("<a href='challengehistory'><img class = 'im' 
                  src='history.png' alt='logo' />Challenge History(#{count})</a>
		<a href='userhistory'><img class = 'im'
                  src='history.png' alt='logo' /> User History(#{count_login})</a>
		
		<a href='tasklist'><img class = 'im' src='logout.png' />Log out</a>")
		else
		client.write("<a href='login$fromvulcan$' id><img class = 'im' 
                  src='login.png' alt='logo' /> Log In</a>
		<a href='signup$fromvulcan$'><img class = 'im' src='signup.png' /> Sign Up</a>")
		end
                client.write("</div>
              </div></td></tr></table>
			</header></div><br><br><div id = \"content\"><article><div id = \"desc\">")
		result=connection.exec "select description from challenges where challenge_name = '#{challenge_name}'"
		result.each{|row| json_row = row.to_json
			json_data = JSON.parse(json_row);client.write("<h1>Description</h1><pre >#{json_data['description']}</pre>")}
	end

	def self.execute_desc(response, client, connection, s,compare_input = "")
		username = s.getUsername()
		challenge_name = s.getChallengeName()
		count_login = s.getCountLogin()
		user_output=""
		user_input=""
		if compare_input != ""
			puts user_output = CGI.unescape(compare_input.scan(/output=(.*)&img/).flatten.pop)
			puts user_input = CGI.unescape(compare_input.scan(/input=(.*)&output/).flatten.pop)
		end
		challenge_name = CGI.unescape(response.scan(/exec\$(.*)% /).flatten.pop) if challenge_name == ""
		load_drop_down(client, connection, challenge_name, username, count_login)
		client.write("</div>
			<table id = 'compile'><form id ='i'>
			<tr><td cstyle=\"width:45%\"><h1>ENTER INPUT</h1><textarea  form = \"i\" rows= \"10\" cols= \"70\" name = \"input\" id = \"area\" onfocus=\"clear();\" >#{user_input}</textarea></td>
			<td style=\"width:45%\"><h1>OUTPUT</h1><textarea rows='10' cols='70' name = 'output' id='out' >#{user_output}</textarea></td></tr>
			<tr><td style=\"width:45%\">Select a file:<input type=\"file\" name=\"img\" id = 'fileinput' accept = '*.txt' ></td><script type='text/javascript' src = 'fileread.js' >
    			</script>")
			if username == "Guest"
			client.write("<td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" ></td>")
			else
			client.write("<td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" onclick = 'return empty();' >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" onclick=\"return validate();\"></td>")
			end
			client.write("</tr>
						</table><script src = 'ep.js'>			</script>
			</form>
			<br/><br/>
			</article></div><div id = \"footer\">
			<footer><table class = 'foot'><tr><td class = 'p'><div class = 'copyright' ><i>&copy; Developed by - Aakash Hs</i></div></td><td  class = 'q'><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' id = 'goog'></a></div></td><td class = 'r' ><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\"  id = 'twit'></div></a></td></tr></table></footer></div>
			</body></div>
			</html>")
		s.setChallengeName(challenge_name)
	end

	def self.print_output(response, client,  connection, s)
		username = s.getUsername()
		challenge_name = s.getChallengeName()
		count_login = s.getCountLogin()
		output = ""
		input = response.scan(/input=(.*)&output/).flatten.pop
		load_drop_down(client,connection, challenge_name, username, count_login)
		line = input.split('%0D%0A')
		whole_input = CGI.unescape(input)
		input_line = "ruby Task_scripts/#{challenge_name.gsub(' ','_')}.rb "
		line.each {|line| input = CGI.unescape(line);input_line += "\"#{input}\" "}
		client.write("
				<table style=\"width:90%\"><form id ='i'>
				<tr><td style=\"width:45%\"><h1>ENTER INPUT </h1>
				<textarea  form = \"i\" rows= \"10\" cols= \"70\" name = \"input\" id = \"area\"  onfocus=\"document.getElementById('out').value = '';\" >#{whole_input}</textarea></td>
				<td style=\"width:45%\"><h1>OUTPUT</h1><textarea  rows='10' cols='70' name = 'output' id='out' >")
		output = `#{input_line}`
		client.write("#{output}</textarea></td style=\"width:45%\"></tr><tr><td>Select a file:<input type=\"file\" name=\"img\" id=\"fileinput\">
			</td style=\"width:45%\"><script type='text/javascript' src = 'fileread.js'>
			     
    			</script><td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" onclick = 'return empty();' >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" onclick=\"return validate();\"></td></tr></table><script src = 'ep.js' >
</script></form><br/><br/>
			</article></div><div id = \"footer\">
			<footer><table class = 'foot'><tr><td class = 'p'><div class = 'copyright'><i>&copy; Developed by - Aakash Hs</i></div></td><td  class = 'q'><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' id = 'goog'></a></div></td><td  class = 'r'><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\"  id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
		current_time, current_date = CurrentTime.calc_time
		connection.exec "insert into challengehistory values ('#{username}','#{challenge_name}','#{current_date}','#{current_time}','#{whole_input}','#{output}')"
	end
end
class Compare
	def self.check(client, response, s, back = -1)
		challenge_name = s.getChallengeName()
		input = response.scan(/input=(.*)&output/).flatten.pop
		line = input.split('%0D%0A')
		input_line = "ruby Task_scripts/#{challenge_name.gsub(' ','_')}.rb "
		line.each {|line| input = CGI.unescape(line);input_line += "\"#{input}\" "}
		system_output = `#{input_line}`
		user_output = CGI.unescape(response.scan(/output=(.*)&img/).flatten.pop)
		user = user_output.strip.split("\r\n")
		system = system_output.strip.split(" \n")
		client.write "<html>
<head>
 <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
	<link rel='stylesheet' type = 'text/css' href = 'cmodal.css' >
<body onload = \"document.getElementById('id01').style.display='block'\">
<div id='id01' class='modal'>
  
  <form class='modal-content animate'>
    <div class='imgcontainer'>
      <span onclick=\"history.go(#{back});\" class='close' title='Close Modal'>&times;</span>
    </div>

    <div class='container'>
		<table align = 'center' width = 80% height = 20% cellspacing='5'><caption>#{challenge_name}</caption><br><br><th>User output</th><th>System output</th><th>Status</th>"

		for index in 0...(user.length)
			if user[index] == system[index]
p system[index]
				client.write "<tr><td align = 'center' style=\"width:40%;\"><pre>#{user[index]}</pre></td><td style = 'color:green;width:40%;' align = 'center'><pre>#{system[index]}</pre></td><td align = 'center' style=\"color : green;width:20%;\"><pre>Pass</pre></td></tr>"
			elsif user[index] != system[index]
				client.write "<tr><td align = 'center' style=\"width:40%;\"><pre>#{user[index]}</pre></td><td style = 'color:red;width:40%;' align = 'center'><pre>#{system[index]}</pre></td><td align = 'center' style=\"color : red;width:20%;\"><pre>Fail</pre></td></tr>"
			end
		end
	client.write "</table></div>

    <div class='container'>
      <button type='button' onclick=\"history.go(#{back});\" class='cancelbtn'>Go Back</button>
    </div>
  </form>
</div>

<script src = 'cmodal.js'>

</script>
</body>
</html>"

	end


end
