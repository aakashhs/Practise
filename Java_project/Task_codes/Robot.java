import java.util.*;
public class Robot
{
	static final Integer MIN_X = 0,MIN_Y = 0,MAX_X = 3,MAX_Y = 3;
	public static Integer count = 0;
	public static void main(String[] args) throws Exception
	{	String[] line = null;
		for(int arg = 0;arg<args.length;arg++){
			try{
			line = args[arg].trim().split(",");
			boolean[][] visited = new boolean[Integer.parseInt(line[0])][Integer.parseInt(line[1])];
			go(visited, MIN_X, MIN_Y);
			System.out.println(count);
			} catch(Exception e){System.out.println("invalid input");continue;}
		}
	}
	public static void go(boolean[][] visited, int x, int y)
	{
		if (x == MAX_X && y == MAX_Y)
		{
			++count;
			return;
		}

		if (visited[x][y])
		{
			return;
		}

		visited[x][y] = true;

		if (x > MIN_X)
		{
			go(fixJava(visited), x - 1, y);
		}
		if (x < MAX_X)
		{
			go(fixJava(visited), x + 1, y);
		}
		if (y > MIN_Y)
		{
			go(fixJava(visited), x, y - 1);
		}
		if (y < MAX_Y)
		{
			go(fixJava(visited), x, y + 1);
		}
	}

	public static boolean[][] fixJava(boolean[][] original)
	{
		boolean[][] copy = new boolean[original.length][];
		
		for (int i = 0; i < original.length; ++i)
		{
			copy[i] = Arrays.copyOf(original[i], original[i].length);
		}
		
		return copy;
	}
}
