import java.io.*;
import java.util.*;
class RomanNumerals
{	static String roman[] = {"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"};
	static int [] numbers = {1000,900,500,400,100,90,50,40,10,9,5,4,1};
	public static void main (String[] args) throws IOException
	{	int number;
		
		String line;
		try {
			for(int index = 0; index<args.length;index++) {
				line = args[index].trim();
				if (line.length() == 0)
				{
					System.out.println("Blank Line!!");
					continue;
				}
				try{
				number = Integer.parseInt(line)
				if(number > 0 && number < 4000){
					System.out.println(conversion(number));
				}
				else	{
					System.out.println("Number outta range!");
				}
				} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
			}
		}
		catch(NumberFormatException nfe){
			System.out.println("Invalid input nfe");
		}
		catch(Exception e){
			System.out.println("Invalid input");
		}
	}
	public static String conversion(int number){
		String romanValue = new String();
		for (int i=0;i<numbers.length;i++){
			while(number >= numbers[i]) {
				number -= numbers[i];
				romanValue += roman[i];
			}
		}
		return romanValue;
	}
}
