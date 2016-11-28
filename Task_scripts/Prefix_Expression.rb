class Prefix
	def self.eval (left_number,operator,right_number)
		case operator
			when '+'
				return left_number.to_i + right_number.to_i
			when '-'
				return left_number.to_i - right_number.to_i
			when '*'
				return left_number.to_i * right_number.to_i
			when '/'
				return left_number.to_i / right_number.to_i
			else
				return "unknown operator"
		end
	end

	def self.expression
		begin
			ARGV.each { |line|
				begin
					variables = line.strip.split(' ')
					container = []
					container.push(variables.shift)
					while variables.length > 0 do
						container.push(variables.shift)
						if (container.last =~ /\d/) && (container[container.length - 2] =~ /\d/ || (container[container.length - 2].is_a? Integer))
							expr = []
							3.times {expr.push(container.pop)}
							container.push(eval(expr[1], expr[2], expr[0]))
						end
					end
					puts container
				rescue 
					puts "invalid input"
					next
				end
			}
		rescue
			puts "Its not a postfix expression"
		end
	end
end
Prefix.expression
