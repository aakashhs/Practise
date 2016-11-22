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
			"content=\"width=device-width, initial-scale=1\"><link rel = 'stylesheet' type = 'text/css' href = 'lp.css'></head><header style='height:60px;border-radius:8px;'>"+
			"<table style=\"width:100%;\"><tbody><tr><td style=\"width:10%;color:white;padding-top:1%;\">"+
			"<h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>JAVA</h1></td><td style=\"width:84%;color:white;"+
			"text-align:center;padding-right:4%;padding-top:1%;\"><h1 style = '    margin-top: 0px;    margin-bottom: 0px;'>"+
			"Login</h1></td><td style = 'width:6%;'><button class = 'back' onclick='history.go("+back+");' >back</button>"+
			"</td></tr></tbody></table></header><br><br><body bgcolor = #eecffa>	<form method = 'get'>		"+
			"<div class = \"login\"><center><label><b>User Name :</b></label>&nbsp;<input type=\"text\" "+
			"placeholder=\"Enter Username\" name=\"uname\" required autofocus><br /><br /><br />			    <label>"+
			"<b>Password :</b></label>&nbsp;&nbsp;&nbsp;    <input type=\"password\" placeholder=\"Enter Password\" "+
			"name=\"psw\" id = 'pass' required><br /><br /><br />			    <button type=\"submit\"  >"+
			"Login</button><br>				<a href='signup' style=\"color: cadetblue;\">Sign Up?</a>			</center>"+
			"		</div>	<br><br><br><br><br><br>	<footer style='    padding-bottom: 8px;'><table bgcolor = 'black'"+
			" style=\"width:100%\"><tr><td style = \"width: 95%;\"><div style = \"align:left; color:white;\">"+
			"<i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'>"+
			"<a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" "+
			"src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'>"+
			"</a></div></td><td  style = \"width: 4%;\">	<div align='right'><a target=\"_blank\" "+
			"href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td>"+
			"</tr></table></footer></form></body></html>";
		return responseString;
	}

	public static String failPage(String responseString,Data s,int back) throws Exception{

		responseString = "<!DOCTYPE html-5><html><head>	<meta charset=\"utf-8\">	<meta name=\"viewport\" "+
			"content=\"width=device-width, initial-scale=1\"><link rel = 'stylesheet' type = 'text/css' href = 'lp.css'></head><header style = 'height:60px;border-radius:8px;'>"+
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
			"<input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'>"+
			"<a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr>"+
			"</table></footer></form></body></html>";
		return responseString;
	}

	public static String signup(String responseString,String message,int back, Data s) throws Exception{

		responseString = "<html><head><link rel = 'stylesheet' type = 'text/css' href = 'sp.css'></head><body><div id=\"load\"></div><div id=\"myModal\" class=\"modal\"> <div class=\"modal-content\">"+
			"    <span class=\"close\" onclick=\"history.go("+back+");\">&times;</span><form method = 'get' ><br><h1>SIGN UP"+
			"</h1><br><label>Name:</label><br><input type = 'text' placeholder=\"Name\" name = 'Name' id='name' "+
			"required onblur = 'redden(this)' /><br><br><label>Email-Id:</label><br><input type = 'text' "+
			"placeholder=\"Email-id\" name = 'Emailid' id = 'email' required onblur = 'redden(this)'"+
			" onchange='return validateForm();' /><br><br><textarea type=\"text\" placeholder=\"latlang\""+
			" style = \"display:none\" readonly id = \"info\" name=\"latitude\"></textarea><label>Address:</label>"+
			"<br><textarea placeholder = \"Drag pointer on map to select your address\" readonly name = \"address\""+
			" id = \"address\"rows = 3 cols = 19></textarea><script type=\"text/javascript\""+
			" src=\"http://maps.google.com/maps/api/js?sensor=false\"></script>					"+
			"<script type=\"text/javascript\" src = 'maps.js' ></script>"+
			"<div id=\"mapCanvas\"></div><br> <div id=\"infoPanel\" style='width:50%;'>					    "+
			"<div id=\"markerStatus\"></div>				    <div id=\"info\"></div>					    <div id=\"address\">"+
			"</div> </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"+
			"<label>User Name :</label><br><input placeholder=\"User Name\" type = 'text' max-length = '10' name = 'Userid' required id='userid'"+
			" onblur = 'redden(this)' /><br><br><div id = 'taken' style = \"color:red;\">"+message+"</div>"+
			"<label>Password :</label><br><input placeholder=\"Password\" type = 'password' name = 'password' required id = 'pass'"+
			" onblur = 'redden(this)'  /><br><br><label>Confirm Password :</label><br>"+
			"<input placeholder=\"Confirm Password\" type = 'password' name = 'confirmPassword' required id = 'cpass'"+
			"onblur = 'redden(this)'  /><br><span id='message'></span><br><input type = 'submit'"+
			" name = 'Submit' value = 'Submit' id='submit' onclick = 'checkName()' required /><br>"+
			"</form></div></div><script src = 'sp.js' ></script>"+
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
			"<meta name='viewport' content='width=device-width, initial-scale=1'><link rel = 'stylesheet' type = 'text/css' href = 'pf.css'></head>	<body onload = \"document.getElementById('id01').style.display='block'\">			"+
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
			"  </form>				</div>				<script src = 'pfmodal.js' >	</script>			</body>				</html>";
		return responseString;
	}

	public static void update( Statement stmt, Data s, String inString) throws Exception{
		String address = URLDecoder.decode(s.extract("updateaddress=(.*)&yo",inString),"UTF-8");
		String coordinates = URLDecoder.decode(s.extract("&yo=(.*) ",inString),"UTF-8");
		stmt.executeUpdate("update jcredentials set address = '"+address+"', coordinates = '"+coordinates+"' where username = '"+s.getUsername()+"'");
	}

}
