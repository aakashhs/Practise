import java.io.*;
import java.util.*;
public class EmailValidation
{
	public static void main(String args[]) throws IOException{
		String line;
		for(int index = 0; index<args.length;index++) {
			line = args[index].trim();
			if (line.length() == 0)
			{
				System.out.println("Blank Line!!");
				continue;
			}
			try{
			System.out.println(isValidEmailAddress(line));
			} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
	}
	public static boolean isValidEmailAddress(String email) {
		String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(email);
		return m.matches();
    	}
}
