require 'date'
class Experience
	def self.actual_experience(starting, ending)
		months = []
		start_date = starting
		while start_date <= ending
			months << "#{start_date.year}#{start_date.month}"
			start_date = start_date >> 1
		end
		months
	end
	def self.start
		ARGV.each { |line|
			begin
				dates = line.strip.split('; ')
				total_months = []
				dates.each { |date|
					starting, ending = date.split('-').map { |time| DateTime.strptime(time, "%b %Y") }
					total_months += actual_experience(starting, ending)
				}
				total_months.uniq!
				puts total_months.size / 12
			rescue 
				puts "invalid input"
				next
			end
		}
	end
end

Experience.start
