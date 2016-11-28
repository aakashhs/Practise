class Conversion
	def self.count(file_name)
		#begin		 
			#if `wc -l "i3.txt"`.strip.split(' ')[0].to_i == (20 .. 50)
			ARGV.each { |line|
				#raise if (line =~ /[a-z]/im )
				begin
					numbers = line.strip.split(' ').map(&:to_i)
					if numbers.size >= 0 && numbers.size <= 99
						print numbers
						same_digits = numbers.chunk_while {|left, right| left == right}
						same_digits.each_with_index {|number, index| print "#{number.count} #{number[0]}"
							print " - " if index != same_digits.to_a.length - 1 }
					else
						puts "lines must range from 0 - 99"
					end
					puts
				rescue 
					puts "invalid input"
					next
				end
			}
			else
				puts "no of lines must be between 20 - 50"
			end
		#rescue
		#	puts "Invalid input"
		#end
	end
end

Conversion.count(ARGV)
