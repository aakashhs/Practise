#-- developed by Aakash Hs
#--Tuesday 30 August 2016 04:53:09 PM IST 
class SwapCase 		
	def self.swap
		begin
		ARGV.each { |string|	
			begin		
				(puts 'no string is present' ;next )  if string.strip.empty?			
				puts string.swapcase
			rescue 
				puts "invalid input : Please consider a sample input \"Hello World!\""
				next
			end
		}		
	end
end

SwapCase.swap
