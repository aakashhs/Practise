begin	
class NumberToWord
	def convert(number)
		hash_units = { 1000000 => "Million", 1000 => "Thousand", 100 => "Hundred",  90 => "Ninety", 80 => "Eighty",  70 => "Seventy",  60 => "Sixty", 50 => "Fifty",  40 => "Forty",  30 => "Thirty", 20 => "Twenty", 19=>"Nineteen", 18=>"Eighteen", 17=>"Seventeen", 16=>"Sixteen", 15=>"Fifteen",   14=>"Fourteen",  13=>"Thirteen",  12=>"Twelve",  11 => "Eleven", 10 => "Ten", 9 => "Nine", 8 => "Eight", 7 => "Seven", 6 => "Six", 5 => "Five",  4 => "Four", 3 => "Three",  2 => "Two", 1 => "One"}
		raise  if (number =~ /[a-z]/im )
		number = number.to_i
		raise "Input is not right" if number<0 
		hash_units.each { |key, value|
			if number == 0
				return " "
			elsif number < 10 
				return "#{hash_units[number]}"      
			elsif number < 100 && number / key > 0
				return "#{value}" if number % key == 0
				return "#{value}" + convert(number % key)
			elsif number / key > 0
				return convert(number / key) + "#{value}" + convert(number % key)
			end
		}
		
	end
end
	n2w = NumberToWord.new
	ARGV.each { |number|
		begin
			puts "#{n2w.convert(number)}Dollars" 
		rescue 
			puts "invalid input"
			next
		end
	}
rescue
	puts "Invalid input"
end
