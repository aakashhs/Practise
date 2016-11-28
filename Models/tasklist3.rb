class Tasklist
	def self.load_task_list(client, connection, s)
		username = s.getUsername()
		count_login = s.getCountLogin()
		resindex = 0
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<html>
			<head> 
				<meta charset=\"utf-8\">
				<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
				<link rel = 'stylesheet' type = 'text/css' href = 'tl.css'>
				<link rel = 'stylesheet' type = 'text/css' href = 'style.css'>
			</head>
			<div id = \"wrapper\">
			<body>
			<div id = \"header\">
			<header>
			<table class = 'a' >
			<tr >
			<td class = 'b' >
				<h1 class = 'ha'>RUBY</h1>
			</td>
			<td  class = 'c'>
				<h1 class='hb' >Challenges List</h1>
			</td>
			<td class = 'd'>
				<div class=\"dropdown\" >")
		if username == "Guest"
			client.write("<a href='#' class='dropbtn' >
					<img class = 'topim' src='msuser1.png' alt='logo' />Guest
					</a>")
		else
			client.write("<a href='profile' class='dropbtn'>
					<img class = 'topim' src='msuser1.png' alt='logo' />#{username}
					</a>")
		end
                client.write("<div class='dropdown-content'>
					<a href = 'contactus'><img class = 'im' src = 'feedback.png' /> Contact Us</a>")
		if username != "Guest"
                 client.write(" <a href='userhistory' id = 'userhistory'>
					<img class = 'im'src='history.png' alt='logo' /> User History(#{count_login})
					</a>
					<a href='tasklist'>
						<img class = 'im' src='logout.png' />Log out
					</a>") 
		else
		client.write("<a href='login$fromKlingon$' id>
					<img class = 'im' src='login.png' alt='logo' /> Log In
					</a>
					<a href='signup$fromKlingon$'>
					<img class = 'im' src='signup.png' /> Sign Up
					</a>")
		end
		client.write("</div>
				</div>
			</td>
			</tr>
			</table>
			</header>
			</div><br>
			<div id = \"content\">
			<article>
			<br><br>")
		 res = connection.exec("select challenge_name from challenges order by challenge_name limit 6 offset 0")
			 index = 1
				client.write("<center><div id = \"res\">
				<table border = '1' id = 'content-table' class='tablesorter' >
					<thead>
						<tr>
							<th style = 'width:5%'>S.No</th>
			    	        		<th ><h3>Challenge Name</h3></th>
							<th style = 'width:5%'>Action</th>
						</tr>
					</thead>
					<tbody>")
		res.each do |row| 
		       client.write("<tr><td align='center' > #{index}</td>
					 	           	<td  align='center' class=\"country\" >#{row['challenge_name']} </td>
		                    				<td align='center' > <a href=\"/exec$#{row['challenge_name']}%\"><input type = \"button\" value = \"Go To Challenge\"></a></td></tr>")
               index  += 1
		end
		client.write("</tbody></table></div>")
		count = 0
		res = connection.exec("select count(*) from challenges ")
		res.each { |row| count = row['count'].to_i }
		resindex = count / 6
		resindex += 1 if count % 6 != 0
		client.write("<br><br><table>
						<tr>
							<td >
								<button type = \"button\" class = 'i'  id = \"prev\"  value = \"#{resindex}\">\<\<</button>
							</td>")
		(resindex).times { |i| client.write("<td >
								<button type = \"button\" class = 'i'  id = \"#{i+1}\" onclick = 'loadTable(#{i})' value = \"1\">#{i+1}</button></td>")}
		client.write("<td >
						<button type = \"button\" class = 'i' id = \"next\" value = \"4\">\>\></button>
  </td></tr></table></center>")

		client.write("<br/><br/>
			</article>
			</div>
			<div id = \"footer\">
			<footer>
			<table class = 'foot' >
			<tr>
				<td class = 'p' ><div class = 'copyright'><i>&copy; Developed by - Aakash Hs</i></div></td>
				<td class = 'q' ><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png'  id = 'goog'></a></div></td>
				<td  class = 'r'><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" id = 'twit'></div></a></td>
			</tr>
			</table>
			</footer>
			</div>
			</body>
			<script type=\"text/javascript\" src=\"jquery-latest.js\"></script> 
			<script type=\"text/javascript\" src=\"jquery-tablesorter.js\"></script>
			<script type=\"text/javascript\" src = 'tl.js'></script>
			</div>
			</html>")
		return username
	end
end
class Pagination
	def self.send_content(response, client, connection)
		offset = response.scan(/page(.*) /).flatten.pop.to_i * 6
		res = connection.exec("select * from challenges order by challenge_name LIMIT 6 OFFSET #{offset}")
		resp = "";
		offset += 1;
		res.each { |row|
			resp += "<tr>
				<td align='center' >#{offset}</td>
				<td align='center' class=\"country\" >#{row["challenge_name"]}</td>
				<td align='center' ><a href='/exec$#{row["challenge_name"]}%' ><input type = \"button\" value = \"Go To Challenge\"></a></td>
				</tr>";
			offset += 1;
		}
		client.write(resp);
		client.flush();
	end
end

