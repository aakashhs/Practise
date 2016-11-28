class EmailVerification
	def self.verify
		ARGV.each{|line|
			begin
				puts line.strip =~ /[a-z0-9_\.]+@[a-z0-9]+\.[\w\.\w]/i ? "true":"false"
			rescue 
				puts "invalid input"
				next
			end
		}
	end
end

EmailVerification.verify
