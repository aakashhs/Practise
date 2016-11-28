class Convert

	def self.convert_to_number(file_name)
		ARGV.each {|line| 
			begin
				line.strip.split(';').each {|word|
					if word_match(word) == -1
						print "#{word} is not a valid input " 
					else
						print "#{word_match(word)}"
					end
				}
				print "\n"
			rescue 
				puts "invalid input"
				next
			end
		}
	end

	def self.word_match(word)
		word_to_number = {"zero" => 0, "one" => 1, "two" => 2, "three" => 3, "four" => 4,
						 "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}		
		if word_to_number.has_key?(word)		
			word_to_number.each {|key, value|
				return value if word == key
			} 
		else
			 -1
		end
	end

end

Convert.convert_to_number(ARGV)
