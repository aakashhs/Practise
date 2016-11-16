package UI_codes;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.net.*;
import java.util.*;
import java.util.Base64;
import java.text.SimpleDateFormat;
import java.nio.file.*;
import java.sql.*;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import javax.xml.bind.DatatypeConverter;
public class SendMail {
	public static void contactMail(String inString, Data s) throws Exception{
		String name = URLDecoder.decode(s.extract("name=(.*)&mailid",inString),"UTF-8");
		String emailid = URLDecoder.decode(s.extract("mailid=(.*)&body",inString),"UTF-8");
		String body = URLDecoder.decode(s.extract("body=(.*)&Send=",inString),"UTF-8");	 

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

		  try {
			   MimeMessage message = new MimeMessage(session);
			   MimeMessage messagedev = new MimeMessage(session);
			   messagedev.setFrom(new InternetAddress("a.hs771994@gmail.com"));
			   messagedev.addRecipient(Message.RecipientType.TO,new InternetAddress("a.hs771994@gmail.com"));
			   messagedev.setSubject("From Application");
			   messagedev.setText("name : "+name+"\nmail: "+emailid+"\nbody: \n"+body);
			   Transport.send(messagedev);
			   message.setFrom(new InternetAddress("a.hs771994@gmail.com"));
			   message.addRecipient(Message.RecipientType.TO,new InternetAddress(emailid));
			   message.setSubject("Concerning Your Feedback");
			   message.setText("Dear ,\n\tYour feedback on our application has been received with gratitude and is being reviewed by our developers. We promise to respond soon on this matter. \nThanking you,\n\nregards,\nJavaApp\nNOTE: This is an auto-generated email. Kindly do not reply.");
			   Transport.send(message);
		  } catch (MessagingException e) {throw new RuntimeException(e);}
	 
	 }
}
