package UI_codes;
import java.net.*;
import java.util.*;
import java.util.Base64;
import java.text.SimpleDateFormat;
import java.nio.file.*;
import java.sql.*;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import javax.xml.bind.DatatypeConverter;
public class Pages{
	public static String login(String responseString, Data s, int back) throws Exception{

		responseString = "<!DOCTYPE html-5><html><head>	<meta charset=\"utf-8\">	<meta name=\"viewport\" "+
			"content=\"width=device-width, initial-scale=1\">	<style>		header {				    color: white;"+
			"					font-size: 250%;	  					width:100%;    background-color: black;				"+
			"    clear: left;				    text-align: center;				    position: relative;				}		"+
			"footer {		padding-top:10px;				    color: white;				    bottom : 0;				"+
			"border-radius:8px;					width : 100%;				    background-color: black;				  "+
			"  clear: left;				    text-align: center;				    position: relative;				}		"+
			"input[type=text], select {		    width: 65%;		    padding: 12px 20px;		    margin: 8px 0;		  "+
			" display: inline-block;		    border: 1px solid #ccc;		    border-radius: 4px;		    box-sizing: border-box;		}"+
			"		input[type=password], select {		    width: 65%;		    padding: 12px 20px;		    margin: 8px 0;		 "+
			"   display: inline-block;		    border: 1px solid #ccc;		    border-radius: 4px;		    		}		"+
			"button[type=submit] {		    width: 30%;		    background-color: #4CAF50;		    color: white;		"+
			"    padding: 14px 20px;		    margin: 8px 0;		    border: none;		    border-radius: 4px;		   "+
			" cursor: pointer;		}		button[type=submit]:hover {		    background-color: #45a049;		}		"+
			"div.login {		width: 30%;		    height: 300px;		    background-color: white;		    margin:0 auto;		"+
			"    margin-top: 40px;		    padding-top: 30px;		    padding-left: 40px;		     padding-right: 40px;			"+
			"padding-bottom: 30px;		    border-radius: 5px;		    color: black;		    font-weight: bolder;		 "+
			"   font-size: 18px;		}		#goog:hover, #twit:hover {background-color: #eecffa;border-radius: 4px;}"+
			"	button.back{    border: none;    background-color: #eecffa;   float:right; color: black;    padding: 12% 10%;    margin: 10% 0;   "+
			" border-radius: 4px;    cursor: pointer;} </style></head><header style='height:60px;border-radius:8px;'>"+
			"<table style=\"width:100%;\"><tbody><tr><td style=\"width:10%;color:white;padding-top:1%;\">"+
			"<h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>JAVA</h1></td><td style=\"width:84%;color:white;"+
			"text-align:center;padding-right:4%;padding-top:1%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>"+
			"Login</h1></td><td style = 'width:6%;'><button class = 'back' onclick='history.go("+back+");' >back</button>"+
			"</td></tr></tbody></table></header><br><br><body bgcolor = #eecffa>	<form method = 'get'>		"+
			"<div class = \"login\">		<center><label><b>User Name :</b></label>&nbsp;<input type=\"text\" "+
			"placeholder=\"Enter Username\" name=\"uname\" required autofocus><br /><br /><br />			    <label>"+
			"<b>Password :</b></label>&nbsp;&nbsp;&nbsp;    <input type=\"password\" placeholder=\"Enter Password\" "+
			"name=\"psw\" id = 'pass' required><br /><br /><br />			    <button type=\"submit\"  >"+
			"Login</button><br>				<a href='signup' style=\"color: cadetblue;\">Sign Up?</a>			</center>"+
			"		</div>	<br><br><br><br><br><br>	<footer style='    padding-bottom: 8px;'><table bgcolor = 'black'"+
			" style=\"width:100%\"><tr><td style = \"width: 95%;\"><div style = \"align:left; color:white;\">"+
			"<i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'>"+
			"<a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" "+
			"src='data:image/jpeg;base64,"+s.encoding("google_plus.png","png")+"' height = \"30\" width = \"30\" id = 'goog'>"+
			"</a></div></td><td  style = \"width: 4%;\">	<div align='right'><a target=\"_blank\" "+
			"href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,"+
			s.encoding("Twitter_logo.png","png")+"\" height = \"30\" width = \"30\" id = 'twit'></div></a></td>"+
			"</tr></table></footer>	</form></body></html>";
		return responseString;
	}

	public static String failPage(String responseString,Data s,int back) throws Exception{

		responseString = "<!DOCTYPE html-5><html><head>	<meta charset=\"utf-8\">	<meta name=\"viewport\" "+
			"content=\"width=device-width, initial-scale=1\">	<style>	header {			    color: white;		"+
			"	border-radius: 8px;				font-size: 250%;				width:100%;			    "+
			"background-color: black;			    clear: left;			    text-align: center;			    position: relative;		"+
			"	}	footer {padding-top:10px;			    color: white;			border-radius: 8px;			    bottom : 0;	"+
			"			width : 100%;			    background-color: black;			    clear: left;			    text-align: center;	"+
			"		    position: relative;			}	input[type=text], select {	    width: 65%;	    padding: 12px 20px;	   "+
			" margin: 8px 0;	    display: inline-block;	    border: 1px solid #ccc;	    border-radius: 4px;	    box-sizing: border-box;	"+
			"}	input[type=password], select {	    width: 65%;	    padding: 12px 20px;	    margin: 8px 0;	    display: inline-block;"+
			"	}	button[type=submit] {	    width: 90%;	    background-color: #4CAF50;	    color: white;	    padding: 14px 20px;"+
			"	    margin: 8px 0;	    border: none;	    border-radius: 4px;	    cursor: pointer;	}	"+
			"button[type=submit]:hover {    background-color: #45a049;	}	div.login {	width: 30%;	    height: 350px;"+
			"	    background-color: white;	    margin:0 auto;	    margin-top: 40px;	    padding-top: 30px;	   "+
			" padding-left: 40px;	     padding-right: 40px;		padding-bottom: 30px;	    border-radius: 5px;	"+
			"    color: black;	    font-weight: bolder;	    font-size: 18px;	}	#goog:hover, #twit:hover {background-color: #eecffa;}"+
			"	button.back{    border: none;    background-color: #eecffa; float:right;   color: black;    padding: 12% 10%;    margin: 10% 0; "+
			"   border-radius: 4px;    cursor: pointer;}</style></head><header style = 'height:60px;border-radius:8px;'>"+
			"<table style=\"width:100%;\"><tbody><tr><td style=\"width:10%;color:white;padding-top:1%;\">"+
			"<h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>JAVA</h1></td><td style=\"width:84%;color:white;"+
			"text-align:center;padding-right:8%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>Login</h1>"+
			"</td><td style = 'width:6%;'><button class = 'back' onclick='history.go("+back+");' >back</button></td>"+
			"</tr></tbody></table></header><br><br><body bgcolor = #eecffa>	<form method = 'get'>		"+
			"<div class = \"login\">			<center>			    <label><b>User Name :</b></label>		"+
			"	    <input type=\"text\" placeholder=\"Enter Username\" name=\"uname\" style = \"border-color : red;\" "+
			"required autofocus><br /><br /><br />			    <label><b>Password :</b></label>&nbsp;&nbsp;			 "+
			"   <input type=\"password\" placeholder=\"Enter Password\" name=\"psw\" style = \"border-color : red;\" required>"+
			"<br /><br /><br />	    <button type=\"submit\">Login</button>		<br><a href='signup'"+
			" style=\"color: cadetblue;\">Sign Up?</a>			<p style = \"color : red; font-size : 200%\">"+
			"Authentication Failed!!</p>			</center>		</div>	<br><br><br><br><br><br>	"+
			"<footer style='    padding-bottom: 8px;'><table bgcolor = 'black' style=\"width:100%\"><tr><td style = \"width: 92%;\">"+
			"<div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\">"+
			"<div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'>"+
			"<input type=\"image\" src='data:image/jpeg;base64,"+s.encoding("google_plus.png","png")+
			"' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'>"+
			"<a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,"+
			s.encoding("Twitter_logo.png","png")+"\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr>"+
			"</table></footer></form></body></html>";
		return responseString;
	}

	public static String signup(String responseString,String message,int back, Data s) throws Exception{

		responseString = "<html><head><style>#load{    width:100%;    height:100%;    position:fixed;    z-index:9999; "+
			"   background:url(\"https://www.creditmutuel.fr/cmne/fr/banques/webservices/nswr/images/loading.gif\") no-repeat center center rgba(0,0,0,0.25)}"+
			"\r\n .modal {		    display: none;		    position: relative;		    z-index: 1; 		    left: 0;		    top: 0;	"+
			"	    width: 100%; 		    height: 100%;		    overflow: auto; 		    background-color: rgb(0,0,0);		  "+
			"  background-color: rgba(0,0,0,0.4); 		}		.modal-content {		    background-color: #fefefe;		"+
			"    margin: auto;		    padding: 20px;		    border: 1px solid #888;		    width: 60%;		}		"+
			".close {		    color: #aaaaaa;		    float: right;		    font-size: 28px;		    font-weight:"+
			" bold;		}	.close:hover,		.close:focus {		    color: red;		    text-decoration: none;		"+
			"    cursor: pointer;		}input[type=text], select {		    width: 70%;		    padding: 12px 20px;		"+
			"    margin: 8px 0;		    display: inline-block;		    border: 1px solid #ccc;		    border-radius: 4px;	"+
			"	    box-sizing: border-box;		}		input[type=password], select {		    width: 70%;		"+
			"    padding: 12px 20px;		    margin: 8px 0;		    display: inline-block;		    border: 1px solid #ccc;		"+
			"    border-radius: 4px;		}textarea, select {		    width: 70%;		    padding: 12px 20px;		   "+
			" margin: 8px 0;		    display: inline-block;		    border: 1px solid #ccc;		    border-radius: 4px;		"+
			"    }		input[type=submit] {		    width: 30%;		    background-color: #4CAF50;		    color: white;	"+
			"	    padding: 14px 20px;		    margin: 8px 0;		    border: none;		    border-radius: 4px;		   "+
			" cursor: pointer;		}		button[type=submit]:hover {		    background-color: #45a049;		}	"+
			"#mapCanvas {		    width: 500px;		   height: 400px;		   float: left;		  }		  #infoPanel {	"+
			"	   float: left;		    margin-left: 10px;		  }		  #infoPanel div {		    margin-bottom: 5px;		 }	"+
			" </style></head><body><div id=\"load\"></div><div id=\"myModal\" class=\"modal\"> <div class=\"modal-content\">"+
			"    <span class=\"close\" onclick=\"history.go("+back+");\">&times;</span><form method = 'get' ><br><h1>SIGN UP"+
			"</h1><br><label>Name:</label><br><input type = 'text' placeholder=\"Name\" name = 'Name' id='name' "+
			"required onblur = 'redden(this)' /><br><br><label>Email-Id:</label><br><input type = 'text' "+
			"placeholder=\"Email-id\" name = 'Emailid' id = 'email' required onblur = 'redden(this)'"+
			" onchange='return validateForm();' /><br><br><textarea type=\"text\" placeholder=\"latlang\""+
			" style = \"display:none\" readonly id = \"info\" name=\"latitude\"></textarea><label>Address:</label>"+
			"<br><textarea placeholder = \"Drag pointer on map to select your address\" readonly name = \"address\""+
			" id = \"address\"rows = 3 cols = 19></textarea><script type=\"text/javascript\""+
			" src=\"http://maps.google.com/maps/api/js?sensor=false\"></script>					"+
			"<script type=\"text/javascript\">					var geocoder = new google.maps.Geocoder();\r\n			"+
			"		function geocodePosition(pos) {\r\n					  geocoder.geocode({\r\n					"+
			"    latLng: pos\r\n					  }, function(responses) {\r\n					"+
			"    if (responses && responses.length > 0) {\r\n					   "+
			"   updateMarkerAddress(responses[0].formatted_address);\r\n					    } else {\r\n				"+
			"	      updateMarkerAddress('Cannot determine address at this location.');\r\n					    }\r\n			"+
			"		  });\r\n					}\r\n					function updateMarkerStatus(str) {\r\n				"+
			"	  document.getElementById('markerStatus').innerHTML = str;\r\n					}\r\n					"+
			"function updateMarkerPosition(latLng) {\r\n					 "+
			" var user_location = document.getElementById('info').innerHTML = [\r\n					    latLng.lat(),\r\n	"+
			"				    latLng.lng()\r\n					  ].join(', ');\r\n					}\r\n				"+
			"	function updateMarkerAddress(str) {\r\n					"+
			"   var user_address = document.getElementById('address').innerHTML = str;\r\n					}\r\n	"+
			"				function initialize() {\r\n					  var latLng = new google.maps.LatLng(12.994182,77.6657547 );"+
			"\r\n					  var map = new google.maps.Map(document.getElementById('mapCanvas'), {\r\n					"+
			"    zoom: 8,\r\n					    center: latLng,\r\n					    mapTypeId: google.maps.MapTypeId.ROADMAP"+
			"\r\n					  });\r\n					  var marker = new google.maps.Marker({\r\n					  "+
			"  position: latLng,\r\n					    title: 'Point A',\r\n					    map: map,\r\n		"+
			"			    draggable: true\r\n					  });\r\n					  updateMarkerPosition(latLng);"+
			"\r\n					  geocodePosition(latLng);\r\n					"+
			"  google.maps.event.addListener(marker, 'dragstart', function() {\r\n					"+
			"    updateMarkerAddress('Dragging...');\r\n					  });\r\n					"+
			"  google.maps.event.addListener(marker, 'drag', function() {\r\n				"+
			"	    updateMarkerPosition(marker.getPosition());\r\n					  });\r\n	"+
			"				  google.maps.event.addListener(marker, 'dragend', function() {\r\n				"+
			"	    geocodePosition(marker.getPosition());\r\n					  });\r\n					}\r\n	"+
			"				google.maps.event.addDomListener(window, 'load', initialize);\r\n					</script>"+
			"<div id=\"mapCanvas\"></div><br> <div id=\"infoPanel\" style='width:50%;'>					    "+
			"<div id=\"markerStatus\"></div>				    <div id=\"info\"></div>					    <div id=\"address\">"+
			"</div> </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"+
			"<label>User Name :</label><br><input placeholder=\"User Name\" type = 'text' name = 'Userid' required id='userid'"+
			" onblur = 'redden(this)' /><br><br><div id = 'taken' style = \"color:red;\">"+message+"</div>"+
			"<label>Password :</label><br><input placeholder=\"Password\" type = 'password' name = 'password' required id = 'pass'"+
			" onblur = 'redden(this)'  /><br><br><label>Confirm Password :</label><br>"+
			"<input placeholder=\"Confirm Password\" type = 'password' name = 'confirmPassword' required id = 'cpass'"+
			"onblur = 'redden(this)'  /><br><span id='message'></span><br><input type = 'submit'"+
			" name = 'Submit' value = 'Submit' id='submit' onclick = 'checkName()' required /><br>"+
			"</form></div></div><script>function validateForm() {\r\n    var x = document.getElementById('email').value;\r\n    var atpos = x.indexOf(\"@\");\r\n    "+
			"var dotpos = x.lastIndexOf(\".\");\r\n    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {\r\n      "+
			"  alert(\"Not a valid e-mail address\");\r\n        return false;\r\n    }\r\n}\r\nfunction redden(field) {"+
			"\r\nif(field.value == ''){\r\n	field.style.borderColor = \"red\";}\r\nelse{\r\nfield.style.borderColor = \"#ccc\";"+
			"}\r\n}\r\n"+
			"\r\nvar modal = document.getElementById('myModal');\r\nvar btn = document.getElementById('modalin');"+
			"\r\nvar pass = document.getElementById('pass').innerHTML;\r\nvar cpass = document.getElementById('cpass').innerHTML;"+
			"\r\nvar span = document.getElementsByClassName('close')[0];\r\nvar submit = document.getElementById('submit');"+
			"\r\nwindow.onload = function() {\r\n    modal.style.display = 'block';\r\n	"+
			"\r\n}\r\nsubmit.onclick = function() {\r\n   "+
			" modal.style.display = 'none';\r\n}\r\ndocument.onreadystatechange = function () {\r\n  var state = document.readyState;"+
			"\r\n if (state == 'complete') {	\r\n			       document.getElementById('interactive');\r\n			"+
			"		 document.getElementById('load').style.visibility=\"hidden\";\r\n				  }\r\n}\r\n</script>"+
			"</body></html>";
		return responseString;
	}
	public static String profile(String responseString, ResultSet res, Statement stmt, Data s, int back) throws Exception{
		String name = null;
		String address = null;
		String email = null;
		String coordinates = null;
		res = stmt.executeQuery("select * from jcredentials where username = '"+s.getUsername()+"';");
		while (res.next()){
			name = res.getString("name");
			address = res.getString("address");
			email = res.getString("emailid");
			coordinates = res.getString("coordinates");
		}
		responseString = "<html><head>				 <meta charset='utf-8'>				  "+
			"<meta name='viewport' content='width=device-width, initial-scale=1'>				<style>		"+
			"		#load{				    width:100%;				    height:100%;				    position:fixed;			"+
			"	    z-index:9999;				    background:url(\"https://www.creditmutuel.fr/cmne/fr/banques/webservices/nswr/images/loading.gif\") no-repeat center center rgba(0,0,0,0.25)				}	\r\n			"+
			"input[type=text], input[type=password] {				    width: 100%;				    padding: 12px 20px;	"+
			"			    margin: 8px 0;				    display: inline-block;				    border: 1px solid #ccc;		"+
			"		    box-sizing: border-box;				}				button {				    background-color: #4CAF50;	"+
			"			    color: white;				    padding: 14px 20px;				    margin: 8px 0;				   "+
			" border: none;				    cursor: pointer;				    width: 100%;				}				"+
			".cancelbtn {				    width: auto;				    padding: 10px 18px;				    background-color:"+
			"#f44336;				}				.imgcontainer {				    text-align: center;				   "+
			" margin: 24px 0 12px 0;				    position: relative;				}				img.avatar {				"+
			"    width: 40%;				    border-radius: 50%;				}				.container {				    "+
			"padding: 16px;				}				span.psw {				    float: right;				    "+
			"padding-top: 16px;				}				.modal {				    display: none; 				   "+
			" position: fixed; 				    z-index: 1; 				    left: 0;				    top: 0;				  "+
			"  width: 100%; 				    height: 100%; 				    overflow: auto; 				   "+
			" background-color: rgb(0,0,0); 				    background-color: rgba(0,0,0,0.4); 		}				"+
			".modal-content {				    background-color: #fefefe;				    margin: 5% auto 15% auto; 			"+
			"	    border: 1px solid #888;				    width: 80%; 	}				.close {				  "+
			"  position: absolute;				    right: 25px;				    top: 0;				    color: #000;				"+
			"    font-size: 35px;				    font-weight: bold;				}				.close:hover,			"+
			"	.close:focus {				    color: red;				    cursor:pointer;				}				"+
			".animate {				    -webkit-animation: animatezoom 0.6s;				    animation: animatezoom"+
			" 0.6s				}				@-webkit-keyframes animatezoom {				   "+
			" from {-webkit-transform: scale(0)}				    to {-webkit-transform: scale(1)}				}			"+
			"	@keyframes animatezoom {				    from {transform: scale(0)}				    "+
			"to {transform: scale(1)}				}				@media screen and (max-width: 300px) {				"+
			"    span.psw {				       display: block;				       float: none;				    }				"+
			"    .cancelbtn {				       width: 100%;				    }				}				.size{			"+
			"		font-size:20px;				}				input[type = 'submit']{				    width: 100px;	"+
			"			    height: 35px;				    border: 0;				    border-radius: 5px;				"+
			"    background-color: #00A79D;				    font-weight: bolder;				    color:white;				}		"+
			"		</style>				<body onload = \"document.getElementById('id01').style.display='block'\">			"+
			"	<div id=\"load\"></div>				<div id='id01' class='modal'>				   <form class='modal-content"+
			" animate'>				    <div class='imgcontainer'><span onclick=\"history.go("+back+
			");\" class='close' title='Close Modal'>&times;</span></div>				    <div class='container'>	"+
			"			     <table width = 100% height = 100% cellspacing='5'>					<caption class = 'size'>"+s.getUsername()+
			" PROFILE</caption>					<tr><td class = 'size'>NAME</td><td class = 'size'>"+name+
			"</td></tr>	<tr><td class = 'size'>EMAIL-ID</td><td class = 'size'>"+email+
			"</td></tr>				<form>					<tr><td class = 'size'>ADDRESS</td><td><textarea rows = 7 "+
			"cols = 30 style = \"resize:none\" readonly name = \"updateaddress\" id = 'address'>"+address+
			"</textarea></td><td><script type=\"text/javascript\" src=\"http://maps.google.com/maps/api/js?sensor=false\">"+
			"</script>				<script type=\"text/javascript\">				var geocoder = new google.maps.Geocoder();"+
			"\r\n		function geocodePosition(pos) {\r\n				  geocoder.geocode({\r\n				    latLng: pos"+
			"\r\n				  }, function(responses) {\r\n				    if (responses && responses.length > 0) {\r\n"+
			"				      updateMarkerAddress(responses[0].formatted_address);\r\n				    } else {\r\n	"+
			"			      updateMarkerAddress('Cannot determine address at this location.');\r\n				    }\r\n		"+
			"		  });\r\n				}\r\n				function updateMarkerStatus(str) {\r\n				 "+
			" document.getElementById('markerStatus').innerHTML = str;\r\n				}\r\n				"+
			"function updateMarkerPosition(latLng) {\r\n				  var user_location = document.getElementById('info').innerHTML = [\r\n"+
			"				    latLng.lat(),\r\n				    latLng.lng()\r\n				  ].join(', ');\r\n		"+
			"		}\r\n				function updateMarkerAddress(str) {\r\n				   "+
			"var user_address = document.getElementById('address').innerHTML = str;\r\n				}\r\n			"+
			"	function initialize() {\r\n				  var latLng = new google.maps.LatLng("+coordinates+
			");\r\n				  var map = new google.maps.Map(document.getElementById('mapCanvas'), {\r\n			"+
			"	    zoom: 15,\r\n				    center: latLng,\r\n				    mapTypeId: google.maps.MapTypeId.ROADMAP"+
			"\r\n				  });\r\n				  var marker = new google.maps.Marker({\r\n				  "+
			"  position: latLng,\r\n				    title: '"+name+"',\r\n				    map: map,\r\n				"+
			"    draggable: true\r\n				  });\r\n				  updateMarkerPosition(latLng);\r\n			"+
			"	  geocodePosition(latLng);\r\n				  google.maps.event.addListener(marker, 'dragstart', function() {"+
			"\r\n				    updateMarkerAddress('Dragging...');\r\n				  });\r\n				 "+
			" google.maps.event.addListener(marker, 'drag', function() {\r\n				    "+
			"updateMarkerPosition(marker.getPosition());\r\n				  });\r\n			"+
			"	  google.maps.event.addListener(marker, 'dragend', function() {\r\n				  "+
			"  geocodePosition(marker.getPosition());\r\n				  });\r\n				}\r\n"+
			"				google.maps.event.addDomListener(window, 'load', initialize);\r\n			"+
			"	</script>				</head>				<body>				  <style>				  #mapCanvas {	"+
			"			    width: 500px;				    height: 400px;				    float: left;				  }		"+
			"		  #infoPanel {				    float: left;				    margin-left: 10px;				  }			"+
			"	  #infoPanel div {				    margin-bottom: 5px;				  }				  </style>				"+
			"  <div id=\"mapCanvas\"></div>				  <div id=\"infoPanel\">				    <div id=\"markerStatus\">"+
			"</div>				    <textarea id=\"info\" style = 'color:yellow;display:none;' name = 'yo' ></textarea>	"+
			"			  </div></td>				</tr>				<tr>					<td></td><td></td><td>"+
			"<input type = 'submit' value = 'Update' class = 'sub'></td>				</tr></form>				</table>	"+
			"				</h2>				    </div>				    <div class='container' style='background-color:#f1f1f1'>"+
			" <button type='button' onclick=\"history.go("+back+");\" class='cancelbtn'>Go Back</button></div>			"+
			"  </form>				</div>				<script>				var modal = document.getElementById('id01');"+
			"\r\n				var btn = document.getElementById('myBtn');\r\n				btn.onclick = function(){"+
			"\r\n				    modal.style.display = 'block';\r\n				}\r\n			</script>"+
			"	<script>document.onreadystatechange = function () {\r\n				  var state = document.readyState\r\n	"+
			"			  if (state == 'complete') {\r\n							  document.getElementById('interactive');"+
			"\r\n					 document.getElementById('load').style.visibility=\"hidden\";\r\n				 		"+
			"	  }\r\n				}</script>			</body>				</html>";
		return responseString;
	}

	public static void update( Statement stmt, Data s, String inString) throws Exception{
		String address = URLDecoder.decode(s.extract("updateaddress=(.*)&yo",inString),"UTF-8");
		String coordinates = URLDecoder.decode(s.extract("&yo=(.*) ",inString),"UTF-8");
		stmt.executeUpdate("update jcredentials set address = '"+address+"', coordinates = '"+coordinates+"' where username = '"+s.getUsername()+"'");
	}

}
