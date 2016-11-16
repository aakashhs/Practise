class CurrentTime
	def self.calc_time
		time = Time.now + (330 * 60)
		return time.strftime("%I:%M%p"), time.strftime("%d-%m-%Y")
	end
end
