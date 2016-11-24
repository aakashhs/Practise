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
public class Verify{

	public static boolean verify(String inString, Data s, Statement stmt, ResultSet res) throws Exception{
		String username = URLDecoder.decode(inString.substring(inString.indexOf("=")+1,inString.indexOf("&")),"UTF-8");
		String password = URLDecoder.decode(inString.substring(inString.lastIndexOf("=")+1,inString.lastIndexOf(" ")),"UTF-8");
		int count=0;
		res = stmt.executeQuery("SELECT count(*) FROM JCREDENTIALS where username = '"+username+"' and password = '"+password+"'");
		while (res.next()){
			count = res.getInt("count");
		}
		if(count != 0){
			String time = s.getTime();
			String date = s.getDate();
			stmt.executeUpdate("insert into jloginhistory (username, time, date) values('"+username+"','"+time+"','"+date+"')");
			s.setUsername(username);
			res = stmt.executeQuery("select count(*) from jloginhistory where username = '"+username+"'");
			int c = 0;
			while(res.next()){
				c = res.getInt("count");
			}
			s.setCountLogin(c);
			return true;
		}
		else
		{
			return false;
		}
	}

	public static boolean validate(String inString, Data s, Statement stmt, ResultSet res) throws Exception{
		String username = s.extract("Userid=(.*)&password",inString);
		int count = 0;
		res = stmt.executeQuery("SELECT count(*) FROM JCREDENTIALS where username = '"+username+"'");
		while (res.next()){
			count = res.getInt("count");
		}
		if(count != 0){
			return false;
		}
		String name = URLDecoder.decode(s.extract("Name=(.*)&Emailid",inString),"UTF-8");
		String emailid = URLDecoder.decode(s.extract("Emailid=(.*)&latitude",inString),"UTF-8");
		String address = URLDecoder.decode(s.extract("address=(.*)&Userid",inString),"UTF-8");
		String coordinates = URLDecoder.decode(s.extract("&latitude=(.*)&address",inString),"UTF-8");
		String password = URLDecoder.decode(s.extract("password=(.*)&confirmPassword",inString),"UTF-8");
		stmt.executeUpdate("insert into jcredentials values('"+username+"','"+password+"','"+name+"','"+emailid+"','"+address+"','"+coordinates+"')");
		String time = s.getTime();
		String date = s.getDate();
		stmt.executeUpdate("insert into jloginhistory (username, time, date) values('"+username+"','"+time+"','"+date+"')");
		s.setUsername(username);
		s.setCountLogin(1);
		return true;
	}
}
