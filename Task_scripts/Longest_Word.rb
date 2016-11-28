class LongWord
	def self.convert_n_print
		begin
		ARGV.each {|line|	
			begin
				raise if (line =~ /[0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/)
				(puts "The number of words in a line is from 5 to 15." ; next) if !((words = line.strip.split(' ')).length >= 5 && words.length <= 15)
				(puts "The word length is from 1 to 10 characters."; next) if (word = words.max_by(&:length)).length > 10
				word.chars.to_a.each_with_index {|char, index| 
					index.times {print '*'}
					print "#{char} "
				}
			puts
			rescue 
				puts "invalid input"
				next
			end
		}
		rescue
			puts	"Invalid Input"
		end
	end
end
LongWord.convert_n_print
