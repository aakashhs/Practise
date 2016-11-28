class LargestString
	def printing_procedure
		@lines_to_process = ARGV
		@line_to_display = @lines_to_process.shift.to_i
		@lines_to_process.sort_by! { |line|  line.length }.reverse!
		(0...@line_to_display).each { |line| puts @lines_to_process[line] }	
	end
end

c2 = LargestString.new
c2.printing_procedure
