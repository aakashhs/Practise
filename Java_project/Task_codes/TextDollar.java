import java.io.*;
import java.util.*;
class TextDollar
{	static int[] numbers = {1000000, 1000, 100, 90, 80, 70, 60, 50, 40, 30, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
	static String[] text = {"Million","Thousand","Hundred","Ninety","Eighty","Seventy","Sixty","Fifty","Forty","Thirty","Twenty","Nineteen","Eighteen","Seventeen","Sixteen","Fifteen","Fourteen","Thirteen","Twelve",
"Eleven","Ten","Nine","Eight","Seven","Six","Five","Four","Three","Two","One"};
	public static void main (String[] args) throws IOException
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
			int number = Integer.parseInt(line);
			System.out.println(convert(number)+"Dollars");
			} catch(Exception e){System.out.println("invalid input");continue;}
			
		}
	}
	public static String convert(int number){
		for(int i=0;i<numbers.length;i++){
			if(number == 0){
				return " ";
			}
			else if(number < 10){
				return text[text.length - number];
			}
			else if(number < 100 && number/numbers[i] > 0){
				if(number % numbers[i] == 0)
					return text[i];
				return text[i]+convert(number % numbers[i]);
			}
			else if(number/numbers[i] > 0){
				return convert(number / numbers[i]) + text[i] + convert(number % numbers[i]);
			}
	
		}
		return "";
	}
}
