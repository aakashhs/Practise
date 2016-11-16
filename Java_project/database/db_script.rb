require 'pg'
			con = PG.connect :dbname => 'mahaswami', :user => 'postgres', :password => "root"#change accordingly after creating database 'mahaswami'
			con.exec "drop table if exists jcredentials"
			con.exec "create table jcredentials(username text not null, password text,name text,emailid text,address text,coordinates text)"
		
			con.exec "drop table if exists jchallengehistory"
			con.exec "create table jchallengehistory(username text not null, challenge_name text, date text, time text, input text, output text, id serial primary key)"

			con.exec "drop table if exists jloginhistory"
			con.exec "create table jloginhistory(username text not null, time text, date text, id serial primary key)"			
			con.exec "drop table if exists jchallenges"
			con.exec "create table jchallenges(challenge_name text, description text)"
			con.exec "insert into jchallenges (challenge_name, description) values
('Coins','
How many different ways can you make change for an amount, given a list of coins? In this problem, your code will need to efficiently compute the answer.

Task

Write a program that, given

The amount  to make change for and the number of types  of infinitely available coins
A list of  coins - 
Prints out how many different ways you can make change from the coins to STDOUT.

The problem can be formally stated:

Given a value , if we want to make change for  cents, and we have infinite supply of each of  valued coins, how many ways can we make the change? The order of coins doesn’t matter.

Solving the overlapping subproblems using dynamic programming

You can solve this problem recursively, but not all the tests will pass unless you optimise your solution to eliminate the overlapping subproblems using a dynamic programming solution

Or more specifically;

If you can think of a way to store the checked solutions, then this store can be used to avoid checking the same solution again and again.
Input Format

	First line will contain 2 integer N and M respectively. 
	Second line contain M integer that represent list of distinct coins that are available in infinite amount.

Constraints

	The list of coins will contain distinct integers.
Output Format

	One integer which is the number of ways in which we can get a sum of N from the given infinite supply of M types of coins.

Sample Input

	4 3
	1 2 3 
Sample Output

	4
Sample Input #02

	10 4
	2 5 3 6
Sample Output #02

	5
Explanation

Example 1: For  and  there are four solutions: 

Example 2: For  and  there are five solutions: .

Hints

Think about the degenerate cases:

How many ways can you give change for 0 cents?
How many ways can you give change for >0 cents, if you have no coins?
'), 



('Prime Count', '
Find the Prime numbers beetween the given Range(1 t0 20),
Find the sum of two consecutive prime number and 1 is prime number in the given range 
for example:
input:
	1,20
output:
	2'),
('Multiplication Table', '

Print out the grade school multiplication table upto 12*12.
INPUT SAMPLE:
	12
OUTPUT SAMPLE:
	Print out the table in a matrix like fashion, 
	each number formatted to a width of 4 (The numbers are right-aligned and strip out leading/trailing spaces on each line). 
	The first 3 line will look like:
	1   2   3   4   5   6   7   8   9  10  11  12
	2   4   6   8  10  12  14  16  18  20  22  24
	3   6   9  12  15  18  21  24  27  30  33  36'),

('Roman Numerals', '

Write a program to convert a cardinal number to a Roman numeral.

INPUT SAMPLE:

	Your program should accept as its first argument a path to a filename. Input example is the following

	159
	296
	3992
	Input numbers are in range [1, 3999]

OUTPUT SAMPLE:

	Print out Roman numerals.

	CLIX
	CCXCVI
	MMMCMXCII'),
('String Searching', '

You are given two strings. Determine if the second string is a substring of the
first (Do NOT use any substr type library function). The second string may contain
an asterisk\"*\" which should be treated as a regular expression i.e. matches 
zero or more characters. The asterisk can be escaped by a \ char in which case
it should be interpreted as a regular \"*\" character. 
To summarize: the strings can contain alphabets, numbers, * and \ characters.

INPUT SAMPLE:

	Your program should accept as its first argument a path to a filename. 
	The input file contains two comma delimited strings per line. E.g.

	Hello,ell
	This is good, is
	CodeEval,C*Eval
	Old,Young
OUTPUT SAMPLE:
	If the second string is indeed a substring of the first, print out a true(lowercase), 
	else print out a false(lowercase), one per line. E.g.

	true
	true
	true
	false '),
('Swap Case', '


Write a program which swaps letters case in a sentence. All non-letter characters should remain the same.

INPUT SAMPLE:

	Your program should accept as its first argument a path to a filename. Input example is the following

	Hello world!
	JavaScript language 1.8
	A letter
	OUTPUT SAMPLE:

Print results in the following way.

	hELLO WORLD!
	jAVAsCRIPT LANGUAGE 1.8
	a LETTER'),

('Read More', '
You are given a text. Write a program which outputs its lines according to the following rules:

If line length is ≤ 55 characters, print it without any changes.
If the line length is > 55 characters, change it as follows:
Trim the line to 40 characters.
If there are spaces  in the resulting string, trim it once again to the last space (the space should be trimmed too).
Add a string ... <Read More> to the end of the resulting string and print it.
INPUT SAMPLE:

	The first argument is a file. The file contains a text.

	For example:

	1  Tom exhibited.
	2  Amy Lawrence was proud and glad, and she tried to make Tom see it in her face - but he wouldnt look.
	3  Tom was tugging at a button-hole and looking sheepish.
	4  Two thousand verses is a great many - very, very great many.
	5  Toms mouth watered for the apple, but he stuck to his work.

OUTPUT SAMPLE:

	Print to stdout the text lines with their length limited according to the rules described above.

	For example:

	1  Tom exhibited.
	2  Amy Lawrence was proud and glad, and... <Read More>
	3  Tom was tugging at a button-hole and looking sheepish.
	4  Two thousand verses is a great many -... <Read More>
	5  Toms mouth watered for the apple, but... <Read More>

CONSTRAINTS:

The maximum length of a line in the input file is 300 characters.
There cannot be more than one consequent space character in the input data.'),
('Pangrams', '

The sentence \"A quick brown fox jumps over the lazy dog\" contains every single letter in the alphabet. 
Such sentences are called pangrams. You are to write a program, which takes a sentence,
 and returns all the letters it is missing (which prevent it from being a pangram). 
 You should ignore the case of the letters in sentence, and your return should be all lower case letters, in alphabetical order. 
 You should also ignore all non US-ASCII characters.In case the input sentence is already a pangram, print out the string NULL

INPUT SAMPLE:

	Your program should accept as its first argument a path to a filename. This file will contain several text strings, one per line. E.g.

	A quick brown fox jumps over the lazy dog
	A slow yellow fox crawls under the proactive dog

OUTPUT SAMPLE:

	Print out all the letters each string is missing in lowercase, alphabetical order . E.g.

	NULL
	bjkmqz'),
('Distinct Subsequence', '
A subsequence of a given sequence S consists of S with zero or more elements deleted. Formally,
 a sequence Z = z1z2..zk is a subsequence of X = x1x2...xm, 
 if there exists a strictly increasing sequence of indicies of X such that for all j=1,2,...k we have Xij = Zj. 
 E.g. Z=bcdb is a subsequence of X=abcbdab with corresponding index sequence <2,3,5,7>

INPUT SAMPLE:

	Your program should accept as its first argument a path to a filename. 
	Each line in this file contains two comma separated strings. The first is 
	the sequence X and the second is the subsequence Z. E.g.

	1)  babgbag,bag
	2)  rabbbit,rabbit


OUTPUT SAMPLE:
	Print out the number of distinct occurrences of Z in X as a subsequence E.g.

	1) 5
	2) 3'),
('Text Dollar', '
Credits: This challenge has been authored by Terence Rudkin 

You are given a positive integer number. This represents the sales made that day in your department store.
The payables department however, needs this printed out in english. 
NOTE: The correct spelling of 40 is Forty. (NOT Fourty)

INPUT SAMPLE:

	Your program should accept as its first argument a path to a filename.
	The input file contains several lines. Each line is one test case. Each line contains a positive integer. E.g.

	3
	10
	21
	466
	1234
OUTPUT SAMPLE:

	For each set of input produce a single line of output which is the english textual representation of that integer. 
	The output should be unspaced and in Camelcase. Always assume plural quantities. 
	You can also assume that the numbers are < 1000000000 (1 billion). I
	n case of ambiguities e.g. 2200 could be TwoThousandTwoHundredDollars or TwentyTwoHundredDollars, 
	always choose the representation with the larger base i.e. TwoThousandTwoHundredDollars. 
	For the examples shown above, the answer would be:

	ThreeDollars
	TenDollars
	TwentyOneDollars
	FourHundredSixtySixDollars
	OneThousandTwoHundredThirtyFourDollars'),


('Reverse Groups', '
Given a list of numbers and a positive integer k, reverse the elements of the list, k items at a time.
If the number of elements is not a multiple of k, then the remaining items in the end should be left as is.

INPUT SAMPLE:

	Your program should accept as its first argument a path to a filename.
	 Each line in this file contains a list of numbers and the number k, separated by a semicolon.
	  The list of numbers are comma delimited. E.g.

	1,2,3,4,5;2
	1,2,3,4,5;3


OUTPUT SAMPLE:

	Print out the new comma separated list of numbers obtained after reversing. E.g.

	2,1,4,3,5
	3,2,1,4,5'),


('Email Validation', '
You are given several strings that may/may not be valid emails. 
You should write a regular expression that determines if the email id is a valid email id or not. 
You may assume all characters are from the english language.

INPUT SAMPLE:

	Your program should accept as its first argument a filename. This file will contain several text strings, one per line. 
	Ignore all empty lines. E.g. 


	foo@bar.com
	this is not an email id
	admin#codeeval.com
	good123@bad.com

OUTPUT SAMPLE:

	Print out true (all lowercase) if the string is a valid email. Else print out false (all lowercase). E.g.

	true
	false
	false
	true'),
('Justify Text', '
Write a program that reformats the text into lines of 80 symbols by stretching the text to full line width by adding extra spaces.

Longer series of spaces should go first. For example:

if you need to add just one extra space, add it between the first and the second word
if there are 4 words in a line, and you need 10 spaces to stretch the text up to 80 symbols, 
add 4 spaces between the first and the second word, 3 spaces between the second and the third word,
 and 3 spaces between the third and the fourth word.
The last line of the paragraph remains unchanged.

INPUT SAMPLE:

	The first argument is a filename. The input file contains a text.

	For example:

	Hello, World!
	The precise 50-digits value of Pi is 3.14159265358979323846264338327950288419716939937510.
	But he who would be a great man ought to regard, not himself or his interests, but 
	what is just, whether the just act be his own or that of another. Next as to 
	habitations. Such is the tradition.


OUTPUT SAMPLE:

	Print to stdout the text, reformatted into lines of 80 symbols by stretching the text to the full line width by adding extra spaces.

	For example:

	Hello, World!
	The         precise         50-digits        value        of        Pi        is
	3.14159265358979323846264338327950288419716939937510.
	But  he  who would be a great man ought to regard, not himself or his interests,
	but what is just, whether the just act be his own or that of another. Next as to
	habitations. Such is the tradition.'),
('Robot', '

A robot is located in the upper-left corner of a 4×4 grid. 
The robot can move either up, down, left, or right, but cannot go to the same location twice. 
The robot is trying to reach the lower-right corner of the grid. 
Your task is to find out the number of unique ways to reach the destination.

INPUT SAMPLE:
	enter the width and height seperated with comma
	4,4

OUTPUT SAMPLE:

	Print out the number of unique ways for the robot to reach its destination.
	 The number should be printed out as an integer ≥0.'),
('Working Experience', '
You are building a new social platform and want to store users work experience. 
You have decided to calculate the total experience of each user in years based on the time periods that they provided. 
Using this approach, you need to be sure that you are taking into account the overlapping time periods in order to retrieve 
the actual work experience in years.

For example:

Jan 2010-Dec 2010
Jan 2010-Dec 2010
Two jobs with 12 months of experience each, but actual work experience is 1 year because of the overlapping time periods. 
The task is to calculate the actual work experience based on the list of time intervals.

INPUT SAMPLE:

	Your program should accept a path to a filename as its first argument. Each line of the file contains a list of 
	time periods separated by a semicolon and a single space. 
	Each time period is represented as the begin date and the end date. 
	Each date consists of a month as an abbreviated name and a year with century as a decimal number separated by a single space. 
	The begin date and the end date are separated by a hyphen.

	For example:

	Feb 2004-Dec 2009; Sep 2004-Jul 2008
	Aug 2013-Mar 2014; Apr 2013-Aug 2013; Jun 2014-Aug 2015; Apr 2003-Nov 2004; Apr 2014-Jan 2015
	Mar 2003-Jul 2003; Nov 2003-Jan 2004; Apr 1999-Nov 1999
	Apr 1992-Dec 1993; Feb 1996-Sep 1997; Jan 2002-Jun 2002; Sep 2003-Apr 2004; Feb 2010-Nov 2011
	Feb 2004-May 2004; Jun 2004-Jul 2004


OUTPUT SAMPLE:

	Print out the actual work experience in years for each test case.

	For example:

	5
	4
	1
	6
	0
CONSTRAINTS:

The number of lines in a file is in a range from 20 to 40.
The dates are in a range from Jan 1990 to Dec 2020.
The end date is greater than the begin date.
The begin date is the first day of a given month, and the end date is the last day of a given month.'),

('Mad Queen', '
This challenge appeared in Google Code Jam competition, licensed under Creative Commons Attribution License

Up until today, the nation you live in has used D different positive integer denominations of coin for all transactions. 
Today, the queen got angry when a subject tried to pay his taxes with a giant sack of low-valued coins, 
and she just decreed that no more than C coins of any one denomination may be used in any one purchase. 
For instance, if C = 2 and the existing denominations are 1 and 5, 
it is possible to buy something of value 11 by using two 5s and one 1, or something of value 12 by using two 5s and two 1s, 
but it is impossible to buy something of value 9 or 17.

You cannot directly challenge the queens decree, but you happen to be in charge of the mint,
 and you can issue new denominations of coin. 
You want to make it possible for any item of positive value at most V to be purchased under the queens new rules. 
(Note that this may not necessarily have been possible before the queens decree.) 
Moreover, you want to introduce as few new denominations as possible,
 and your final combined set of pre-existing and new denominations may not have any repeats.

What is the smallest number of new denominations required?

INPUT SAMPLE:

	The first argument is a path to a file. 
	Each line of the input file contains one test case. 
	Each test case consists of three parts separated by pipe symbol: 1) an integer C; 2) an integer V; 3) sorted list of space separated integers - all current denominations.

	1 | 3 | 1 2
	1 | 6 | 1 2 5
	2 | 3 | 3
	1 | 100 | 1 5 10 25 50 100

OUTPUT SAMPLE:

	For each test case, output one line containing the minimum number of new denominations required, as described above.

	0
	1
	1
	3

CONSTRAINTS:

The number of test cases is 40.
1 ≤ C ≤ 100.
1 ≤ V ≤ 109.
The number of current denominations is in range from 1 to 100.')"
		
