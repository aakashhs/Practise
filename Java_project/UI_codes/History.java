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
import java.io.FileOutputStream;
import java.io.IOException;
import com.itextpdf.text.Image;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper; 
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPRow;
import com.itextpdf.text.pdf.PdfPTable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class History{
	public static String history(String responseString, Data s, ResultSet res, Statement stmt, String title, String flash) throws Exception{
		String username = s.getUsername();
		responseString = "<html><head><meta charset=\"utf-8\">  <meta name=\"viewport\" content=\"width=device-width, "+
			"initial-scale=1\"><style>		#wrapper {	min-height:100%;	position:relative;}#header {			"+
			"border-radius: 8px;	background:black;	padding:10px;}#content {	padding-bottom:50px;}#footer {			"+
			"border-radius: 8px;padding-top:10px;	background:black;	width:100%;	height:50px;	position:absolute;	"+
			"bottom:0;	left:0;}		ul {                list-style-type: none;                margin: 0;                padding: 0;                overflow:"+
			" hidden;                background-color: black;            }            li {               float: left;            }            li a, .dropbtn {           "+
			"     display: inline-block;                color: white;                text-align: right;                padding: 12px 16px;	"+
			"	min-width:120px;                text-decoration: none;            }            li a:hover, .dropdown:hover .dropbtn {            "+
			"    background-color: #eecffa;color:black;            }            li.dropdown {                display: inline-block;            }       "+
			"     .dropdown-content {               display: none;                position: absolute;                background-color: #f9f9f9;         "+
			"       min-width: 120px;                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);            }            .dropdown-content a {          "+
			"      color: black;                padding: 12px 16px;                text-decoration: none;                display: block;                text-align:"+
			" left;            }            .dropdown-content a:hover {background-color: #FFE4B5}            .dropdown:hover .dropdown-content"+
			" {                display: block;            }		.modal {		    display: none; 		    position: fixed;		    z-index: 1; 	"+
			"	    padding-top: 100px; 		    left: 0;		    top: 0;		    width: 100%; 		    height: 100%;		    overflow: auto;"+
			"		    background-color: rgb(0,0,0); 		    background-color: rgba(0,0,0,0.4);		}		.modal-content {	"+
			"	    background-color: #fefefe;		    margin: auto;		    padding: 20px;		    border: 1px solid #888;		"+
			"    width: 30%;		}		.close {		    color: #aaaaaa;		    float: right;		    font-size: 28px;		"+
			"    font-weight: bold;		}		.close:hover,		.close:focus {		    color: red;		    text-decoration: none;	"+
			"	    cursor: pointer;		}		#goog:hover, #twit:hover {background-color: #eecffa;border-radius: 4px;}		"+
			"</style></head><div id = \"wrapper\"><body bgcolor = #eecffa><div id = \"header\" style=\"height:70px;\"><header>"+
			"<table bgcolor = 'black' style=\"width:100%\"><tr >			<td style = \"text-align:left;width:6%;color:white;\">"+
			"<h1 style=\"padding-top: 3%;\">JAVA</h1></td><td  style = \"text-align:center;width:88%;color:white;\">			"+
			"<h1 style = \"padding-top:1%;padding-left:4vw;\">"+title+" History</h1></td><td style = \"width:6%;\">			"+
			"<ul>              <li class='dropdown'><a href = '#'><img style = 'width: 20px;height: 20px;background: #555;vertical-align: sub;' "+
			"src='data:image/png;base64,"+s.encoding("msuser1.jpg","jpg")+"' alt='logo' /> "+username+"</a>"+
			"<div class='dropdown-content'>	 <a href = 'homepage'><img style = 'float: left;width: 20px;height: 20px;background: #555;'"+
			" src='data:image/jpeg;base64,"+s.encoding("home.png","png")+"' />Home</a><a href = 'contactus'>"+
			"<img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'data:image/jpeg;base64,"+
			s.encoding("contact_us.png","png")+"' /> Contact Us</a>";
		if(title != "User"){
		int countLogin = s.getCountLogin();
		responseString += "<a href='userhistory' id = 'userhistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;'src='data:image/jpeg;base64,"+
			s.encoding("history.jpg","jpg")+"' alt='logo' /> User History("+countLogin+")</a>";
		}
		responseString += "<a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,"+
			s.encoding("logout.jpg","jpg")+"' /> Log out</a></div>          </li>            </ul></td></tr></table>			</header></div><br>";
		if(flash != ""){
		responseString += "<div id=\"Text\" style=\"color : green;\"><center> <p> The pdf has been successfully "+flash+
			"! </p> </center></div><script type = \"text/javascript\">    		setTimeout ( \"vanish()\", 30000 );	"+
			"	function vanish(){			document.getElementById(\"Text\").style.display = \"none\";		}		</script>";
		}

		if(title != "User"){
			String challengeName = s.getChallengeName();
			int count = 0;
			res = stmt.executeQuery("select count(*) from jchallengehistory where challenge_name = '"+challengeName+"' and username = '"+username+"'");
			while(res.next()){
				count = res.getInt("count");
			}
			if(count == 0){
				responseString += "<center><p style=\"font-size: 1.9vw;\">You haven't executed this task yet!</p></center>";
			}else{
				res = stmt.executeQuery("select * from jchallengehistory where challenge_name = '"+challengeName+"' and username = '"+username+"' order by id desc");
				responseString += "<br/><br/><div id = \"content\"><article><table border = 1 cellpading = 10  colspan = 5 align"+
					" = 'center'><tr><td>date</td><td>time</td><td>input</td><td>Output</td></tr>";
				while (res.next()){
					responseString += "<tr><td>"+res.getString("date")+"</td><td>"+res.getString("time")+"</td><td><pre>"+
						res.getString("input")+"</pre></	td><td><pre>"+res.getString("output")+"</pre></td></tr>";
				}
				responseString += "</table><br/><center><input type = 'submit' name = 'DownloadChallengePDF' value = 'Download PDF'"+
					" id = 'downloadpdf'></center><br><br><br><div id=\"myModal\" class=\"modal\">  <div class=\"modal-content\">   "+
					" <span class=\"close\">&times;</span><br><br><br><form><input type=\"radio\" name = \"Downloadtask\""+
					" value = \"Downloadtask\">Download as Pdf<br/><input type=\"radio\" name = \"Downloadtask\" value = \"Downloadtaskmail\">"+
					"Mail the Pdf<br/><br><input type=\"submit\" value = \"OK\" id=\"ok\"><br/></form>  </div></div><script>"+
					"var modal = document.getElementById('myModal');\r\nvar btn = document.getElementById(\"downloadpdf\");\r\n"+
					"var span = document.getElementsByClassName(\"close\")[0];\r\nvar submit = document.getElementById('ok');\r\n"+
					"btn.onclick = function() {\r\n    modal.style.display = \"block\";\r\n}\r\nsubmit.onclick = function() {\r\n   "+
					" modal.style.display = \"none\";\r\n}\r\nspan.onclick = function() {\r\n    modal.style.display = \"none\";\r\n}"+
					"\r\nwindow.onclick = function(event) {\r\n    if (event.target == modal) {\r\n        modal.style.display = \"none\";\r\n "+
					"   }\r\n}\r\n</script></article></div>";
			}
		}
		else
		{
			res = stmt.executeQuery("select * from jloginhistory where username = '"+username+"' order by id desc");
			responseString += "<br/><br/><div id = \"content\"><article><table align = 'center' border = 1 cellpading = 10 colspan = 5>"+
				"<tr><td><b>username<b></td><td><b>time<b></td><td><b>date<b></td></tr>";
			while (res.next()){
				responseString += "<tr><td>"+username+"</td><td>"+res.getString("time")+"</td><td>"+res.getString("date")+"</td></tr>";
			}
			responseString += "</table><br/><center><input type = 'submit' name = 'loginhistoryPDF' value = 'Login History Pdf'"+
				" id = 'downloadpdf'></center><br><br><br><div id=\"myModal\" class=\"modal\">  <div class=\"modal-content\"> "+
				"   <span class=\"close\">&times;</span><br><br><br><form><input type=\"radio\" name = \"getUserPdf\""+
				" value = \"getUserPdf\">Download as Pdf<br/>				<input type=\"radio\" name = \"getUserPdf\""+
				" value = \"getUserPdfmail\">Mail the Pdf<br/>	<br><br><input type=\"submit\" value = \"OK\" id=\"ok\"><br/>"+
				"</form>  </div></div><script>var modal = document.getElementById('myModal');\r\n"+
				"var btn = document.getElementById(\"downloadpdf\");\r\nvar span = document.getElementsByClassName(\"close\")[0];"+
				"\r\nvar submit = document.getElementById('ok');\r\nbtn.onclick = function() {\r\n    modal.style.display = \"block\";"+
				"\r\n}\r\nsubmit.onclick = function() {\r\n    modal.style.display = \"none\";\r\n}\r\nspan.onclick = function() {"+
				"\r\n    modal.style.display = \"none\";\r\n}\r\nwindow.onclick = function(event) {\r\n    if (event.target == modal) {"+
				"\r\n        modal.style.display = \"none\";\r\n    }\r\n}\r\n</script></article></div>";
		}


		responseString += "<div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr>"+
			"<td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i>"+
			"</div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" "+
			"href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,"+
			s.encoding("google_plus.png","png")+"' height = \"30\" width = \"30\" id = 'goog'></a></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'>"+
			"<input type=\"image\" src=\"data:image/jpeg;base64,"+s.encoding("Twitter_logo.png","png")+
			"\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>";
		return responseString;
	}

	public static void generatePdf(String history, Statement stmt, ResultSet res, Data s) throws Exception{
		System.out.println("in gene pdf");		
		String time = s.getTime();
		String date = s.getDate();
		Document document = new Document();
		String src = null;
		if(history == "User"){
		String username = s.getUsername();
		System.out.println("in gene pdf"+username);
		PdfWriter.getInstance(document, new FileOutputStream("hello.pdf"));
		document.open();
		document.add(new Paragraph("Created on :"+date+":"+time+"\nLogin History of '"+username+"'\n\n"));
		PdfPCell cell;
		PdfPTable table = new PdfPTable(3);
		table.setWidths(new float[] { 10, 20, 20 });
		table.addCell("Sl. no");
		table.addCell("Date");
		table.addCell("Time");
		res = stmt.executeQuery("select * from jloginhistory where username = '"+username+"' order by id desc");
		int i = 1;
		while(res.next()){			
			table.addCell(Integer.toString(i));
			table.addCell(res.getString("date"));
			table.addCell(res.getString("time"));
			i++;
		}
		boolean b = true;
		int row = 1;
		for(PdfPRow r: table.getRows()) {
			if(row == 1){row++;continue;}
			for(PdfPCell c: r.getCells()) {
				c.setBackgroundColor(b ? new BaseColor(153,255,255) : new BaseColor(255,204,255));
			}
			b = !b;
		}
		document.add(table);
		document.close();
		src = username+"_history.pdf";
		}else{
		String challengeName = s.getChallengeName();
		PdfWriter.getInstance(document, new FileOutputStream("hello.pdf"));
		document.open();
		String username = s.getUsername();
		document.add(new Paragraph("Created on :"+date+":"+time+"\nExecution history of '"+challengeName+"' task by '"+username+"'\n\n"));		
		PdfPCell cell;
		PdfPTable table = new PdfPTable(5);
		table.setWidths(new float[] { 5, 16, 10, 35, 34});
		table.addCell("Sl. no");
		table.addCell("Date");
		table.addCell("Time");
		table.addCell("Input");
		table.addCell("Output");
		res = stmt.executeQuery("select * from jchallengehistory where challenge_name = '"+challengeName+"' and username = '"+username+"' order by id desc");
		int i = 1;
		while(res.next()){
			table.addCell(Integer.toString(i));
			table.addCell(res.getString("date"));
			table.addCell(res.getString("time"));
			table.addCell(res.getString("input"));
			table.addCell(res.getString("output"));
			i++;
		}
		boolean b = true;
		int row = 1;
		for(PdfPRow r: table.getRows()) {
			if(row == 1){
			row++;continue;}
			for(PdfPCell c: r.getCells()) {
				c.setBackgroundColor(b ? new BaseColor(153,255,255) : new BaseColor(255,204,255));
			}
			b = !b;
		}
		document.add(table);		
		document.close();	
		src = challengeName+"_history.pdf";
		}
		PdfReader pdfReader = new PdfReader("hello.pdf");
		PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileOutputStream(src));
		Image image1 = Image.getInstance("Images/Mahaswami Logo-01.png");
		image1.setAbsolutePosition(100, 200);
		image1.scaleToFit(PageSize.A4.getWidth()-200, PageSize.A4.getHeight()-200);
		PdfContentByte waterMark ;
		PdfGState state = new PdfGState();
		state.setFillOpacity(0.25f);
		for (int pageIndex = 1; pageIndex <= pdfReader.getNumberOfPages(); pageIndex++) {
			waterMark = pdfStamper.getOverContent(pageIndex);
			waterMark.saveState();
			waterMark.setGState(state);
			waterMark.addImage(image1);
			waterMark.restoreState();
		}
		pdfStamper.close();
		pdfReader.close();
		Process p = Runtime.getRuntime().exec("rm hello.pdf");
	}
}
