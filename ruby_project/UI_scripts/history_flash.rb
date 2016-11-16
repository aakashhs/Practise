class HistoryWithFlash
	def self.load_drop_down(client, username)
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>");
		client.write("<html><head><meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><style>
	#wrapper {
		min-height:100%;
		position:relative;
	}
	#header {
		height:10%;
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
                text-align: center;
                padding: 14px 45px;
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
                min-width: 160px;
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

		.modal {
		    display: none; /* Hidden by default */
		    position: fixed; /* Stay in place */
		    z-index: 1; /* Sit on top */
		    padding-top: 100px; /* Location of the box */
		    left: 0;
		    top: 0;
		    width: 100%; /* Full width */
		    height: 100%; /* Full height */
		    overflow: auto; /* Enable scroll if needed */
		    background-color: rgb(0,0,0); /* Fallback color */
		    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}


		.modal-content {
		    background-color: #fefefe;
		    margin: auto;
		    padding: 20px;
		    border: 1px solid #888;
		    width: 30%;
		}


		.close {
		    color: #aaaaaa;
		    float: right;
		    font-size: 28px;
		    font-weight: bold;
		}

		.close:hover,
		.close:focus {
		    color: red;
		    text-decoration: none;
		    cursor: pointer;
		}
		
		#goog:hover, #twit:hover {background-color: #eecffa;border-radius: 4px;}
		</style></head><div id = \"wrapper\"><body bgcolor = #eecffa><div id = \"header\">")
	end

	def self.view_challenge_history(challenge_name, connection, client, username, count_login, pdf_status = "mailed")
		load_drop_down(client, username)
		result = connection.exec "select * from challengehistory where name = '#{challenge_name}' and username = '#{username}' order by id desc"
		client.write("
<header><table bgcolor = 'black' style=\"width:100%\"><tr >
			<td style = \"text-align:left;width:15%;color:white;padding-top:12px;\"><h1>RUBY<h1></td>
<td height=\"50\" style = \"text-align:right;width:70%;color:white;padding-top:12px;padding-right:27%\">
			<h1>Challenges History</h1></td><td height=\"50\" style = \"width:15%;\">
			<ul>
              <li class='dropdown'>
                <a href='#' class='dropbtn'><img style = 'float:left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["#{username}.jpg"]}' alt='logo' />#{username}</a>
                <div class='dropdown-content'>
                  <a href = 'homepage'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["home.png"]}' />Home</a>
		<a href='userhistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["history.jpg"]}' alt='logo' /> User History(#{count_login})</a>
		<a href = 'contactus'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'data:image/jpeg;base64,#{Encoding::Images["contact_us.png"]}' /> Contact Us</a>
		<a href='login'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["logout.jpg"]}' />Log out</a>
                </div>
              </li>
            </ul></td></tr></table>
			</header><br></div><div id = \"content\">
		<div id=\"Text\" style=\"color : green;\"><center> <p> The pdf has been successfully #{pdf_status}! </p> </center></div><script type = \"text/javascript\">
    		setTimeout ( \"vanish()\", 30000 );
		function vanish(){
			document.getElementById(\"Text\").style.display = \"none\";
		}
		</script><br><br>
<article><table border = 1 cellpading = 10  colspan = 5 align = 'center'><tr><td>date</td><td>time</td><td>input</td><td>Output</td></tr>")
		result.each {|row| json_row = row.to_json
			json_data = JSON.parse(json_row);client.write("<tr><td>#{json_data['date']}</td><td>#{json_data['time']}</td><td><pre>#{json_data['input']}</pre></	td><td><pre>#{json_data['output']}</pre></td></tr>")}
		client.write("</table><br/>
<center><input type = 'submit' name = 'DownloadChallengePDF' value = 'Download PDF' id = 'downloadpdf'></center><br><br><br>
<!-- The Modal -->
<div id=\"myModal\" class=\"modal\">

  <!-- Modal content -->
  <div class=\"modal-content\">
    <span class=\"close\">[close]</span>
<form>
<input type=\"radio\" name = \"Downloadtask\" value = \"Downloadtask\">Download as Pdf<br/>
<input type=\"radio\" name = \"Downloadtask\" value = \"Downloadtaskmail\">Mail the Pdf<br/>
<input type=\"submit\" value = \"OK\" id=\"ok\"><br/>
</form>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById(\"downloadpdf\");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName(\"close\")[0];
var submit = document.getElementById('ok');
// When the user clicks the button, open the modal
btn.onclick = function() {
    modal.style.display = \"block\";
}
submit.onclick = function() {
    modal.style.display = \"none\";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = \"none\";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = \"none\";
    }
}
</script>

</article></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy;developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,#{Encoding::Images["google_plus.png"]}' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,#{Encoding::Images["Twitter_logo.png"]}\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
	end

	def self.view_login_history(connection, client, username, pdf_status = "mailed")
		load_drop_down(client, username)
		result = connection.exec "select * from loginhistory where username = '#{username}' order by id desc"
		client.write("
		<header><table bgcolor = 'black' style=\"width:100%\"><tr >
			<td style = \"text-align:left;width:15%;color:white;padding-top:12px;\"><h1>RUBY<h1></td>
<td height=\"50\" style = \"text-align:right;width:70%;color:white;padding-top:12px;padding-right:27%\">
			<h1>Login History</h1></td><td height=\"50\" style = \"width:15%;\">
			<ul>
              <li class='dropdown'>
                <a href='#' class='dropbtn'><img style = 'float:left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["#{username}.jpg"]}' alt='logo' />#{username}</a>
                <div class='dropdown-content'>
                 <a href = 'homepage'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["home.png"]}' />Home</a>
		<a href = 'contactus'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'data:image/jpeg;base64,#{Encoding::Images["contact_us.png"]}' /> Contact Us</a>
		<a href='login'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["logout.jpg"]}' />Log out</a>
                </div>
              </li>
            </ul></td></tr></table>
			</header><br><br></div>
		<div id=\"Text\" style=\"color : green;\"><center> <p> The pdf has been successfully #{pdf_status}! </p> </center></div><script type = \"text/javascript\">
    		setTimeout ( \"vanish()\", 30000 );
		function vanish(){
			document.getElementById(\"Text\").style.display = \"none\";
		}
		</script><br><br>
<div id = \"content\"><article><table><table align = 'center' border = 1 cellpading = 10 colspan = 5><tr><td>username</td><td>time</td><td>date</td></tr>")
		result.each {|row| json_row = row.to_json
			json_data = JSON.parse(json_row);client.write("<tr><td>#{json_data['username']}</td><td>#{json_data['time']}</td><td>#{json_data['date']}</td></tr>")}
		client.write("</table><br/>
		<center><input type = 'submit' name = 'loginhistoryPDF' value = 'Login History Pdf' id = 'downloadpdf'></center><br><br><br>
		<!-- The Modal -->
		<div id=\"myModal\" class=\"modal\">
		  <!-- Modal content -->
		  <div class=\"modal-content\">
		    <span class=\"close\">[close]</span>
			<form>
				<input type=\"radio\" name = \"Downloadlogin\" value = \"Downloadlogin\">Download as Pdf<br/>
				<input type=\"radio\" name = \"Downloadlogin\" value = \"Downloadloginmail\">Mail the Pdf<br/>
				<input type=\"submit\" value = \"OK\" id=\"ok\"><br/>
			</form>
		  </div>
		</div>
		<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById(\"downloadpdf\");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName(\"close\")[0];
		var submit = document.getElementById('ok');
		// When the user clicks the button, open the modal
		btn.onclick = function() {
		    modal.style.display = \"block\";
		}
		submit.onclick = function() {
		    modal.style.display = \"none\";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		    modal.style.display = \"none\";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = \"none\";
		    }
		}
		</script>
		</article></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,#{Encoding::Images["google_plus.png"]}' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,#{Encoding::Images["Twitter_logo.png"]}\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
	end

end
