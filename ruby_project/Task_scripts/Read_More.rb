#-- developed by Aakash Hs
class ReadMore
	def self.line_process
		begin
		ARGV.each { |sentence|	
			begin		
				sentence.gsub(/\s+/, " ")   #removes consecutive spaces
				line_length = sentence.length
				raise if line_length>300			
				if line_length <= 58   
					puts sentence
				else 
					sentence.slice!(43 ... line_length).strip!
					puts sentence + "... <Read More>"
				end
			rescue 
				puts "invalid input"
				next
			end
		}
		rescue
			puts "invalid input : Please consider the sample valid input :\"1  Tom exhibited.\""
		end

	end
end

ReadMore.line_process
