#-- developed by Aakash Hs
#last modified : Tuesday 30 August 2016 04:52:22 PM IST 
class Substring

	def check
		begin
		ARGV.each { |line| 	
			begin		
				strings = line.strip.split(',')
				spec = ['?', '<', '>','[', ']', '}', '{', '=', '-', ')', '(', '&', '^', '%', '$', '#', '`', '~']
				spec.each {|character| 			
					(raise;next) if strings[1].include? character
				}
				if Regexp.new(strings[1]) =~ strings[0]
					puts "true"
				else
					puts "false"
				end 
			rescue 
				puts "invalid input"
				next
			end
		}
		rescue
			puts "invalid input : No special character (except '*' ) is allowed in put "
			puts "Please consider a sample valid input : \"Hello,ell\""
		end
	end

end

sub_string = Substring.new
sub_string.check
