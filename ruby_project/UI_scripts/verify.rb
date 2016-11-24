class Verify
	def self.verify(response, connection, count_login)
		username = response.scan(/uname=(.*)&/).flatten.pop
		password = response.scan(/psw=(.*) /).flatten.pop
		result = connection.exec "SELECT count(*) FROM CREDENTIALS where username = '#{username}' and password = '#{password}' "
		result.each { |row|
			json_row = row.to_json
			json_data = JSON.parse(json_row)
			if json_data['count'].to_i != 0
				current_time, current_date = CurrentTime.calc_time
				connection.exec "insert into loginhistory (username, time, date) values('#{username}','#{current_time}','#{current_date}')"
				login_count = connection.exec "select count(*) from loginhistory where username = '#{username}'"
				login_count.each {|row| json_row = row.to_json
					json_data = JSON.parse(json_row);
					count_login = json_data['count'].to_i}
				return 1, username, count_login
			end
		}
		return -1, "Guest", "0"
	end
	def self.validate(response, connection)
		name = CGI.unescape(response.scan(/Name=(.*)&Emailid/).flatten.pop)
		emailid = CGI.unescape(response.scan(/&Emailid=(.*)&latitude/).flatten.pop)
		coordinates = CGI.unescape(response.scan(/&latitude=(.*)&address/).flatten.pop)
		address = CGI.unescape(response.scan(/&address=(.*)&Userid/).flatten.pop).gsub('\'',' ')
		username = CGI.unescape(response.scan(/&Userid=(.*)&password/).flatten.pop)
		password = CGI.unescape(response.scan(/&password=(.*)&confirmPassword/).flatten.pop)
		res = connection.exec "select count(*) from  credentials where username = '#{username}'"
		res.each {|row| puts row['count']
			if row['count'] != "0" 
				return "username is taken" 
			end
		}
		connection.exec "insert into credentials values('#{username}','#{password}','#{name}','#{emailid}','#{address}','#{coordinates}')"
		current_time, current_date = CurrentTime.calc_time
		connection.exec "insert into loginhistory (username, time, date) values('#{username}','#{current_time}','#{current_date}')"
		options = { 
		   :address              => "smtp.gmail.com",
		   :port                 => 587,
		   :user_name            => 'a.hs771994',
		   :password             => 'ClarkKent',
		   :authentication       => 'plain',
		   :enable_starttls_auto => true  }
		Mail.defaults do
		  delivery_method :smtp, options
		end
		Mail.deliver do
			to emailid
			from 'a.hs771994@gmail.com'
			subject 'Thank You For Registering'
			body "Dear #{name},\n\tWelcome to our Ruby Application. We thank you for signing up on our project. We wish you an enjoyable experience while using our application \nThanking you,\n\nregards,\nAakash\nprogrammer.\nNOTE: This is an auto-generated email. Kindly do not reply."
		end
		return username
	end
end 
