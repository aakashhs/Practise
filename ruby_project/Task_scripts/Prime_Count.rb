require 'prime'
class PrimeCount
	def initialize(lvalue, rvalue)
		@lvalue = lvalue
		@rvalue = rvalue
		@@count = 0
	end
	
	def array_of_prime
		@numbers_to_process = Array.new
		(@lvalue .. @rvalue).each { |number| 
			if Prime.prime?(number) 
				@numbers_to_process.push(number)	 	
			end
		}
		print_result(@numbers_to_process)
	end
	
	def print_result(numbers_to_process)
		index = numbers_to_process.length - 1
		while index > 0 do
			left_adjacent = index - 1
			right_adjacent = index - 2 
			while right_adjacent >= 0 do
					if numbers_to_process[right_adjacent] + numbers_to_process[left_adjacent] + 1 == numbers_to_process[index]
						@@count += 1
						break
					end
					right_adjacent -= 1
					left_adjacent -= 1
			end
			index -= 1
		end
		puts @@count	
	end
end
left = 0; right = 0
ARGV.each { |line|
	begin
		left = line.chomp.to_i
		right = line.chomp.to_i
	rescue 
		puts "invalid input"
		next
	end
}
c5 = PrimeCount.new(left, right)
c5.array_of_prime
