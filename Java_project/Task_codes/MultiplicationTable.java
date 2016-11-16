//import java.io.*;
import java.util.*;
class MultiplicationTable
{
	public static void main (String[] args)
	{	int line = 0;
		for(int index = 0; index<args.length;index++){
			try{
			line=Integer.parseInt(args[index]);
			for(int i = 1; i<=line; i++){ 
				for(int j = 1; j<=12; j++) {
					System.out.printf("%4s",i * j);
				}
				System.out.println();
			}
			} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
	}
}
