import java.io.*;
import java.util.*;
public class JustifyText
{
	public static void main(String[] args) throws Exception
	{
		String line;
		for(int index = 0; index<args.length;index++) {
			line = args[index].trim();
			if (line.length() == 0)
			{
				System.out.println("Blank Line!!");
				continue;
			}
			try{
			String[] words = line.split(" ");
			StringBuilder newLine = new StringBuilder();
			int line_length = 0;
			for (int i = 0; i < words.length;i++){
				if (words[i].length() + line_length <= 80){
					newLine.append(words[i] + " ");
					line_length += words[i].length() + 1;
				}
				else {
					System.out.println(spaces(newLine));
					newLine.delete(0,newLine.length()-1);
					newLine.append(words[i] + " ");
					line_length = words[i].length() + 1;
				}
			}
			System.out.println(newLine);	
			} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
	}
	public static String spaces(StringBuilder line){
		int len = line.length();
		String[] words = line.toString().split(" ");
		for (int i = 0; i < words.length; i++)
			words[i] += " ";
		int lengthMissing = 80 - len;
		int word_idx = 0;
		while(lengthMissing>=0){
			words[word_idx] += " ";
			word_idx++;
			word_idx %= words.length - 1;
			lengthMissing--;
		}
		return String.join("",words);
	}
}
