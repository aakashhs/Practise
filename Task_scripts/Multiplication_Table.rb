class Calculate_Table

	def self.multiply_and_print
		ARGV.each { |multiplied_number|
			begin
				multiplied_number = multiplied_number.to_i
				(1 .. multiplied_number).each{ |multiplied_number| 
					(1 .. 12).each { |multiplier| 
						print "#{multiplied_number * multiplier}".rjust(4)
					}
				print "\n"
				}
			rescue 
				puts "invalid input"
				next
			end
		}
	end

end

Calculate_Table.multiply_and_print
