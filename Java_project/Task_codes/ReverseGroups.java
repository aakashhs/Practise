import java.io.*;
import java.util.*;
public class ReverseGroups{
	public static void main(String args[]) throws Exception {
		String line;
		int groupSize = 0,k=0,inputLen = 0;
		for(int index = 0; index<args.length;index++) {
			line = args[index].trim();
			if (line.length() == 0)
			{
				System.out.println("Blank Line!!");
				continue;
			}
			try{
			String input[] = line.split(";");
			groupSize = Integer.parseInt(input[1]);
			inputLen = input[0].length();
			k = 0;
			ArrayList<Integer> numbers[] = new ArrayList[(inputLen/(2*groupSize))+1];		
			for(int index = 0; index < ((inputLen / (2 * groupSize)) + 1); index++){
				numbers[index] = new ArrayList<>();
				for(int i = 0;i<groupSize;i++){
					if(k < inputLen){
						numbers[index].add(input[0].charAt(k)-'0');
						k+=2;
					}
				}
			}
			ArrayList<Integer> combine = new ArrayList<Integer>();
			for(int i = 0;i<numbers.length;i++){
				if(numbers[i].size()==groupSize){Collections.reverse(numbers[i]);}
				combine.addAll(numbers[i]);
			}
			String[] num = new String[combine.size()];
			for (int i = 0; i < combine.size(); i++){num[i] = combine.get(i).toString();}
			System.out.println(String.join(",",num));
			} catch(Exception e){System.out.println("invalid input. Refer the input sample above!");continue;}
		}
	}
}
