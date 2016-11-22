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
public class Tasklist{
	public static String response( Statement stmt, ResultSet res, Data s) throws Exception{
		String username = s.getUsername();
		int countLogin = s.getCountLogin();
		int resIndex = 1, count = 0;
		res = stmt.executeQuery("select count(*) from jchallenges");
		while (res.next()){
			count = res.getInt("count");
		}
		resIndex = count/6;
		String responseString = "<html><head> <meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width,"+
			" initial-scale=1\">"+
			"<link rel = 'stylesheet' type = 'text/css' href = 'tasklist.css'>"+
			"</head><div id = \"wrapper\" >"+
			"<body><div id = \"header\" ><header>"+
			"<table id = 'head' ><tr ><td style = \"text-align:left;width:6%;color:white;\">"+
			"<h1 style=\"padding-top: 3%;\">JAVA</h1></td><td  style = \"text-align:center;width:88%;color:white;\">"+
			"<h1 style = \"padding-top:1%;padding-left:4vw;\">Challenges List</h1></td><td style = \"width:6%;\"><ul>"+
			"<li class='dropdown'>";
		if(username.equals("Guest")){
			responseString += "<a href = '#' style=\"font-size: 120%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align: sub;' src='msuser1.png' alt='logo' /> "+username+"</a><div class='dropdown-content'>	";
		}else{
			responseString += "<a href = 'profile' style=\"font-size: 120%;\" ><img style = 'width: 20px;height: 20px;background: #555;vertical-align: sub;' src='msuser1.png' alt='logo' /> "+username+"</a><div class='dropdown-content'>	";
		}
			responseString += "<a href = 'contactus'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'feedback.png' /> Contact Us</a>";

		if(username.equals("Guest")){
			responseString += "<a href='login$fromTasklist$' id><img style = 'float: left;width: 20px;height: 20px;"+
				"background: #555;' src='login.png' alt='logo' /> Log In</a>"+
				"<a href='signup$fromTasklist$'><img style = 'float: left;width: 20px;height: 20px;background: #555;' "+
				"src='signup.png' /> Sign Up</a>";
		}
		else{
			responseString += " <a href='userhistory' id = 'userhistory'><img style = 'float: left;width: 20px;"+
				"height: 20px;background: #555;'src='history.png' alt='logo' />"+
				" User History("+countLogin+")</a><a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;"+"background: #555;' src='logout.png' />Log out</a>";
		}
		responseString += "</div> </li>            </ul></td></tr></table>			</header></div><br>"+
			"<div id = \"content\"><article><br><br><center>";
		responseString += "<div id = \"res\" style = 'padding-left: 5%;'>		<table border = '1' "+
				"id = 'content-table' width = '45%' >			<thead>				<tr>	"+
				"<th style = 'width:5%'>S.No</th><th style = 'padding-left:3%;'><h3 style='display: inline-block;'>"+
				"Challenge Name</h3><a href=\"javascript:sort(true, 'country', 'content-table');\">"+
				"<img src='ascend.png' style = 'width: 30px;height: 30px;"+
				"vertical-align: middle;' /></a><a href=\"javascript:sort(false, 'country', 'content-table');\">"+
				"<img src='descend.png' style = 'width: 30px;height: 30px;"+
				"vertical-align: middle;' /></a></th><th style = 'width:5%'>Action</th></tr></thead><tbody>";

		res = stmt.executeQuery("select * from jchallenges order by challenge_name LIMIT 6 OFFSET 0");
		int x = 1;
		while(res.next()){
			responseString += "<tr><td align='center' >"+x+"</td><td align='center' class=\"country\" >"+res.getString("challenge_name")+"</td><td align='center' ><a href='/exec$"+res.getString("challenge_name")+"%' ><input type = \"button\" value = \"Go To Challenge\"></a></td></tr>";
			x += 1;
		}
		responseString += "</tbody></table></div>";
		responseString += "<br><br><table><tr><td ><button type = \"button\" class = 'i'  id = \"prev\" value = '"+resIndex+"' ><<</button></td>";
		for(int i = 1;i<=resIndex;i++){
			responseString += "<td ><button type = \"button\" class = 'i'  id = \""+i+"\" onclick = 'loadTable("+(i-1)+")' value = \"1\">"+i+"</button></td>";
		}
		responseString += "<td ><button type = \"button\" class = 'i' id = \"next\" value = \"4\" >>></button> </td>"+
			"</tr></table></center></center><br/><br/>"+
			"</article></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr>"+
			"<td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i>"+
			"</div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\""+
			" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png'"+
			" height = \"30\" width = \"30\" id = 'goog'></a></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'>"+
			"<input type=\"image\" src=\"Twitter_logo.png\" height = \"30\""+
			" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div><script src = 'first.js' ></script></html>";
		return responseString;
	}
	public static void sendContent(DataOutputStream out, String inString, Data s, ResultSet res, Statement stmt) throws Exception{
		int offset = Integer.parseInt(s.extract("page(.*) ", inString))*6;
		res = stmt.executeQuery("select * from jchallenges order by challenge_name LIMIT 6 OFFSET "+offset);
		String resp = "";
		offset += 1;
		System.out.println("in content"+offset);
		while(res.next()){
			resp += "<tr><td align='center' >"+offset+"</td><td align='center' class=\"country\" >"+res.getString("challenge_name")+"</td><td align='center' ><a href='/exec$"+res.getString("challenge_name")+"%' ><input type = \"button\" value = \"Go To Challenge\"></a></td></tr>";
			offset += 1;
		}	
			out.write(resp.getBytes());
			out.flush();
	}
}

