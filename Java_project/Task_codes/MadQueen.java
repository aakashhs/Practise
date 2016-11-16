import java.io.*;
import java.util.*;
class MadQueen
{
	String filename;
	public static void main (String[] args)throws IOException
    	{
        	String line;
		String elements[] = new String[3];
		String coins[] = new String[10];
		int denominations[] = new int[10];
		int index = 0;
        	for(int argument = 0; argument<args.length;argument++)
		{
			index = 0;
	        	line = argument.trim();
			if (line.isEmpty())
			{
				System.out.println("Blank Line!");
				continue;
			}
			try{
			StringTokenizer string_token = new StringTokenizer(line,"|");  
		 	while (string_token.hasMoreTokens()) 
			{  
				elements[index] = string_token.nextToken(); 
				index++;
			}  
			if(elements.length > 3)
			{
				System.out.println("Invalid Input ");
				continue;
			}
			StringTokenizer token = new StringTokenizer(elements[2]," ");  
			index = 0;
			int coins_length = 0;
		 	while (token.hasMoreTokens()) 
			{  
				coins[index] = token.nextToken();
				index++;  
			}  
			coins_length = index;
			int no_of_times = Integer.parseInt(elements[0].trim());
			int maximum_value = Integer.parseInt(elements[1].trim());
			for(index = 0; index < coins_length; index++)
			{
				denominations[index] = Integer.parseInt(coins[index].trim());
			}
			denominations[index] = maximum_value + 1;
			int maximum = 0, count = 0;
			for(int denomination : denominations)
			{
				while(denomination > maximum + 1 && maximum < maximum_value)
				{
					count += 1;
					maximum += (maximum + 1) * no_of_times;
				}
				maximum += denomination * no_of_times;
				if(maximum_value <= maximum)
					break;
			}
			System.out.println(count);
			} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
        }
}


