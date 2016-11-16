class Rotate
	def self.match
		begin
			ARGV.each {|line|
				begin
					words = line.chomp.gsub(' ','').split(',')
					raise if !(words[0] =~ /[a-z0-9]/i) || !(words[0] =~ /[a-z0-9]/i)
					(puts "False";next ) if words[0].length != words[1].length
					word = words[0].chars.to_a
					rotated = words[1].chars.to_a
					flag = "False"
					(word.length).times { (flag = "True"; break) if word.push(word.shift) == rotated }
					puts flag
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
Rotate.match
