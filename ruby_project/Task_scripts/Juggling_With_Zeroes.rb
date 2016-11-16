class ZeroBased
	def self.convert
		begin
			ARGV.each {|line|
				begin
					sequences = line.strip.split(' ')
					binary = ""
					(0 ... sequences.length).step(2).each { |index|
						sequences[index + 1].gsub!('0','1') if sequences[index] == "00"
						binary = binary + sequences[index + 1]
					}
					puts binary.to_i(2)
				rescue 
					puts "invalid input"
					next
				end
			}
		rescue
			puts "invalid input"
		end
	end
end

ZeroBased.convert
