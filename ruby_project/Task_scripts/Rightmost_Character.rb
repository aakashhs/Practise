class Rightmost
	def self.find_char
		begin
			ARGV.each { |line|
				begin
					words = line.strip.gsub(' ','').split(',')
					(puts "-1"; next) if !(position = words[0].rindex(words[1]))
					puts position + 1
				rescue 
					puts "invalid input"
					next
				end
			}
		rescue 
			puts "Invalid Input"
		end
	end
end
Rightmost.find_char
