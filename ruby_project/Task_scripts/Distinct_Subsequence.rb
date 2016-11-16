#-- developed by Aakash Hs
#-- Tuesday 30 August 2016 12:55:01 PM IST 
class Sequence
	def self.occurence_count
		begin
		ARGV.each { |line| 	
			begin		
				words = line.scan(/\w+/)
				string = words[1].strip
				substring = words[2].strip
				substring_length = substring.length
				count = 0
				string_array = string.chars.to_a
				for subsequence in string_array.combination(substring_length)
					count += 1 if subsequence.join == substring		
				end
				puts count
			rescue 
				puts "invalid input"
				next
			end
		}
		rescue
			puts "invalid input : please consider the sample valid input \"1)  babgbag,bag\""
		end

	end
end

Sequence.occurence_count
