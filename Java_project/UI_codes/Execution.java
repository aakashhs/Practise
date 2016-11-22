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
			"<link rel = 'stylesheet' type = 'text/css' href = 'second.css'></head><div id = \"wrapper\">		<body bgcolor = #eecffa>"+
			"<div id = \"header\" style=\"height:70px;\">		<header><table bgcolor = 'black' style=\"width:100%\"><tr >	"+
			"		<td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">JAVA</h1></td>"+
			"<td  style = \"text-align:center;width:88%;color:white;\">	<h1 style = \"padding-top:1%;\">"+challengeName+
			"</h1></td><td style = \"width:6%;\"><ul>              <li  class='dropdown'>";
		if(username.equals("Guest")){
			responseString += "<a href='#' class='dropbtn' style=\"font-size:121%;\"><img style = 'width: 20px;height:"+
				" 20px;background: #555;vertical-align: middle;'   src='msuser1.png' alt='logo' /> Guest</a>";
		}
		else
		{
			responseString += "<a href='profile' class='dropbtn' style = \"font-size:121%;\">"+
				"<img style = 'width: 20px;height: 20px;background: #555;vertical-align:sub;'  src='msuser1.png' alt='logo' /> "+username+"</a>";
		}
		responseString += "<div class='dropdown-content'><a href = 'homepage'>"+
			"<img style = 'float: left;width: 20px;height: 20px;background: #555;' src='home.png' /> Home</a><a href = 'contactus'><img style = 'float: left;width: 20px;height:"+
			" 20px;background: #555;' src = 'feedback.png' /> Contact Us</a>";
		int count = 0;
		res = stmt.executeQuery("select count(*) from jchallengehistory where challenge_name = '"+challengeName+"' and username = '"+username+"'");
		while (res.next()){
			count = res.getInt("count");
		}
		if(!username.equals("Guest")){
			responseString += "<a href='challengehistory'><img style = 'float: left;width: 20px;height: 20px;background:"+
				" #555;'    src='history.png' alt='logo' /> Challenge History("+
				count+")</a>		<a href='userhistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;'   "+
				"src='history.png' alt='logo' /> User History("+countLogin+
				")</a><a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;background: #555;'"+
				" src='logout.png' /> Log out</a>";
		}
		else
		{
			responseString += "<a href='login$fromvulcan$' id><img style = 'float: left;width: 20px;height: 20px;background:"+
				" #555;' src='login.png' alt='logo' /> Log In</a>	"+
				"	<a href='signup$fromvulcan$'><img style = 'float: left;width: 20px;height: 20px;background: #555;' "+
				"src='signup.png' /> Sign Up</a>";
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
			"<input type=\"file\" name=\"img\" id = 'fileinput' accept = '.txt'></td><script type='text/javascript' src = 'fileread.js'></script>";
		if(username == "Guest"){
			responseString += "<td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\""+
				" >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" ></td>";
		}else{
			responseString += "<td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" "+
				"onclick = 'return empty();' >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" "+
				"form = \"i\" onclick=\"return validate();\"></td>";
		}
		responseString += "</tr></table><script src = 'second.js' ></script>	</form><br/><br/></article>"+
			"</div><div id = \"footer\">	<footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\">"+
			"<div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'>"+
			"<input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>";
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
			"<input type=\"file\" name=\"img\" id = 'fileinput'></td><script type='text/javascript'  src = 'fileread.js' >"+
			"</script><td style=\"width:45%\"><input type = \"submit\" value = \"Execute\" form = \"i\" onclick = 'return empty();' "+
			" >&nbsp;&nbsp;<input type = \"submit\" name = \"Compare\" value = \"Compare\" form = \"i\" onclick=\"return validate();\">"+
			"</td></tr>			</table><script src = 'second.js' ></script>	</form><br/><br/>	</article></div><div id = \"footer\">	<footer><table bgcolor = 'black' style=\"width:98%\">"+
			"<tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'>"+
			"<input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'>"+
			"<a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div>	</body></div>			</html>";
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
			"<link rel = 'stylesheet' type = 'text/css' href = 'match.css'>"+
			"</head><body onload = \"document.getElementById('id01').style.display='block'\">"+
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
			"</div><script src = 'matchmodal.js' ></script></body></html>";
		return responseString;
	}
}
