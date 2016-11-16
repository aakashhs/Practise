import java.io.*;
import java.util.*;
public class Coins
{
	public static void main(String[] args) throws Exception
	{
		//File file = new File("coins.txt");
		//BufferedReader in = new BufferedReader(new FileReader(file));
		String line;
		int noOfArrangements = 0;
		boolean secondLine = false;
		int amount = 0,coins = 0;
		for(int arg = 0; arg<args.length;arg++) {
			line = args[arg].trim();
			if (line.length() == 0)
			{
				System.out.println("Blank Line!!");
				continue;
			}
			try{
			if(secondLine == false){
				String[] amount_and_coins = line.split(" ");
				amount = Integer.parseInt(amount_and_coins[0]);
				coins = Integer.parseInt(amount_and_coins[1]);
				secondLine = true;
				continue;
			}
			char[] list = line.toCharArray();
			int[] changes = new int[list.length];
			int index = 0;
			for (char letter : list) {if (letter != ' ') {changes[index] = Character.getNumericValue(letter);index++;} }
			secondLine = false;
			noOfArrangements = count(changes, coins, amount);
			System.out.println(noOfArrangements);
			} catch(Exception e){System.out.println("invalid input");secondLine = false;continue;}
		}
	}
	public static int count(int[] changes, int coins, int amount){
		if(amount == 0)
			return 1;
		else if(amount < 0)
			return 0;
		else if(coins <= 0 && amount >= 1)
			return 0;
		else
			return count(changes , coins - 1, amount) + count(changes , coins , amount - changes[coins-1]);
	}
}
