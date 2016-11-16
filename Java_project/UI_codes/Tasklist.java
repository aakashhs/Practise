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
		String responseString = "<html><head> <meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width,"+
			" initial-scale=1\"><style> #wrapper {min-height:100%;			position:relative;		}\r\n		#header {		"+
			"	border-radius: 8px;			background:black;			padding:10px;		}\r\n		#content {			"+
			"padding-bottom:50px; 		}	\r\n	#footer {padding-top:10px;			border-radius: 8px;		"+
			"	background:black;			width:100%;			height:50px;			position:absolute;			bottom:0;"+
			"			left:0;		}	\r\n	ul {                list-style-type: none;                margin: 0;  overflow: hidden;           "+
			"     background-color: black;            }    \r\n        li {                float: right;            }       \r\n     li a, .dropbtn {          "+
			"      display: inline-block;                color: white;                text-align: right;		min-width: 120px;             "+
			"   padding: 14px 16px;                text-decoration: none;            }   \r\n         li a:hover, .dropdown:hover .dropbtn {        "+
			"        background-color: #eecffa;color:black;            }      \r\n      li.dropdown {               display: inline-block;            }  "+
			"  \r\n        .dropdown-content {                display: none;                position: absolute;                background-color: #f9f9f9;       "+
			"         min-width: 120px;               box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);            }    \r\n        .dropdown-content a {          "+
			"      color: black;               padding: 12px 16px;                text-decoration: none;                display: block;                text-align:"+
			" left;            }     \r\n       .dropdown-content a:hover {background-color: #FFE4B5;}  \r\n          .dropdown:hover .dropdown-content"+
			" {                display: block;            }	\r\ninput[type=button]{width: 100%;	    background-color: black;	    color:"+
			" whitesmoke;		    padding: 9px 8px;		   margin: 2px 0;		    border: none;		    border-radius: 4px;	"+
			"	    cursor: pointer;	}\r\n		#goog:hover, #twit:hover {background-color:#eecffa;border-radius: 4px;}\r\n	"+
			"td button.i { background-color : ghostwhite; border-radius:4px;}	input[type=\"button\"]:hover {   "+
			" background-color: gray;} td button.i:hover{background-color:gainsboro;}  \r\n          "+
			"td button.i:active{text-decoration:none;}	</style></head><div id = \"wrapper\">			"+
			"<body bgcolor = #eecffa><div id = \"header\" style=\"height:70px;\">			<header>			"+
			"<table bgcolor = 'black' style=\"width:100%\"><tr ><td style = \"text-align:left;width:6%;color:white;\">"+
			"<h1 style=\"padding-top: 3%;\">JAVA</h1></td><td  style = \"text-align:center;width:88%;color:white;\">"+
			"<h1 style = \"padding-top:1%;padding-left:4vw;\">Challenges List</h1></td><td style = \"width:6%;\"><ul>"+
			"<li class='dropdown'>";
		if(username.equals("Guest")){
			responseString += "<a href = '#' style=\"font-size: 120%;\">";
		}else{
			responseString += "<a href = 'profile' style=\"font-size: 120%;\" >";
		}
					responseString += "<img style = 'width: 20px;height: 20px;background: #555;vertical-align: sub;' src='data:image/png;base64,"+s.encoding("msuser1.jpg","jpg")+"' alt='logo' /> "+
			username+"</a><div class='dropdown-content'>	"+
			"<a href = 'contactus'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'data:image/jpeg;base64,"+
			s.encoding("contact_us.png","png")+"' /> Contact Us</a>";

		if(username.equals("Guest")){
			responseString += "<a href='login$fromTasklist$' id><img style = 'float: left;width: 20px;height: 20px;"+
				"background: #555;' src='data:image/png;base64,"+s.encoding("login.png","png")+"' alt='logo' /> Log In</a>"+
				"<a href='signup$fromTasklist$'><img style = 'float: left;width: 20px;height: 20px;background: #555;' "+
				"src='data:image/png;base64,"+s.encoding("signup.png","png")+"' /> Sign Up</a>";
		}
		else{
			responseString += " <a href='userhistory' id = 'userhistory'><img style = 'float: left;width: 20px;"+
				"height: 20px;background: #555;'src='data:image/jpeg;base64,"+s.encoding("history.jpg","jpg")+"' alt='logo' />"+
				" User History("+countLogin+")</a>		<a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;"+
				"background: #555;' src='data:image/jpeg;base64,"+s.encoding("logout.jpg","jpg")+"' />Log out</a>";
		}

		responseString += "</div> </li>            </ul></td></tr></table>			</header></div><br>"+
			"<div id = \"content\"><article><br><br><center><script type=\"text/javascript\">"+
			"function sort(ascending, columnClassName, tableId) {\r\n	var myTable = document.getElementById(tableId);"+
			"	\r\nvar index = parseInt(myTable.rows[1].cells[0].innerHTML);    \r\n   "+
			" var tbody = document.getElementById(tableId).getElementsByTagName('tbody')[0]; \r\n     "+
			"  var rows = tbody.getElementsByTagName('tr');\r\n	var columns = tbody.getElementsByTagName('td');  \r\n     "+
			" var unsorted = true;  \r\n  while (unsorted) {  \r\n          unsorted = false;       \r\n     for (var r = 0; r < rows.length - 1; r++) {  "+
			" \r\n             var row = rows[r];      \r\n          var nextRow = rows[r + 1];  \r\n "+
			" var value = row.getElementsByClassName(columnClassName)[0].innerHTML;     \r\n          "+
			" var nextValue = nextRow.getElementsByClassName(columnClassName)[0].innerHTML;     \r\n       "+
			"    value = value.replace(',', '.');      \r\n    nextValue = nextValue.replace(',', '.');   \r\n          "+
			"   if (!isNaN(value)) {        \r\n            value = parseFloat(value);         \r\n           nextValue = parseFloat(nextValue);    }"+
			"     \r\n           if (ascending ? value > nextValue : value < nextValue) {   \r\n                 tbody.insertBefore(nextRow, row); "+
			"    \r\n               unsorted = true;  \r\n            }     \r\n       }    \r\n    }\r\n	for(var i = 1; i <= 8; i++){\r\n"+
			"myTable.rows[i].cells[0].innerHTML = index;index = index + 1;\r\n} \r\n   };	</script>";
		int count = 1,resIndex = 1;
		res = stmt.executeQuery("select count(*) from jchallenges");
		while (res.next()){
			count = res.getInt("count");
		}
		res = stmt.executeQuery("select challenge_name from jchallenges order by challenge_name");
		int j = 0;
		for (int slice = 0; slice <= count / 8; slice++){
			responseString += "<div id = \"res"+resIndex+"\" style = 'padding-left: 5%;'>		<table border = '1' "+
				"id = 'content-table"+resIndex+"' width = '45%' data-page-length='10'>			<thead>				<tr>	"+
				"				<th style = 'width:5%'>S.No</th><th style = 'padding-left:3%;'><h3 style='display: inline-block;'>"+
				"Challenge Name</h3><a href=\"javascript:sort(true, 'country', 'content-table"+resIndex+"');\">"+
				"<img src='data:image/jpeg;base64,"+s.encoding("ascend.png","png")+"' style = 'width: 30px;height: 30px;"+
				"vertical-align: middle;' /></a><a href=\"javascript:sort(false, 'country', 'content-table"+resIndex+"');\">"+
				"<img src='data:image/jpeg;base64,"+s.encoding("descend.png","png")+"' style = 'width: 30px;height: 30px;"+
				"vertical-align: middle;' /></a></th><th style = 'width:5%'>Action</th></tr></thead><tbody>";

			while(res.next()){
				j++;
				responseString += "<tr><td align='center' >"+j+"</td><td  align='center' class=\"country\" >"+
					res.getString("challenge_name")+"</td><td align='center' > <a href='/exec$"+res.getString("challenge_name")+
					"%' ><input type = \"button\" value = \"Go To Challenge\"></a></td></tr>";
				if (j > 7 && j % 8 == 0)
					{break;}
			}
			responseString += "</tbody></table></div>";
			resIndex++;
		}

		responseString += "<br><br><table><tr><td ><button type = \"button\" class = 'i'  id = \"prev\"  value = \""+(resIndex-1)+"\"><<</button></td>";
		for(int i = 1;i<resIndex;i++){
			responseString += "<td ><button type = \"button\" class = 'i'  id = \""+i+"\" onclick = 'loadTable("+i+")' value = \"1\">"+i+"</button></td>";
		}
		responseString += "<td ><button type = \"button\" class = 'i' id = \"next\" value = \"4\" >>></button> </td>"+
			"</tr></table></center>	<script>    	var cur_page = 1;\r\n	var btncount = document.getElementById('prev').value;"+
			"\r\n    	window.onload = function(){\r\n	document.getElementById('prev').style.display = 'none';"+
			"\r\n	document.getElementById('res1').style.display = 'block';\r\n	for (var i = 2; i<=btncount;i++){"+
			"\r\ndocument.getElementById('res'+i).style.display = 'none';\r\n}	"+
			"\r\ndocument.getElementById('next').style.display = 'block';\r\n	};	\r\n"+
			"document.getElementById('prev').onclick = function(){ \r\n	cur_page--;\r\n	"+
			"for(var i = 1; i <= btncount; i++){	\r\ndocument.getElementById('res'+i).style.display = 'none';\r\n}"+
			"\r\n	document.getElementById('res'+cur_page).style.display = 'block';	\r\nif(cur_page == btncount)"+
			"\r\n{document.getElementById('next').style.display = 'none';\r\n}\r\n	else\r\n"+
			" {document.getElementById('next').style.display = 'block';\r\n}\r\n	if(cur_page == 1)\r\n"+
			"{document.getElementById('prev').style.display = 'none';\r\n}	\r\nelse \r\n{\r\n"+
			"document.getElementById('prev').style.display = 'block';\r\n}\r\n	};	\r\n"+
			"document.getElementById('next').onclick = function(){ 	\r\ncur_page++;	\r\nfor(var i = 1; i <= btncount; i++){"+
			"\r\n	document.getElementById('res'+i).style.display = 'none';\r\n}\r\n	"+
			"document.getElementById('res'+cur_page).style.display = 'block';\r\n	if(cur_page == btncount){\r\n"+
			"document.getElementById('next').style.display = 'none';\r\n}	\r\nelse\r\n {"+
			"document.getElementById('next').style.display = 'block';\r\n}	\r\nif(cur_page == 1)\r\n{"+
			"document.getElementById('prev').style.display = 'none';\r\n}\r\n	else\r\n {"+
			"document.getElementById('prev').style.display = 'block';\r\n}\r\n	};\r\n	function loadTable(page) {\r\n"+
			"	cur_page = page;	\r\n	for(var i = 1; i <= btncount; i++){\r\n"+
			"	document.getElementById('res'+i).style.display = 'none';\r\n}	\r\n"+
			"document.getElementById('res'+cur_page).style.display = 'block';\r\n	if(cur_page == btncount){\r\n"+
			"document.getElementById('next').style.display = 'none';\r\n}	\r\nelse\r\n {\r\n"+
			"document.getElementById('next').style.display = 'block';\r\n}	\r\nif(cur_page == 1){\r\n"+
			"document.getElementById('prev').style.display = 'none';\r\n}\r\n	else\r\n {\r\n"+
			"document.getElementById('prev').style.display = 'block';\r\n}\r\n	}	    </script></center><br/><br/>"+
			"</article></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr>"+
			"<td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i>"+
			"</div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\""+
			" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,"+
			s.encoding("google_plus.png","png")+"' height = \"30\" width = \"30\" id = 'goog'></a></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'>"+
			"<input type=\"image\" src=\"data:image/jpeg;base64,"+s.encoding("Twitter_logo.png","png")+"\" height = \"30\""+
			" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>";
		return responseString;
	}
}

