import java.io.*;
import java.util.*;
public class PrimeCount
{
	public static void main(String args[]){
		int lvalue = 0, rvalue = 0, count = 0, index = 0;
		for(int index = 0; index<args.length;index++){
		try{
		String[] line = args[index].split(",");
		lvalue = Integer.parseInt(line[0]);
		rvalue = Integer.parseInt(line[1]);
		ArrayList<Integer> primeValues = new ArrayList<Integer>();
		for (int iterator = lvalue; iterator <= rvalue; iterator++)
		{
			if(checkPrime(iterator) == true)
				primeValues.add(iterator);
		}
		System.out.println(primeValues);
		index = primeValues.size() - 1;
		while(index > 0){
			int left_adjacent = index - 1;
			int right_adjacent = index - 2; 
			while(right_adjacent >= 0){
					if((primeValues.get(right_adjacent) + primeValues.get(left_adjacent) + 1) == primeValues.get(index)){
						count += 1;
						break;
					}
					right_adjacent -= 1;
					left_adjacent -= 1;
			}
			index--;
		}
		System.out.println(count);
		} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
	}
	public static boolean checkPrime(int number){
		int i, half = 0, flag = 0;    
		half = number/2;    
		for(i = 2;i <= half;i++){    
			if(number % i == 0){    
				return false;
			}    
		}    
		return true;
	}  
}

