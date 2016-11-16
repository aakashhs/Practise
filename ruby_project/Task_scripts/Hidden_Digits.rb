class HiddenNVisible
begin
	Hidden_digit = {'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7, 'i' => 8, 'j' => 9 }
	def self.convert
		ARGV.each {|line| 
			begin
				line_to_process = line.strip
				flag = 0
				line_to_process.each_char {|char|
					if char >= 'a' && char <= 'j'
						print Hidden_digit[char] ; flag = 1
					elsif char >= '0' && char <= '9'
						print char ; flag = 1
					end
				}
				print "NONE" if flag == 0
				puts 
			rescue 
				puts "invalid input"
				next
			end
		}
	end
rescue
	puts "Invalid Input"
end
end

HiddenNVisible.convert
