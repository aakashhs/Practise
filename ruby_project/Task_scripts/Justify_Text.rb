class Justify
	def self.justify_text(ARGV)
		file_length = `wc -l #{file_name}`.strip.split(' ')[0].to_i
		just_word = String.new
		line_count = 0
		begin
		ARGV.each { |line|
			begin
				just_word.lstrip!
				line.chomp!
				line = just_word + line
				just_word = ""
				if line.length > 80 && line_count < file_length - 2
					index = line.length - 1
					flag = 0
					while index > 0 do 
						(flag = 1; break) if line[index] =~ /[!,]$/
						index -= 1
					end 
					index = line.rindex(" ") if flag == 0
					just_word = line.slice!(index + 1 .. line.length - 1)
					extra_spaces = 80 - line.length
					word_count = line.scan(/\w+/).count
					spaces_per_line = extra_spaces/(word_count - 1)
					spare_spaces = extra_spaces - spaces_per_line * (word_count - 1)
					words = line.split(' ')
					words.each { |word| print "#{word}"
						print(' ' * Integer(spaces_per_line + 1))
						(print ' ';spare_spaces -= 1)if spare_spaces > 0
					}
					line_count += 1
				else
					puts line
					line_count += 1
					next
				end
			rescue 
				puts "invalid input"
				next
			end
		}
		rescue
		p "Invalid Input"
		end
	end
end
Justify.justify_text(ARGV)
