class Sum
	def self.add
		ARGV.each {|line|	
			begin			
				puts line.to_s.chars.map(&:to_i).reduce(&:+)
			rescue 
				puts "invalid input"
				next
			end
		}
	end
end
Sum.add
