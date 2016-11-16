#-- developed by Aakash Hs
#Tuesday 30 August 2016 04:52:56 PM IST 
class Pangrams
	ALPHABETS = ('a' .. 'z').to_a
	def check_pangrams
		begin		
		ARGV.each { |sentence|
			begin
				(puts 'no string is present' ;next )  if sentence.strip.empty?			
				missing_alphabets = ALPHABETS
				missing_alphabets.each{ |letter| 
					missing_alphabets -= [letter] if sentence.include? letter			
				}
				if missing_alphabets.empty? 
					puts "NULL" 
				else
					missing_alphabets.each {|character| print character};puts
				end
			rescue 
				puts "invalid input"
				next
			end
		}
		rescue
			puts "input is invalid : please consider a sample valid input : "
			p "A quick brown fox jumps over the lazy dog"
		end
	end
end

pangram = Pangrams.new
pangram.check_pangrams
