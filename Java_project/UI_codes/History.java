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
			"initial-scale=1\"><link rel = 'stylesheet' type = 'text/css' href = 'hp.css'></head><div id = \"wrapper\"><body bgcolor = #eecffa><div id = \"header\" style=\"height:70px;\"><header>"+
			"<table bgcolor = 'black' style=\"width:100%\"><tr ><td style = \"text-align:left;width:6%;color:white;\">"+
			"<h1 style=\"padding-top: 3%;\">JAVA</h1></td><td  style = \"text-align:center;width:88%;color:white;\">			"+
			"<h1 style = \"padding-top:1%;padding-left:4vw;\">"+title+" History</h1></td><td style = \"width:6%;\">			"+
			"<ul>              <li class='dropdown'><a href = '#'><img style = 'width: 20px;height: 20px;background: #555;vertical-align: sub;' "+
			"src='msuser1.png' alt='logo' /> "+username+"</a>"+
			"<div class='dropdown-content'>	 <a href = 'homepage'><img style = 'float: left;width: 20px;height: 20px;background: #555;'"+
			" src='home.png' />Home</a><a href = 'contactus'>"+
			"<img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'contactus.png' /> Contact Us</a>";
		if(title != "User"){
		int countLogin = s.getCountLogin();
		responseString += "<a href='userhistory' id = 'userhistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;'src='history.png' alt='logo' /> User History("+countLogin+")</a>";
		}
		responseString += "<a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='logout.png' /> Log out</a></div>          </li>            </ul></td></tr></table>			</header></div><br>";
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
				responseString += "</table><br/><center><input type = 'submit' name = 'DownloadChallengePDF' value = 'Get PDF'"+
					" id = 'downloadpdf'></center><br><br><br><div id=\"myModal\" class=\"modal\">  <div class=\"modal-content\">   "+
					" <span class=\"close\">&times;</span><br><br><br><form><input type=\"radio\" name = \"Downloadtask\""+
					" value = \"Downloadtask\">Download<br/><input type=\"radio\" name = \"Downloadtask\" value = \"Downloadtaskmail\">"+
					"Mail<br/><br><input type=\"submit\" value = \"OK\" id=\"ok\"><br/></form>  </div></div><script src = 'hp.js' ></script></article></div>";
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
			responseString += "</table><br/><center><input type = 'submit' name = 'loginhistoryPDF' value = 'Get Pdf'"+
				" id = 'downloadpdf'></center><br><br><br><div id=\"myModal\" class=\"modal\">  <div class=\"modal-content\"> "+
				"   <span class=\"close\">&times;</span><br><br><br><form><input type=\"radio\" name = \"getUserPdf\""+
				" value = \"getUserPdf\">Download<br/>				<input type=\"radio\" name = \"getUserPdf\""+
				" value = \"getUserPdfmail\">Mail<br/>	<br><br><input type=\"submit\" value = \"OK\" id=\"ok\"><br/>"+
				"</form>  </div></div><script src = 'hp.js' ></script></article></div>";
		}


		responseString += "<div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr>"+
			"<td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i>"+
			"</div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" "+
			"href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='google_plus.png' height = \"30\" width = \"30\" id = 'goog'></a></div></td>"+
			"<td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'>"+
			"<input type=\"image\" src=\"Twitter_logo.png\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>";
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
		Image image1 = Image.getInstance("png/Mahaswami Logo-01.png");
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
