import java.io.*;
import java.util.*;
public class Pangrams{
	public static void main(String args[]) throws IOException {
		final char[] alphabet = "abcdefghijklmnopqrstuvwxyz".toCharArray();
		String line;
		int count = 0;
		
		for(int index = 0; index<args.length;index++) {
			char[] missing_alphabets = new char[26];
			count = 0;
			line = args[index].trim();
			if (line.length() == 0)
			{
				System.out.println("Blank Line!!");
				continue;
			}
			try{
			for(int i = 0; i < alphabet.length - 1; i++){ 
				if(line.indexOf(alphabet[i]) == -1){
					missing_alphabets[count] = alphabet[i];
					count++;
				}
			}
			if(missing_alphabets[0] == 0){
				System.out.println("NULL"); 
			}
			else {
				String result = new String(missing_alphabets);
				System.out.println(result);
			}
			} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
	}
}
