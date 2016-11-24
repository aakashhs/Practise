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
public class Contact{
	public static String contactUs(String responseString, boolean flash, Data s) throws Exception{
		String username = s.getUsername();
		int countLogin = s.getCountLogin();
		responseString = "<html><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"+
			"<head><link rel = 'stylesheet' type = 'text/css' href = 'feedback.css'></head><div id = \"wrapper\"><body><div id = \"header\" >"+
			"<header><table bgcolor = 'black' style=\"width:100%;\"><tr ><td style = \"text-align:left;width:6%;color:white;\">"+
			"<h1 style=\"padding-top: 3%;\">JAVA</h1></td><td  style = \"text-align:center;width:88%;color:white;\">		"+
			"	<h1 style = \"padding-top:1%;\">Contact Form</h1></td><td style = \"width:6%;\"><div class=\"dropdown\" >";
		if(username.equals("Guest"))
		{
			responseString += "<a href='#' class='dropbtn' style=\"font-size:112%;\"><img  class = 'topim'         src='msuser1.png' alt='logo' /> Guest</a>";
		}else {
			responseString += "<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img class = 'topim'       "+
				"             src='msuser1.png' alt='logo' /> "+username+"</a>";
		}
		responseString += "<div class='dropdown-content'>  <a href = 'homepage'><img class = 'im'"+
			" src='home.png' /> Home</a>";
		if(!username.equals("Guest")){
			responseString += "<a href='userhistory' id = 'userhistory'><img "+
				"class = 'im' src='history.png' alt='logo' />"+
				" User History("+countLogin+")</a><a href='tasklist'><img class = 'im'"+
				" src='logout.png' /> Log out</a>";
		}
		else
		{
			responseString += "<a href='login$fromContact$' id><img class = 'im' "+
				"     src='login.png' alt='logo' /> Log In</a>	"+
				"	<a href='signup$fromContact$'><img class = 'im'"+
				" src='signup.png' /> Sign Up</a>";
		}
			responseString += "</div></div></td></tr></table></header></div>";
		if(flash){
			responseString += "<div id=\"Text\" style=\"color : green;\"><center> <p> Your Feedback has been successfully mailed!"+
				" </p> </center></div><script type = \"text/javascript\">    		setTimeout ( \"vanish()\", 30000 );		"+
				"function vanish(){\r\n			document.getElementById(\"Text\").style.display = \"none\";\r\n		}		</script>";
		}
		responseString += "<div id = \"content\"><article><br><br><form id = 'i' name = 'aakash'><div class = \"contact\">	"+
			"<h1>Your Name:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"name\" required>"+
			"</textarea><br><br>			<h1>Your Mail Id:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" "+
			"name = \"mailid\" required></textarea><br><br>			<h1>Message:</h1><textarea form = \"i\" style=\"resize:none\" "+
			"rows= \"10\" cols= \"100\" name = \"body\" id = 'message'  required></textarea><br><br>			"+
			"<input type = 'submit' name = 'Send' value = 'send' onclick = 'return empty()' ></div>	<script src = 'feedback.js' ></script>	"+
			"	</form></article><br><br></div><div id = \"footer\"><footer><table bgcolor = 'black'"+
			" style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; "+
			"Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\""+
			" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\">"+
			"<div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" "+
			"src=\"Twitter_logo.png\" height = \"30\" width = \"30\" "+
			" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>";
		return responseString;
	}
}
