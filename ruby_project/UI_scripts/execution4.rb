class Execution
	def self.load_drop_down(client, connection, challenge_name, username = "Guest", count_login = "")
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>");
		result = connection.exec "select count(*) from challengehistory where challenge_name = '#{challenge_name}' and username = '#{username}'"
		count = 0
		result.each {|row| json_row = row.to_json
			json_data = JSON.parse(json_row);count = json_data['count'].to_i}
		client.write("<html><head><meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><style>
		#wrapper {
			min-height:100%;
			position:relative;
		}
		#header {width:98%;
					border-radius: 8px;
			background:black;
			padding:10px;
		}
		#content {
			padding-bottom:50px; /* Height of the footer element */
		}
		#footer {
		padding-top:10px;
			background:black;
			width:100%;
			height:50px;
			position:absolute;
			bottom:0;
			left:0;
					border-radius: 8px;
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
			min-width:120px;
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
		#goog:hover, #twit:hover {background-color: #eecffa;border-radius: 4px;}
		#desc{ width:100%;}
            </style></head><div id = \"wrapper\">
		<body bgcolor = #eecffa><div id = \"header\" style=\"height:70px;\">
		<header><table bgcolor = 'black' style=\"width:100%\"><tr >
			<td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">RUBY</h1></td>
<td  style = \"text-align:center;width:88%;color:white;\">
			<h1 style = \"padding-top:1%;\">#{challenge_name}</h1></td><td style = \"width:6%;\"><ul>
              <li  class='dropdown'>")
                if username == "Guest"
			client.write("<a href='#' class='dropbtn' style=\"font-size:112%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align: middle;' 
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
		<a href = 'homepage'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["home.png"]}' />Home</a>
		<a href = 'contactus'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'data:image/jpeg;base64,#{Encoding::Images["contact_us.png"]}' /> Contact Us</a>")
		if username != "Guest"
		client.write("<a href='challengehistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["history.jpg"]}' alt='logo' />Challenge History(#{count})</a>
		<a href='userhistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["history.jpg"]}' alt='logo' /> User History(#{count_login})</a>
		
		<a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["logout.jpg"]}' />Log out</a>")
		else
		client.write("<a href='login$fromvulcan$' id><img style = 'float: left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/png;base64,#{Encoding::Images["login.png"]}' alt='logo' /> Log In</a>
		<a href='signup$fromvulcan$'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/png;base64,#{Encoding::Images["signup.png"]}' /> Sign Up</a>")
		end
                client.write("</div>
              </li>
            </ul></td></tr></table>
			</header></div><br><br><div id = \"content\"><article><div id = \"desc\">")
		result=connection.exec "select description from challenges where challenge_name = '#{challenge_name}'"
		result.each{|row| json_row = row.to_json
			json_data = JSON.parse(json_row);client.write("<h1>Description</h1><pre style=\"white-space:pre-wrap;\">#{json_data['description']}</pre>")}
	end

	def self.execute_desc(response, client, connection, username = "Guest", count_login = "", challenge_name = "",compare_input = "")
		user_output=""
		user_input=""
		if compare_input != ""
			puts user_output = CGI.unescape(compare_input.scan(/output=(.*)&img/).flatten.pop)
			puts user_input = CGI.unescape(compare_input.scan(/input=(.*)&output/).flatten.pop)
		end
		challenge_name = CGI.unescape(response.scan(/exec\$(.*)% /).flatten.pop) if challenge_name == ""
		load_drop_down(client, connection, challenge_name, username, count_login)
		client.write("</div>
			<table style=\"width:100%\"><form id ='i'>
			<tr><td style=\"width:45%\"><h1>ENTER INPUT</h1><textarea style=\"resize:vertical;width:100%; height:100%;\" form = \"i\" rows= \"10\" cols= \"70\" name = \"input\" id = \"area\" onfocus=\"clear();\" >#{user_input}</textarea></td>
			<td style=\"width:45%\"><h1>OUTPUT</h1><textarea style=\"resize:vertical;width:100%; height:100%;\" rows='10' cols='70' name = 'output' id='out' >#{user_output}</textarea></td></tr>
			<tr><td style=\"width:45%\">Select a file:<input type=\"file\" name=\"img\" id = 'fileinput'></td><script type='text/javascript'>
			      function readSingleFile(evt) {
			        //Retrieve the first (and only!) File from the FileList object
			        var f = evt.target.files[0]; 

			        if (f) {
				 var r = new FileReader();
				 r.onload = function(e) { 
				     var contents = e.target.result;
				   document.getElementById('area').value=  contents;
				 }
				 r.readAsText(f);

			        } else { 
				 alert('Failed to load file');
			        }
			      }

			      document.getElementById('fileinput').addEventListener('change', readSingleFile, false);
    			</script>")
			if username == "Guest"
			client.write("<td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" ></td>")
			else
			client.write("<td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" onclick = 'return empty();' >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" onclick=\"return validate();\"></td>")
			end
			client.write("</tr>
						</table><script>
			function clear(){
			document.getElementById('out').innerHTML='';
			}
			function empty(){
			if(document.getElementById('area').value == ''){
			document.getElementById('out').style.border='1px solid darkgrey';
			document.getElementById('area').style.border='3px solid red';
			return false;}

			}
			function validate(){
			var inp = document.getElementById('area');
			var out = document.getElementById('out');
			if(inp.value == '' && out.value == '')
			{
			inp.style.border='3px solid red';
			out.style.border='3px solid red';
			return false;
			}
			else if (inp.value == '')
			{
			inp.style.border='3px solid red';
			out.style.border='1px solid darkgrey';
			return false;
			}
			else if(out.value == ''){
			inp.style.border='1px solid darkgrey';
			out.style.border='3px solid red';
			return false;
			}
			}</script>
			</form>
			<br/><br/>
			</article></div><div id = \"footer\">
			<footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,#{Encoding::Images["google_plus.png"]}' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,#{Encoding::Images["Twitter_logo.png"]}\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div>
			</body></div>
			</html>")
		return challenge_name
	end

	def self.print_output(response, client, challenge_name, connection, username, count_login)
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
				<textarea style=\"resize:vertical;width:100%; height:100%;\" form = \"i\" rows= \"10\" cols= \"70\" name = \"input\" id = \"area\"  onfocus=\"document.getElementById('out').value = '';\" >#{whole_input}</textarea></td>
				<td style=\"width:45%\"><h1>OUTPUT</h1><textarea style=\"resize:vertical;width:100%; height:100%;\" rows='10' cols='70' name = 'output' id='out' >")
		output = `#{input_line}`
		client.write("#{output}</textarea></td style=\"width:45%\"></tr><tr><td>Select a file:<input type=\"file\" name=\"img\" id=\"fileinput\">
			</td style=\"width:45%\"><script type='text/javascript'>
			      function readSingleFile(evt) {
			        //Retrieve the first (and only!) File from the FileList object
			        var f = evt.target.files[0]; 

			        if (f) {
				 var r = new FileReader();
				 r.onload = function(e) { 
				     var contents = e.target.result;
				   document.getElementById('area').value=  contents;
				 }
				 r.readAsText(f);
			        } else { 
				 alert('Failed to load file');
			        }
			      }

			      document.getElementById('fileinput').addEventListener('change', readSingleFile, false);
    			</script><td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" onclick = 'return empty();' >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" onclick=\"return validate();\"></td></tr></table><script>
function empty(){
if(document.getElementById('area').value == ''){
document.getElementById('out').style.border='1px solid darkgrey';
document.getElementById('area').style.border='3px solid red';
return false;}

}
function validate(){
var inp = document.getElementById('area');
var out = document.getElementById('out');
if(inp.value == '' && out.value == '')
{
inp.style.border='3px solid red';
out.style.border='3px solid red';
return false;
}
else if (inp.value == '')
{
inp.style.border='3px solid red';
out.style.border='1px solid darkgrey';
return false;
}
else if(out.value == ''){
inp.style.border='1px solid darkgrey';
out.style.border='3px solid red';
return false;
}
}</script></form><br/><br/>
			</article></div><div id = \"footer\">
			<footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,#{Encoding::Images["google_plus.png"]}' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,#{Encoding::Images["Twitter_logo.png"]}\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
		current_time, current_date = CurrentTime.calc_time
		connection.exec "insert into challengehistory values ('#{username}','#{challenge_name}','#{current_date}','#{current_time}','#{whole_input}','#{output}')"
	end
	def self.check(client, response, challenge_name, back = -1)
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
<style>

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #E9D4E8;
}


.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}


.modal {
    display: none; 
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgb(0,0,0); 
    background-color: rgba(0,0,0,0.4); 
    padding-top: 60px;
}


.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; 
    border: 1px solid #888;
    width: 50%; 
}


.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}


.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)}
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)}
    to {transform: scale(1)}
}


@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
<body onload = \"document.getElementById('id01').style.display='block'\">
<div id='id01' class='modal'>
  
  <form class='modal-content animate'>
    <div class='imgcontainer'>
      <span onclick=\"history.go(#{back});\" class='close' title='Close Modal'>&times;</span>
      
    </div>

    <div class='container'>
		<table align = 'center' width = 80% height = 20% cellspacing='5'><caption style = 'font-size:30px;'>#{challenge_name}</caption><br><br><th>User output</th><th>System output</th><th>Status</th>"

		for index in 0...(user.length)
			if user[index] == system[index]
p system[index]
				client.write "<tr><td align = 'center' style=\"width:40%;\"><pre>#{user[index]}</pre></td><td style = 'color:green;width:40%;' align = 'center'><pre>#{system[index]}</pre></td><td align = 'center' style=\"color : green;width:20%;\"><pre>Pass</pre></td></tr>"
			elsif user[index] != system[index]
				client.write "<tr><td align = 'center' style=\"width:40%;\"><pre>#{user[index]}</pre></td><td style = 'color:red;width:40%;' align = 'center'><pre>#{system[index]}</pre></td><td align = 'center' style=\"color : red;width:20%;\"><pre>Fail</pre></td></tr>"
			end
		end
	client.write "</table></div>

    <div class='container' style='background-color:#f1f1f1'>
      <button type='button' onclick=\"history.go(#{back});\" class='cancelbtn'>Go Back</button>
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

span.onclick = function() {
    modal.style.display = 'none';
    
}
var btn = document.getElementById('myBtn');
btn.onclick = function() {
    modal.style.display = 'block';
}


</script>
</body>
</html>"

	end


end
