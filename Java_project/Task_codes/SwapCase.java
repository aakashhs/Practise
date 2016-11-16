import java.io.*;
public class SwapCase{
	public static void main(String args[]) throws Exception {
		String line;
		StringBuilder sb;
		for(int index = 0; index<args.length;index++) {
			sb = new StringBuilder();
			line = args[index].trim();
			if (line.length() == 0)
			{
				System.out.println("Blank Line!!");
				continue;
			}
			try{
			for(int i = 0; i < line.length(); i++)
			{	char c = line.charAt(i);
				if(c > 64 && c < 123){
					sb.append(Character.isUpperCase(c) ? Character.toLowerCase(c) : Character.toUpperCase(c));
				}
				else
				{     sb.append(c);}
			}
			System.out.println(sb);
			} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
	}
}
