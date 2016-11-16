import java.io.*;
import java.util.*;
class DistinctSubsequence{
	public static void main(String [] args)
	{
			String line;
			for(int arg = 0;arg<args.length;arg++) {
				line = args[arg];
				if (line.length() == 0)
				{
					System.out.println("Blank Line!!");
					continue;
				}
				try{
				String [] words = new String[2];
				words = line.split(",");
				if (words.length > 2){
					System.out.println("invalid input");
				}
				else if (words[0].length() < words[1].length()){
					System.out.println("lenght of substring must be less than that of string");
				}
				else {	
					System.out.println(distincts(words[0], words[1]));
				}	
				} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
			}
		}
		catch(Exception e){
         		e.printStackTrace();
      		}	
	}
	public static int distincts(String string, String substring) {
		int[][] table = new int[string.length() + 1][substring.length() + 1];
	 
		for (int i = 0; i < string.length(); i++)
			table[i][0] = 1;
	 
		for (int i = 1; i <= string.length(); i++) {
			for (int j = 1; j <= substring.length(); j++) {
				if (string.charAt(i - 1) == substring.charAt(j - 1)) {
					table[i][j] += table[i - 1][j] + table[i - 1][j - 1];
				} 
				else {
					table[i][j] += table[i - 1][j];
				}
			}
		}	 
		return table[string.length()][substring.length()];
	}
}
