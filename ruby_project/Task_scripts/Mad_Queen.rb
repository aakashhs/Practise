class MadQueen
	def self.combinations(denomination, c, v)
		sum = []
		(0 ... denomination.length).each { |index|
			diff_combos = denomination.combination(index).to_a
			(0 .. diff_combos.length - 1).each { |index|
				sum.push(diff_combos[index].reduce(:+))
			}
		}
		(c .. v).each {
			if sum.uniq.include? c
				c += 1
			else
				$count += 1
				combinations(denomination.push(c), c, v)
				break
			end
		}
	end

	def self.file_read
		begin
			ARGV.each { |line|
				begin
					input = line.chomp.split("|")
					c = input[0].to_i
					denomination = input[2].split.map(&:to_i)
					c.times { denomination += denomination} if c >= 2
					denomination.unshift(0)
					combinations(denomination, c, input[1].to_i)
					puts $count
					$count = 0
				rescue 
					puts "invalid input"
					next
				end
			}
		rescue
			puts "file error"
		end
	end
end
$count = 0
MadQueen.file_read
