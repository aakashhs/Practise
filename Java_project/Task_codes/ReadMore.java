import java.io.*;

public class ReadMore{
	public static void main(String args[]) throws Exception {
		String line;
		StringBuilder sb;
		for(int index = 0; index<args.length;index++) {
			sb = new StringBuilder();
			line = args[index].trim();
			try{
			if (line.length() == 0)
			{
				System.out.println("Blank Line!!");
				continue;
			}
			else if(line.length() > 300){
				System.out.println("line lenght must be less than 300");
			}
			else if(line.length() < 58)
			{	System.out.println(line);
			}
			else
			{
				sb.append(line.substring(0,43)+"...<Read More>");
				System.out.println(sb);
			}
			} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
	}
}
