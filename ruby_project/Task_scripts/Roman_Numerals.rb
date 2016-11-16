class Convert

	def self.read_and_check

		ARGV.each{|line| 
			begin
				number = line.strip.to_i
				if number > 0 && number < 4000
					puts "#{conversion(number)}"
				else
					puts "Please enter a number > 0 and < 4000"
				end
			rescue 
				puts "invalid input"
				next
			end
		}

	end

	def self.conversion(number)

		roman = {"M" => 1000, "CM" => 900, "D" => 500, "CD" => 400, "C" => 100, "XC" => 90,
				 "L" =>50, "XL" => 40, "X" => 10, "IX" => 9, "V" => 5, "IV" => 4, "I" => 1}
		roman_value = String.new
		roman.each { |key, value|
			while number >= value do
				number -= value
				roman_value += key
			end
		}
		return roman_value

	end

end

Convert.read_and_check
