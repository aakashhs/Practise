class Encoding
	Images = {"contact_us.png" => "", "google_plus.png" => "", "history.jpg" => "", "logout.jpg" => "", "Twitter_logo.png" => "", "home.png" => "", "aakashhs.jpg" => "", "msuser1.jpg" => "", "ascend.png" => "", "descend.png" => "", "Guest.png" => "", "signup.png" => "", "login.png" => ""}
	def self.encoding
		Images.each { |key, value|
			Images[key] = Base64.encode64(File.open("Images/#{key}", "rb").to_a.join)
			
		}	
	end
	def self.check_user? (username)
		return (username == "Guest" ? true : false)
	end
end
