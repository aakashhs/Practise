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

public class Data{
	private String username="Guest", challengeName=null, nav = null,inputResponse = "";
	private int countLogin = 0;
	static final Calendar cal = Calendar.getInstance();
	static SimpleDateFormat sdf = null;
	static final TimeZone obj = TimeZone.getTimeZone("IST");
	public void setUsername(String username){
		this.username = username;		
	}

	public void setInputResponse(String inputResponse){
		this.inputResponse = inputResponse;
	}

	public String getInputResponse(){
		return inputResponse;
	}

	public void setNav(String nav){
		this.nav = nav;		
	}

	public String getNav(){
		return nav;
	}

	public void setChallengeName(String challengeName){
		this.challengeName = challengeName;		
	}

	public void setCountLogin(int countLogin){
		this.countLogin = countLogin;
	}

	public String getUsername(){		
		return username;
	}

	public String getChallengeName(){		
		return challengeName;
	}
	
	public int getCountLogin(){
		return countLogin;
	}
	
	public static String encoding(String imageValue,String type) throws Exception{
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ImageIO.write(ImageIO.read(new File("Images/"+imageValue)), type, bos);
		byte[] imageBytes = bos.toByteArray();
	 	bos.close();
		return DatatypeConverter.printBase64Binary(imageBytes);
	}
	
	public static String extract(String compile, String match){
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(compile);
		java.util.regex.Matcher m = p.matcher(match);
		String value = null;
		if (m.find()) {
		    value = m.group(1);
		}
		return value;
	}
	
	public static String getTime(){
		sdf = new SimpleDateFormat("HH:mm");	
		sdf.setTimeZone(obj);	 
		return sdf.format(cal.getTime());	
	}
	public static String getDate(){
		sdf = new SimpleDateFormat("dd/MM/yyyy");
		sdf.setTimeZone(obj);
		return sdf.format(cal.getTime());
	}
	
}
