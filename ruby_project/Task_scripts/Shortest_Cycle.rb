#-- developed by Aakash Hs
#Tuesday 30 August 2016 04:51:50 PM IST 
class Cycle
		
	def self.verify_cycle(position_in_line, line)
		head = position_in_line + 1
		(1 ... position_in_line).each {|tail|
			return false if line[head] != line[tail]
			head += 1
		}
		true
	end

	def self.find_period
		begin
		ARGV.each { |line|			
			(raise;next ) if line.strip!.empty?
			begin
			line_length = line.length
			(1 .. line_length).each { |position_in_line|
				(puts position_in_line if verify_cycle(position_in_line, line);break) if line[position_in_line] == line[0]
				puts line_length if position_in_line == line_length - 1#shortest period is equal to position in line
			}
			rescue 
				puts "invalid input"
				next
			end	
		}
		rescue
			puts "invalid input : Please consider the sample valid input : \"abcabcabcabc\""	
		end

	end
end

Cycle.find_period
