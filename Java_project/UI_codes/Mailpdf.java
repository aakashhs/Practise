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
import java.util.Properties;
import javax.mail.*;
import javax.activation.*;  
import javax.mail.internet.*;

public class Mailpdf{
	public static String mailPdf(String responseString, Data s, int page) throws Exception{
		String username = s.getUsername();
		int countLogin = s.getCountLogin();
		responseString = "<html><head><meta charset=\"utf-8\">  <meta name=\"viewport\" content=\"width=device-width, "+
			"initial-scale=1\"><link rel = 'stylesheet' type = 'text/css' href = 'mp.css'></head><div id = \"wrapper\"><body bgcolor = #eecffa><div id = \"header\" style=\"height: 70px;\"><header>"+
			"<table bgcolor = 'black' style=\"width:100%\"><tr ><td style = \"text-align:left;width:6%;color:white;\">"+
			"<h1 style=\"padding-top: 3%;\">JAVA</h1></td><td  style = \"text-align:center;width:88%;color:white;\">		"+
			"	<h1 style = \"padding-top:1%;\">Send PDF</h1></td><td style = \"width:6%;\"><ul><li class='dropdown'>"+
			"<a href='profile' class='dropbtn' style = \"font-size:112%;\">"+
			"<img style = 'width: 20px;height: 20px;background: #555;vertical-align:sub;'                 "+
			"  src='msuser1.png' alt='logo' /> "+username+
			"</a><div class='dropdown-content' ><a href = 'homepage'><img style = 'float: left;width: 20px;height: 20px;background: #555;'"+
			" src='home.png' /> Home</a>		<a href='userhistory'>"+
			"<img style = 'float: left;width: 20px;height: 20px;background: #555;'    src='history.png' alt='logo' /> User History("+countLogin+")</a>		<a href = 'contactus'>"+
			"<img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'contactus.png' /> Contact Us</a>		<a href='tasklist'>"+
			"<img style = 'float: left;width: 20px;height: 20px;background: #555;' src='logout.png' /> Log out</a>			       </div>			     </li>			   </ul></td></tr>"+
			"</table></header><br><br></div><div id = \"content\"><article><br><br>					<form id = 'i' name = 'aakash'>"+
			"<div class = \"contact\">					<p><block>NOTE:</block> if you are entering multiple email id's,"+
			" separate them with semicolons'(;)</p>					<br/><br/>					<h1>Your name :</h1>"+
			"<textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"name\" id = \"name\" required>"+
			"</textarea><br><br>					<h1>Your Mail-id :</h1>"+
			"<textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"sender\" id = \"sender\" required>"+
			"</textarea><br><br><h1>To :</h1><textarea form = \"i\" rows= \"2\" cols= \"100\" name = \"mailid\" id = 'tomail'>"+
			"</textarea><br><br><h1>Cc:</h1><textarea form = \"i\" rows= \"2\" cols= \"100\" name = \"Cc\" id='ccid'>"+
			"</textarea><br><br><h1>Bcc:</h1><textarea form = \"i\" rows= \"2\" cols= \"100\" name = \"Bcc\" id='bccid'>"+
			"</textarea><br><br><h1>Subject:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"2\" cols= \"100\" name = \"Subject\" required>"+
			"</textarea><br><br><h1>Message:</h1><textarea form = \"i\" style=\"resize:none\" rows= \"10\" cols= \"100\" name = \"body\" required>"+
			"</textarea><br><br><a href = '#'>";
		if(page == 1){
			responseString+=s.getUsername();
		}else{
			responseString+=s.getChallengeName();
		}
		responseString+="_history.pdf</a><br><br><input type = 'submit' name = 'SendPdf"+page+"' value = 'sendpdf' "+
			"onclick = \"return checkFill()\"></div>					</form>					<script src = 'mp.js' ></script>					</article><br><br></div>"+
			"<div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\">"+
			"<div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\">"+
			"<div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'>"+
			"<input type=\"image\" src='data:image/jpeg;base64,"+s.encoding("google_plus.png","png")+"' height = \"30\""+
			" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" "+
			"href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,"+
			s.encoding("Twitter_logo.png","png")+"\" height = \"30\" width = \"30\" id = 'twit'></div></a></td>"+
			"</tr></table></footer></div></body></div></html>";
		return responseString;
	}

	public static String sendPdf(String inString, Data s) throws Exception{
		String name = URLDecoder.decode(s.extract("name=(.*)&sender",inString),"UTF-8");
		String sender = URLDecoder.decode(s.extract("sender=(.*)&mailid",inString),"UTF-8");
		String mailid = URLDecoder.decode(s.extract("mailid=(.*)&Cc=",inString),"UTF-8");
		String ccid = URLDecoder.decode(s.extract("Cc=(.*)&Bcc=",inString),"UTF-8");
		String bccid = URLDecoder.decode(s.extract("Bcc=(.*)&Subject=",inString),"UTF-8");
		String subject = URLDecoder.decode(s.extract("Subject=(.*)&body=",inString),"UTF-8");
		String body = URLDecoder.decode(s.extract("body=(.*)&SendPdf",inString),"UTF-8");
		String num = URLDecoder.decode(s.extract("&SendPdf(.*)=sendpdf",inString),"UTF-8");
		String pdfName = "";
		if(num.equals("1")){
			pdfName = s.getUsername();
		}else{
			pdfName = s.getChallengeName();
		}

		Properties props = new Properties();
		  props.put("mail.smtp.host", "smtp.gmail.com");
		  props.put("mail.smtp.socketFactory.port", "465");
		  props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.port", "465");
	 
	  	Session session = Session.getDefaultInstance(props,
		   new javax.mail.Authenticator() {
		   protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
		   return new javax.mail.PasswordAuthentication("a.hs771994@gmail.com","ClarkKent");
		   }
		  });

		 try{  
		    MimeMessage message = new MimeMessage(session);  
		    message.setFrom(new InternetAddress("a.hs771994@gmail.com")); 
			if(!mailid.equals(""))
		    		message.addRecipient(Message.RecipientType.TO,new InternetAddress(mailid)); 
			if(!ccid.equals(""))
				message.addRecipient(Message.RecipientType.CC, new InternetAddress(ccid));
			if(!bccid.equals(""))
				message.addRecipient(Message.RecipientType.BCC, new InternetAddress(bccid));
			message.setReplyTo(new javax.mail.Address[]
			{
			    new javax.mail.internet.InternetAddress(sender)
			});
		    message.setSubject(subject);     
		    BodyPart messageBodyPart1 = new MimeBodyPart();  
		    messageBodyPart1.setText(body);  	
		    MimeBodyPart messageBodyPart2 = new MimeBodyPart();  	   
		    DataSource source = new FileDataSource(pdfName+"_history.pdf");  
		    messageBodyPart2.setDataHandler(new DataHandler(source));  
		    messageBodyPart2.setFileName(pdfName+"_history.pdf");     
		    Multipart multipart = new MimeMultipart();  
		    multipart.addBodyPart(messageBodyPart1);  
		    multipart.addBodyPart(messageBodyPart2);      
		    message.setContent(multipart );       
		    Transport.send(message);  
		   }catch (MessagingException ex) {ex.printStackTrace();}  
	Process p = Runtime.getRuntime().exec("rm "+pdfName+"_history.pdf");
	return num;
	}

}
