class RollerCoaster
	def self.convert
		begin
			ARGV.each {|line|
				begin 
					line.strip!
					flag = 0
					print line[0].upcase
					(1 ... line.length).each { |index|
						if line[index] =~ /[a-z]/i
							if flag == 0
								print line[index].downcase; flag = 1
							else
								print line[index].upcase; flag = 0
							end
						else
							print line[index]
						end
					}
					puts
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

RollerCoaster.convert
