class CycleDetect
	def initialize
		@@single_repetition = false
	end
	
	def cycle_detection(lines_to_process)
		@tail = 0
		@head = 1
		 while lines_to_process[@tail].to_i != lines_to_process[@head].to_i  do	
			@tail = @tail + 1
			@head = @head + 2		
		end
		(@tail ... @head).each {|line| print "#{lines_to_process[line]} "}
	end

	def print_result
		ARGV.each {|line| 
			begin
				@lines_to_process = line.split(' ')
				(0 ... @lines_to_process.length).each {|digit| 					#single repeatition
					if @lines_to_process[digit] == @lines_to_process[digit + 1]
						print "#{@lines_to_process[digit]}"
						@@single_repetition = true
						break
					end
				}
				cycle_detection(@lines_to_process) unless @@single_repetition == true
				@@single_repetition = false
				print "\n"
			rescue 
				puts "invalid input"
				next
			end
		}
	end
end

c3 = CycleDetect.new
c3.print_result
