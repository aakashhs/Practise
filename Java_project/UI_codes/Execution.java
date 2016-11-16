package UI_codes;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.Base64;
import java.text.SimpleDateFormat;
import java.nio.file.*;
import java.sql.*;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import javax.xml.bind.DatatypeConverter;
public class Execution{
	public static String loadDropdown(String responseString, Statement stmt, ResultSet res, Data s) throws Exception{
		String username = s.getUsername();
		int countLogin = s.getCountLogin();
		String challengeName = s.getChallengeName();
		responseString = "<html><head><meta charset=\"utf-8\">  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"+
			"<style>#wrapper {	min-height:100%;	position:relative;}#header {width:98%;			border-radius: 8px;"+	
			"background:black;	padding:10px;}#content {	padding-bottom:50px; }#footer {padding-top:10px;	background:black;"+	
			"width:100%;	height:50px;	position:absolute;	bottom:0;	left:0;			border-radius: 8px;}		"+
			"ul {                list-style-type: none;                margin: 0;                padding: 0;                overflow: hidden;             "+
			"   background-color: black;               }            	li {                float: left;            	}            	li a, .dropbtn {		"+
			"       display: inline-block;		       color: white;		       text-align: right;		       padding: 12px 16px;		"+
			"	min-width:120px;		       text-decoration: none;            	}            	li a:hover, .dropdown:hover .dropbtn {          "+
			"     	 background-color: #eecffa;color:black;            	}		   li.dropdown {		       display: inline-block;		   }  "+
			"          	.dropdown-content {                display: none;                position: absolute;                background-color: #f9f9f9;     "+
			"           min-width: 120px;                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);            }            .dropdown-content a {          "+
			"      color: black;                padding: 12px 16px;                text-decoration: none;                display: block;                text-align:"+
			" left;            }            .dropdown-content a:hover {background-color: #FFE4B5}            .dropdown:hover .dropdown-content"+
			" {                display: block;            }		#goog:hover, #twit:hover {background-color: #eecffa;border-radius: 4px;}	"+
			"	#desc{ width:100%;}            </style></head><div id = \"wrapper\">		<body bgcolor = #eecffa>"+
			"<div id = \"header\" style=\"height:70px;\">		<header><table bgcolor = 'black' style=\"width:100%\"><tr >	"+
			"		<td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">JAVA</h1></td>"+
			"<td  style = \"text-align:center;width:88%;color:white;\">			<h1 style = \"padding-top:1%;\">"+challengeName+
			"</h1></td><td style = \"width:6%;\"><ul>              <li  class='dropdown'>";
		if(username == "Guest"){
			responseString += "<a href='#' class='dropbtn' style=\"font-size:121%;\"><img style = 'width: 20px;height:"+
				" 20px;background: #555;vertical-align: middle;'                   src='data:image/jpeg;base64,"+s.encoding("msuser1.jpg","jpg")+
				"' alt='logo' /> Guest</a>";
		}
		else
		{
			responseString += "<a href='profile' class='dropbtn' style = \"font-size:121%;\">"+
				"<img style = 'width: 20px;height: 20px;background: #555;vertical-align:sub;'                   src='data:image/jpeg;base64,"+
				s.encoding("msuser1.jpg","jpg")+"' alt='logo' /> "+username+"</a>";
		}
		responseString += "<div class='dropdown-content'>                  		<a href = 'homepage'>"+
			"<img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,"+
			s.encoding("home.png","png")+"' /> Home</a>		<a href = 'contactus'><img style = 'float: left;width: 20px;height:"+
			" 20px;background: #555;' src = 'data:image/jpeg;base64,"+s.encoding("contact_us.png","png")+"' /> Contact Us</a>";
		int count = 0;
		res = stmt.executeQuery("select count(*) from jchallengehistory where challenge_name = '"+challengeName+"' and username = '"+username+"'");
		while (res.next()){
			count = res.getInt("count");
		}
		if(username != "Guest"){
			responseString += "<a href='challengehistory'><img style = 'float: left;width: 20px;height: 20px;background:"+
				" #555;'                   src='data:image/jpeg;base64,"+s.encoding("history.jpg","jpg")+"' alt='logo' /> Challenge History("+
				count+")</a>		<a href='userhistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;'   "+
				"src='data:image/jpeg;base64,"+s.encoding("history.jpg","jpg")+"' alt='logo' /> User History("+countLogin+
				")</a><a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;background: #555;'"+
				" src='data:imagejpeg;base64,"+s.encoding("logout.jpg","jpg")+"' /> Log out</a>";
		}
		else
		{
			responseString += "<a href='login$fromvulcan$' id><img style = 'float: left;width: 20px;height: 20px;background:"+
				" #555;' src='data:image/png;base64,"+s.encoding("login.png","png")+"' alt='logo' /> Log In</a>	"+
				"	<a href='signup$fromvulcan$'><img style = 'float: left;width: 20px;height: 20px;background: #555;' "+
				"src='data:image/png;base64,"+s.encoding("signup.png","png")+"' /> Sign Up</a>";
		}
		responseString += "</div></li></ul></td></tr></table></header></div><br><br><div id = \"content\"><article><div id = \"desc\">";
		String description=null;
		res = stmt.executeQuery("select description from jchallenges where challenge_name = '"+challengeName+"'");
		while (res.next()){
			description = res.getString("description");
		}
		responseString += "<h1>Description</h1><pre style=\"white-space:pre-wrap;\">"+description+"</pre>";
		return responseString;
	}

	public static String executeDesc(String responseString , Statement stmt, ResultSet res, Data s) throws Exception{
		String challengeName = null;
		String userInput = "",userOutput = "";
		if(s.getInputResponse()!=""){
			userInput = URLDecoder.decode(s.extract("input=(.*)&output",s.getInputResponse()),"UTF-8");
			userOutput = URLDecoder.decode(s.extract("output=(.*)&img",s.getInputResponse()),"UTF-8");
			s.setInputResponse("");
		}
		String username = s.getUsername();
		int countLogin = s.getCountLogin();
		responseString = loadDropdown(responseString, stmt, res, s);
		responseString += "</div><table style=\"width:100%\"><form id ='i'><tr><td style=\"width:45%\">"+
			"<h1>ENTER INPUT</h1><textarea style=\"resize:vertical;width:100%; height:100%;\" form = \"i\" rows= \"10\" "+
			"cols= \"70\" name = \"input\" id = \"area\" onfocus=\"document.getElementById('out').value='';\" >"+
			userInput+"</textarea></td>			<td style=\"width:45%\"><h1>OUTPUT</h1>"+
			"<textarea style=\"resize:vertical;width:100%; height:100%;\" rows='10' cols='70' name = 'output' id='out' >"+
			userOutput+"</textarea></td></tr>			<tr><td style=\"width:45%\">Select a file:"+
			"<input type=\"file\" name=\"img\" id = 'fileinput'></td><script type='text/javascript'>			      "+
			"function readSingleFile(evt) { \r\n        var f = evt.target.files[0];  \r\n			        if (f) { \r\n	"+
			" var r = new FileReader(); \r\n	 r.onload = function(e) {  \r\n     var contents = e.target.result; \r\n	"+
			"			   document.getElementById('area').value=  contents; \r\n				 } \r\n				"+
			" r.readAsText(f); \r\n			        } else {  \r\n				 alert('Failed to load file'); \r\n		"+
			"} \r\n} \r\n document.getElementById('fileinput').addEventListener('change', readSingleFile, false); </script>";
		if(username == "Guest"){
			responseString += "<td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\""+
				" >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" ></td>";
		}else{
			responseString += "<td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" "+
				"onclick = 'return empty();' >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" "+
				"form = \"i\" onclick=\"return validate();\"></td>";
		}
		responseString += "</tr></table><script>function empty(){\r\nif(document.getElementById('area').value == ''){"+
			"\r\ndocument.getElementById('out').style.border='1px solid darkgrey';\r\n"+
			"document.getElementById('area').style.border='3px solid red';\r\nreturn false;}\r\n"+
			"\r\nif(document.getElementById('out').value != ''){\r\ndocument.getElementById('out').value = '';\r\n"+
			"return true;\r\n}\r\n}\r\nfunction validate(){\r\nvar inp = document.getElementById('area');\r\n"+
			"var out = document.getElementById('out');\r\nif(inp.value == '' && out.value == '')\r\n{\r\n"+
			"inp.style.border='3px solid red';\r\nout.style.border='3px solid red';\r\nreturn false;\r\n}\r\n"+
			"else if (inp.value == '')\r\n{\r\ninp.style.border='3px solid red';\r\nout.style.border='1px solid darkgrey';"+
			"\r\nreturn false;\r\n}\r\nelse if(out.value == ''){\r\ninp.style.border='1px solid darkgrey';\r\n"+
			"out.style.border='3px solid red';\r\nreturn false;\r\n}\r\n}</script>	</form><br/><br/></article>"+
			"</div><div id = \"footer\">	<footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\">"+
			"<div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,"+
			s.encoding("google_plus.png","png")+"' height = \"30\" width = \"30\" id = 'goog'></a></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'>"+
			"<input type=\"image\" src=\"data:image/jpeg;base64,"+s.encoding("Twitter_logo.png","png")+
			"\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>";
		return responseString;
	}

	public static String printOutput(String responseString ,String inString, Statement stmt, ResultSet res, Data s) throws Exception{
		String challengeName = null;
		String userOutput = "";
		String username = s.getUsername();
		int countLogin = s.getCountLogin();
		responseString = loadDropdown(responseString, stmt, res, s);
		String extractedInput = s.extract("input=(.*)&output",inString);
		String inputString = URLDecoder.decode(extractedInput,"UTF-8");
		responseString += "</div><table style=\"width:100%\"><form id ='i'><tr><td style=\"width:45%\">"+
			"<h1>ENTER INPUT</h1><textarea style=\"resize:vertical;width:100%; height:100%;\" form = \"i\" rows= \"10\" "+
			" cols= \"70\" name = \"input\" id = \"area\" onfocus=\"document.getElementById('out').value='';\" >"+inputString+
			"</textarea></td>			<td style=\"width:45%\"><h1>OUTPUT</h1><textarea style=\"resize:vertical;width:100%; height:100%;\" rows='10' cols='70' name = 'output' id='out' >";
		challengeName = s.getChallengeName();		
		Process p = new ProcessBuilder("javac","/host_msuser1/workspace/training2016/Java_project/Task_codes/"+challengeName.replace(" ","")+".java").start();
		Process p2 = new ProcessBuilder("chmod","777","/host_msuser1/workspace/training2016/Java_project/Task_codes/"+challengeName.replace(" ","")+".class").start();
		String[] inputLines = extractedInput.split("%0D%0A");
		List<String> command = new ArrayList<String>();
		command.add("java");
		command.add("-cp");
       		command.add("/host_msuser1/workspace/training2016/Java_project/Task_codes/");
		command.add(challengeName.replace(" ",""));
		for(int arg = 0;arg<inputLines.length;arg++){
			command.add(URLDecoder.decode(inputLines[arg],"UTF-8"));
		}
		Process p1 = new ProcessBuilder(command).start();		
		BufferedReader input = new BufferedReader(new InputStreamReader(p1.getInputStream()));
     		String line = null; 
		while ((line = input.readLine()) != null){
         		responseString += line+"\r\n";
			userOutput += line.trim()+"\r\n";
		}
		responseString += "</textarea></td></tr><tr><td style=\"width:45%\">Select a file:"+
			"<input type=\"file\" name=\"img\" id = 'fileinput'></td><script type='text/javascript'>     "+
			"function readSingleFile(evt) { \r\n        var f = evt.target.files[0];  \r\n			        "+
			"if (f) { \r\n	 var r = new FileReader(); \r\n	 r.onload = function(e) {  \r\n     var contents = e.target.result; \r\n	"+
			"			   document.getElementById('area').value=  contents; \r\n				 } \r\n				 r.readAsText(f); "+
			"\r\n			        } else {  \r\n				 alert('Failed to load file'); \r\n			        } \r\n			      } "+
			"\r\n			      document.getElementById('fileinput').addEventListener('change', readSingleFile, false);    	"+
			"</script><td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" onclick = 'return empty();' "+
			" >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" onclick=\"return validate();\">"+
			"</td></tr>			</table><script>\r\nfunction empty(){\r\nif(document.getElementById('area').value == ''){"+
			"\r\ndocument.getElementById('out').style.border='1px solid darkgrey';\r\n"+
			"document.getElementById('area').style.border='3px solid red';\r\nreturn false;}\r\n"+
			"if(document.getElementById('out').value != ''){\r\nalert(\"Please clear the output field\");\r\nreturn false;\r\n}\r\n}"+
			"\r\nfunction validate(){\r\nvar inp = document.getElementById('area');\r\nvar out = document.getElementById('out');\r\n"+
			"if(inp.value == '' && out.value == '')\r\n{\r\ninp.style.border='3px solid red';\r\nout.style.border='3px solid red';"+
			"\r\nreturn false;\r\n}\r\nelse if (inp.value == '')\r\n{\r\ninp.style.border='3px solid red';"+
			"\r\nout.style.border='1px solid darkgrey';\r\nreturn false;\r\n}\r\nelse if(out.value == ''){"+
			"\r\ninp.style.border='1px solid darkgrey';\r\nout.style.border='3px solid red';\r\nreturn false;\r\n}\r\n}"+
			"</script>	</form><br/><br/>	</article></div><div id = \"footer\">	<footer><table bgcolor = 'black' style=\"width:98%\">"+
			"<tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'>"+
			"<input type=\"image\" src='data:image/jpeg;base64,"+s.encoding("google_plus.png","png")+
			"' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'>"+
			"<a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,"+
			s.encoding("Twitter_logo.png","png")+"\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div>	</body></div>			</html>";
		String time = s.getTime();
		String date = s.getDate();
		stmt.executeUpdate("insert into jchallengehistory values ('"+username+"','"+challengeName+"','"+date+"','"+time+"','"+inputString.trim()+"','"+userOutput.trim()+"')");		
		return responseString;
	}
	
	public static String compare(String responseString, String inString, Data s, int back) throws Exception{
		String[] userOutput =  URLDecoder.decode(s.extract("output=(.*)&img",inString),"UTF-8").split("\r\n");
		String systemOutput = "";
		String challengeName = s.getChallengeName();
		Process p = new ProcessBuilder("javac","/host_msuser1/workspace/training2016/Java_project/Task_codes/"+challengeName.replace(" ","")+".java").start();
		Process p2 = new ProcessBuilder("chmod","777","/host_msuser1/workspace/training2016/Java_project/Task_codes/"+challengeName.replace(" ","")+".class").start();
		String[] inputLines = s.extract("input=(.*)&output",inString).split("%0D%0A");
		List<String> command = new ArrayList<String>();
		command.add("java");
		command.add("-cp");
       		command.add("/host_msuser1/workspace/training2016/Java_project/Task_codes/");
		command.add(challengeName.replace(" ",""));
		for(int arg = 0;arg<inputLines.length;arg++){
			command.add(URLDecoder.decode(inputLines[arg],"UTF-8"));
		}
		Process p1 = new ProcessBuilder(command).start();
		BufferedReader input = new BufferedReader(new InputStreamReader(p1.getInputStream()));
     		String line = null; 
		while ((line = input.readLine()) != null){
			systemOutput += line+"\r\n";
		}
		String[] sysOutput = systemOutput.split("\r\n");
		responseString = "<html><head> <meta charset='utf-8'>  <meta name='viewport' content='width=device-width, initial-scale=1'>"+
			"<style>.cancelbtn {    width: auto;    padding: 10px 18px;    background-color: #E9D4E8;}.imgcontainer {  "+
			"  text-align: center;    margin: 24px 0 12px 0;    position: relative;}img.avatar {    width: 40%;    border-radius: 50%;}"+
			".container {    padding: 16px;}span.psw {    float: right;    padding-top: 16px;}.modal {    display: none;     position: fixed; "+
			"    z-index: 1;     left: 0;    top: 0;    width: 100%;     height: 100%;     overflow: auto;     background-color: rgb(0,0,0); "+
			"    background-color: rgba(0,0,0,0.4);     padding-top: 60px;}.modal-content {    background-color: #fefefe;   "+
			" margin: 5% auto 15% auto;     border: 1px solid #888;    width: 75%; }.close {    position: absolute;    right: 25px;    top: 0;  "+
			"  color: #000;    font-size: 35px;    font-weight: bold;}.close:hover,.close:focus {    color: red;    cursor: pointer;}"+
			".animate {    -webkit-animation: animatezoom 0.6s;    animation: animatezoom 0.6s}@-webkit-keyframes animatezoom {  "+
			"  from {-webkit-transform: scale(0)}    to {-webkit-transform: scale(1)}}@keyframes animatezoom {    from "+
			"{transform: scale(0)}    to {transform: scale(1)}}@media screen and (max-width: 300px) {    span.psw {       display: block; "+
			"      float: none;    }   }</style><body onload = \"document.getElementById('id01').style.display='block'\">"+
			"<div id='id01' class='modal'>  <form class='modal-content animate'>    <div class='imgcontainer'>     "+
			" <span onclick=\"history.go("+back+");\" class='close' title='Close Modal'>&times;</span>    </div>    "+
			"<div class='container'>		<table align = 'center' width = 100% height = 20% cellspacing='5'>"+
			"<caption style = 'font-size:30px;'>"+challengeName+"</caption><br><br><th>User output</th>"+
			"<th>System output</th><th>Status</th>";
		for(int i=0;i<userOutput.length;i++){
			if(userOutput[i].trim().equals(sysOutput[i].trim())){
				responseString += "<tr><td align = 'center' style=\"width:40%;\">"+userOutput[i]+"</td>"+
					"<td style = 'color:green;width:40%;' align = 'center'>"+sysOutput[i]+
					"</td><td align = 'center' style=\"color : green;width:20%;\"><pre>Pass</pre></td></tr>";
			}
			else{
				responseString += "<tr><td align = 'center' style=\"width:40%;\">"+userOutput[i]+"</td>"+
					"<td style = 'color:red;width:40%;' align = 'center'>"+sysOutput[i]+
					"</td><td align = 'center' style=\"color : red;width:20%;\">Fail</td></tr>";
			}
		}
		responseString += "</table></div>    <div class='container' style='background-color:#f1f1f1'>        </div>  </form>"+
			"</div><script>var modal = document.getElementById('id01');\r\nspan.onclick = function() {\r\n  "+
			"  modal.style.display = 'none';\r\n}\r\nvar btn = document.getElementById('myBtn');\r\n"+
			"btn.onclick = function() {\r\n    modal.style.display = 'block';\r\n}\r\n</script></body></html>";
		return responseString;
	}
}
