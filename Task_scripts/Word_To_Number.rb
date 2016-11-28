class Word_to_digit
	def self.convert	
		hash_units = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}
		hash = hash_units.invert
		hash_large = {"hundred" => 100, "thousand" => 1000 , "million" => 1000000}
		ARGV.each {|line|
			begin
			numbers = line.strip.split(' ')
			number = 0
			(raise if numbers[1] == "zero";print '-' ; numbers.delete_at(0)) if numbers[0] == "negative"
			if numbers.length <= 2
				numbers.each {|word| number += hash[word]} 
			else
				index = 1
				while index < numbers.length do
					raise if !hash.has_key?(numbers[index])
					if numbers[index] == "million" || numbers[index] == "thousand" || numbers[index] == "hundred"
						if hash.has_key?(numbers[index - 2])					
							number += (hash_large[numbers[index]] * hash[numbers[index - 1]])
						else
							number += (hash_large[numbers[index]] * (hash[numbers[index - 1]] + hash[numbers[index - 2]]))
						end
						position = index + 1
					end
					index += 1
				end
				while position < numbers.length do
					number += hash[numbers[position]]
					position += 1
				end					
			end
			puts number
			rescue
				puts "invalid input"
				next
			end
		}
	end
end
Word_to_digit.convert
