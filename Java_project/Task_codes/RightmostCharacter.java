import java.io.*;
import java.util.*;
public class RightmostCharacter{
	public static void main(String args[]) throws Exception {
		String line;int pos = 0;
		for(int index = 0; index<args.length;index++) {
			line = args[index].trim();
			if (line.length() == 0)
			{
				System.out.println("Blank Line!!");
				continue;
			}
			try{
			String[] input = line.split(",");
			if((pos = input[0].lastIndexOf(input[1]))==-1){System.out.println("Character not present");continue;}
			System.out.println(pos + 1);
			} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
	}
}
