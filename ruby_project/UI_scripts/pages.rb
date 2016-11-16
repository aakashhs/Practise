class Pages
	def self.login_page(client)
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<!DOCTYPE html-5><html><head>	<meta charset=\"utf-8\">	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">	<style>		header {				    color: white;					font-size: 250%;	  					width:100%;    background-color: black;				    clear: left;				    text-align: center;				    position: relative;				}		footer {		padding-top:10px;				    color: white;				    bottom : 0;				border-radius:8px;					width : 99%;				    background-color: black;				    clear: left;				    text-align: center;				    position: fixed;				}		input[type=text], select {		    width: 70%;		    padding: 12px 20px;		    margin: 8px 0;		    display: inline-block;		    border: 1px solid #ccc;		    border-radius: 4px;		    box-sizing: border-box;		}		input[type=password], select {		    width: 70%;		    padding: 12px 20px;		    margin: 8px 0;		    display: inline-block;		    border: 1px solid #ccc;		    border-radius: 4px;		    		}		button[type=submit] {		    width: 30%;		    background-color: #4CAF50;		    color: white;		    padding: 14px 20px;		    margin: 8px 0;		    border: none;		    border-radius: 4px;		    cursor: pointer;		}		button[type=submit]:hover {		    background-color: #45a049;		}		div.login {		width: 30%;		    height: 300px;		    background-color: white;		    margin:0 auto;		    margin-top: 40px;		    padding-top: 30px;		    padding-left: 40px;		     padding-right: 40px;			padding-bottom: 30px;		    border-radius: 5px;		    color: black;		    font-weight: bolder;		    font-size: 18px;		}		#goog:hover, #twit:hover {background-color: #eecffa;border-radius: 4px;}	button.back{    border: none;    background-color: #eecffa;    color: black;    padding: 8px 10px;    margin: 8px 0;    border-radius: 4px;    cursor: pointer;} </style></head><header style='height:60px;border-radius:8px;'><table style=\"width:100%;\"><tbody><tr><td style=\"width:10%;color:white;padding-top:1%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>JAVA</h1></td><td style=\"width:84%;color:white;text-align:center;padding-right:4%;padding-top:1%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>Login</h1></td><td style = 'width:6%;'><button class = 'back' onclick='history.go(-1);' >go back?</button></td></tr></tbody></table></header><br><br><body bgcolor = #eecffa>	<form method = 'get'>		<div class = \"login\">		<center>			    <label><b>User Name :</b></label><input type=\"text\" placeholder=\"Enter Username\" name=\"uname\" required autofocus><br /><br /><br />			    <label><b>Password :</b></label>&nbsp;&nbsp;			    <input type=\"password\" placeholder=\"Enter Password\" name=\"psw\" required><br /><br /><br />			    <button type=\"submit\">Login</button><br>				<a href='signup' style=\"color: cadetblue;\">Sign Up?</a>			</center>		</div>		<footer style='    padding-bottom: 8px;'><table bgcolor = 'black' style=\"width:100%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,#{Encoding::Images["google_plus.png"]}' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,#{Encoding::Images["Twitter_logo.png"]}\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer>	</form></body></html>")
	end

	def self.fail_page(client)
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<!DOCTYPE html-5><html><head>	<meta charset=\"utf-8\">	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">	<style>	header {			    color: white;			border-radius: 8px;				font-size: 250%;				width:100%;			    background-color: black;			    clear: left;			    text-align: center;			    position: relative;			}	footer {padding-top:10px;			    color: white;			border-radius: 8px;			    bottom : 0;				width : 99%;			    background-color: black;			    clear: left;			    text-align: center;			    position: fixed;			}	input[type=text], select {	    width: 70%;	    padding: 12px 20px;	    margin: 8px 0;	    display: inline-block;	    border: 1px solid #ccc;	    border-radius: 4px;	    box-sizing: border-box;	}	input[type=password], select {	    width: 70%;	    padding: 12px 20px;	    margin: 8px 0;	    display: inline-block;	}	button[type=submit] {	    width: 90%;	    background-color: #4CAF50;	    color: white;	    padding: 14px 20px;	    margin: 8px 0;	    border: none;	    border-radius: 4px;	    cursor: pointer;	}	button[type=submit]:hover {    background-color: #45a049;	}	div.login {	width: 30%;	    height: 350px;	    background-color: white;	    margin:0 auto;	    margin-top: 40px;	    padding-top: 30px;	    padding-left: 40px;	     padding-right: 40px;		padding-bottom: 30px;	    border-radius: 5px;	    color: black;	    font-weight: bolder;	    font-size: 18px;	}	#goog:hover, #twit:hover {background-color: #eecffa;}	button.back{    border: none;    background-color: #eecffa;    color: black;    padding: 8px 10px;    margin: 8px 0;    border-radius: 4px;    cursor: pointer;}</style></head><header style = 'height:60px;border-radius:8px;'><table style=\"width:100%;\"><tbody><tr><td style=\"width:10%;color:white;padding-top:1%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>JAVA</h1></td><td style=\"width:84%;color:white;text-align:center;padding-right:8%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>Login</h1></td><td style = 'width:6%;'><button class = 'back' onclick='history.go(-2);' >go back?</button></td></tr></tbody></table></header><br><br><body bgcolor = #eecffa>	<form method = 'get'>		<div class = \"login\">			<center>			    <label><b>User Name :</b></label>			    <input type=\"text\" placeholder=\"Enter Username\" name=\"uname\" style = \"border-color : red;\" required autofocus><br /><br /><br />			    <label><b>Password :</b></label>&nbsp;&nbsp;			    <input type=\"password\" placeholder=\"Enter Password\" name=\"psw\" style = \"border-color : red;\" required><br /><br /><br />			    <button type=\"submit\">Login</button>		<br><a href='signup' style=\"color: cadetblue;\">Sign Up?</a>			<p style = \"color : red; font-size : 200%\">Authentication Failed!!</p>			</center>		</div>		<footer style='    padding-bottom: 8px;'><table bgcolor = 'black' style=\"width:100%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,#{Encoding::Images["google_plus.png"]}' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,#{Encoding::Images["Twitter_logo.png"]}\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></form></body></html>")
	end
	def self.signup(client, message = "", back = -1)
		client.write("<html>
<head><style>
#load{
    width:100%;
    height:100%;
    position:fixed;
    z-index:9999;
    background:url(\"https://www.creditmutuel.fr/cmne/fr/banques/webservices/nswr/images/loading.gif\") no-repeat center center rgba(0,0,0,0.25)
}
.modal {
		    display: none;
		    position: relative;
		    z-index: 1; 
		    
		    left: 0;
		    top: 0;
		    width: 100%; 
		    height: 100%;
		    overflow: auto; 
		    background-color: rgb(0,0,0);
		    background-color: rgba(0,0,0,0.4); 
		}


		.modal-content {
		    background-color: #fefefe;
		    margin: auto;
		    padding: 20px;
		    border: 1px solid #888;
		    width: 60%;
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
input[type=text], select {
		    width: 70%;
		    padding: 12px 20px;
		    margin: 8px 0;
		    display: inline-block;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    box-sizing: border-box;
		}
		input[type=password], select {
		    width: 70%;
		    padding: 12px 20px;
		    margin: 8px 0;
		    display: inline-block;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    
		}

textarea, select {
		    width: 70%;
		    padding: 12px 20px;
		    margin: 8px 0;
		    display: inline-block;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    
		}

		input[type=submit] {
		    width: 30%;
		    background-color: #4CAF50;
		    color: white;
		    padding: 14px 20px;
		    margin: 8px 0;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		}

		button[type=submit]:hover {
		    background-color: #45a049;
		}
		 #mapCanvas {
		    width: 500px;
		   height: 400px;
		   float: left;
		  }
		  #infoPanel {
		   float: left;
		    margin-left: 10px;
		  }
		  #infoPanel div {
		    margin-bottom: 5px;
		 }

</style></head>
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
					<script type=\"text/javascript\">
					var geocoder = new google.maps.Geocoder();

					function geocodePosition(pos) {
					  geocoder.geocode({
					    latLng: pos
					  }, function(responses) {
					    if (responses && responses.length > 0) {
					      updateMarkerAddress(responses[0].formatted_address);
					    } else {
					      updateMarkerAddress('Cannot determine address at this location.');
					    }
					  });
					}

					function updateMarkerStatus(str) {
					  document.getElementById('markerStatus').innerHTML = str;
					}

					function updateMarkerPosition(latLng) {
					  var user_location = document.getElementById('info').innerHTML = [
					    latLng.lat(),
					    latLng.lng()
					  ].join(', ');
					}

					function updateMarkerAddress(str) {
					   var user_address = document.getElementById('address').innerHTML = str;
					}

					function initialize() {
					  var latLng = new google.maps.LatLng(12.994182,77.6657547 );
					  var map = new google.maps.Map(document.getElementById('mapCanvas'), {
					    zoom: 8,
					    center: latLng,
					    mapTypeId: google.maps.MapTypeId.ROADMAP
					  });
					  var marker = new google.maps.Marker({
					    position: latLng,
					    title: 'Point A',
					    map: map,
					    draggable: true
					  });

					  // Update current position info.
					  updateMarkerPosition(latLng);
					  geocodePosition(latLng);

					  // Add dragging event listeners.
					  google.maps.event.addListener(marker, 'dragstart', function() {
					    updateMarkerAddress('Dragging...');
					  });

					  google.maps.event.addListener(marker, 'drag', function() {
					
					    updateMarkerPosition(marker.getPosition());
					  });

					  google.maps.event.addListener(marker, 'dragend', function() {
					
					    geocodePosition(marker.getPosition());
					  });
					}

					// Onload handler to fire off the app.
					google.maps.event.addDomListener(window, 'load', initialize);
					</script>
					<div id=\"mapCanvas\"></div><br>
					  <div id=\"infoPanel\" style='width:50%;'>
					    <div id=\"markerStatus\"></div>
					    
					    <div id=\"info\"></div>
					    <div id=\"address\"></div>
					  </div><br>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><label>User Name :</label><br><input placeholder=\"User Name\" type = 'text' name = 'Userid' required id='userid' onblur = 'redden(this)' /><br><br>
<div id = 'taken' style = \"color:red;\">#{message}</div>
<label>Password :</label><br>
<input placeholder=\"Password\" type = 'password' name = 'password' required id = 'pass' onblur = 'redden(this)' onchange = 'check()' /><br><br>
<label>Confirm Password :</label><br>
<input placeholder=\"Confirm Password\" type = 'password' name = 'confirmPassword' required id = 'cpass' onblur = 'redden(this)' onchange = 'check()' /><br>
<span id='message'></span><br>
<input type = 'submit' name = 'Submit' value = 'Submit' id='submit' required /><br>
</form>
</div>
</div>
<script>
function validateForm() {
    var x = document.getElementById('email').value;
    var atpos = x.indexOf(\"@\");
    var dotpos = x.lastIndexOf(\".\");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert(\"Not a valid e-mail address\");
        return false;
    }
}
function redden(field) {
if(field.value == ''){
	field.style.borderColor = \"red\";}
else{
field.style.borderColor = \"#ccc\";}
}
function check() {
    if(document.getElementById('pass').value === document.getElementById('cpass').value) {
        document.getElementById('message').innerHTML = \"\";
	document.getElementById('message').style.color = \"green\";
	document.getElementById(\"submit\").disabled = false;
    } else {
        document.getElementById('message').innerHTML = \"Passwords do not match\";
	document.getElementById('message').style.color = \"red\";
document.getElementById(\"submit\").disabled = true;
    }
}
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById('modalin');
var pass = document.getElementById('pass').innerHTML;
var cpass = document.getElementById('cpass').innerHTML;
// Get the <span> element that closes the modal
var span = document.getElementsByClassName('close')[0];
var submit = document.getElementById('submit');
// When the user clicks the button, open the modal
window.onload = function() {
    modal.style.display = 'block';
	document.getElementById(\"submit\").disabled = true;
}
submit.onclick = function() {
    modal.style.display = 'none';
}

// When the user clicks on <span> (x), close the modal
/*span.onclick = function() {
    modal.style.display = 'none';
}*/

// When the user clicks anywhere outside of the modal, close it
/*window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = 'none';
    }
}*/
document.onreadystatechange = function () {
  var state = document.readyState
  if (state == 'complete') {
         document.getElementById('interactive');
         document.getElementById('load').style.visibility=\"hidden\";
  }
}
</script>
</body>
</html>")
	end
	def self.load_Page(nav, client, connection, response, username, count_login, challenge_name)
		puts count_login
		if nav == "Klingon"
			puts "in klingin"
			Tasklist.load_task_list(client, connection, username, count_login)
		elsif nav == "Xandar"
			Contact.emailus(client, username, count_login)
		elsif nav == "vulcan"
			puts "in vulcabds"
			challenge_name = Execution.execute_desc(response, client, connection, username, count_login, challenge_name)
		end
	end
end
