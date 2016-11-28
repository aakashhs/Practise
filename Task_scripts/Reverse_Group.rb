class GroupReverse
	def self.convert
		begin
			ARGV.each {|line|
				begin
					num_n_size = line.strip.gsub(' ','').split(';')
					raise if (num_n_size[1] !~ /\d+/) || (num_n_size[0] !~ /[\d+,]/)
					group_size = num_n_size[1].to_i
					puts num_n_size[0].split(',').each_slice(group_size).to_a.each{|num| num.reverse! if num.length == group_size}.join(',')
				rescue 
					puts "invalid input"
					next
				end
			}
		rescue
			puts "Invalid Input"
		end
	end
end
GroupReverse.convert

