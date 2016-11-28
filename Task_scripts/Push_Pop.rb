class PushPop
	def print_process
		
			ARGV.each { |line| 
			begin
				@numbers_to_process = line.split(' ')
					(@numbers_to_process.length + 1).step(0, -2) { |pos|
						print "#{@numbers_to_process[pos]} " 
					}
				print "\n"
			rescue 
				puts "invalid input"
				next
			end
			}
			

	end
end

c4 = PushPop.new
c4.print_process
