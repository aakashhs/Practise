class Halloween
	
	def initialize(file_name)
		@file_name = file_name
		@@candies_per_kid = 0
	end

	def print_process
			  @serial_no = 0
			  ARGV.each {|line| 
				begin
				  @no_of_children = line.split
				  @vampires = (@no_of_children[1].scan(/\d{1,}/)).first.to_i
				  @zombies = (@no_of_children[3].scan(/\d{1,}/)).first.to_i
				  @witches = (@no_of_children[5].scan(/\d{1,}/)).first.to_i
				  @houses = (@no_of_children[7].scan(/\d{1,}/)).first.to_i
				  @@candies_per_kid = ( ( 3 * @vampires ) + ( 4 * @zombies ) + ( 5 * @witches ) ) * @houses / ( @vampires + @zombies + 									@witches )
				  puts "#{@serial_no += 1} : Candies per child : #{@@candies_per_kid}"
				rescue 
					puts "invalid input"
					next
				end
			  }
	end
end

c1 = Halloween.new
c1.print_process
