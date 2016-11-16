import java.io.*;
import java.util.*;
public class StringSearching{
	static char[] spec = {'?', '<', '>','[', ']', '}', '{', '=', '-', ')', '(', '&', '^', '%', '$', '#', '`', '~'};
	public static void main(String args[]) throws Exception{
		String line;
		
		for(int index = 0; index<args.length;index++) {
			line = args[index].trim();
			if (line.length() == 0)
			{
				System.out.println("Blank Line!!");
				continue;
			}
			try{
			String lineArray[] = line.split(",");
			for(char s : spec) {
				if(lineArray[1].indexOf(s) != -1) {System.out.println("Invalid Input!!");continue;}
			}
			System.out.println(lineArray[0].matches("(.*)"+lineArray[1]+"(.*)"));
			} catch(Exception e){System.out.println("invalid input.Refer the input sample above");continue;}
		}
		
	}
}
