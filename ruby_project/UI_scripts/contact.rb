class Contact
	def self.emailus(client, username = "Guest", count_login = "", flash = false)
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<html>
		<meta charset=\"utf-8\">
		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><head><style>
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
				    height: 670px;
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
		</style></head><div id = \"wrapper\"><body bgcolor = #eecffa><div id = \"header\" style=\"height:70px;\"><header><table bgcolor = 'black' style=\"width:100%;\"><tr ><td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">RUBY</h1></td>
<td  style = \"text-align:center;width:88%;color:white;\">
			<h1 style = \"padding-top:1%;\">Contact Form</h1></td><td style = \"width:6%;\"><ul>
              <li class='dropdown'>")
		if username == "Guest"
			client.write("<a href='#' class='dropbtn' style=\"font-size:112%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align: sub;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["msuser1.jpg"]}' alt='logo' />Guest</a>")
		else
			if Encoding::Images.include?("#{username}.jpg")
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align:sub;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["#{username}.jpg"]}' alt='logo' />#{username}</a>")
			else
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align:sub;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["msuser1.jpg"]}' alt='logo' />#{username}</a>")
			end
		end
                
                client.write("<div class='dropdown-content'>           
			 <a href = 'homepage'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["home.png"]}' />Home</a>")
		if username != "Guest"
		client.write("<a href='userhistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["history.jpg"]}' alt='logo' /> User History(#{count_login})</a>
		<a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["logout.jpg"]}' />Log out</a>")	else
		client.write("<a href='login$fromXandar$' id><img style = 'float: left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/png;base64,#{Encoding::Images["login.png"]}' alt='logo' /> Log In</a>
		<a href='signup$fromXandar$'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/png;base64,#{Encoding::Images["signup.png"]}' /> Sign Up</a>") end
                client.write("</div>
              </li>
            </ul></td></tr></table></header></div>")

client.write("<div id=\"Text\" style=\"color : green;\"><center> <p> Your Feedback has been successfully mailed! </p> </center></div><script type = \"text/javascript\">
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
			</article><br><br></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,#{Encoding::Images["google_plus.png"]}' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,#{Encoding::Images["Twitter_logo.png"]}\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
	end
end
