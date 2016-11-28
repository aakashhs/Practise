class UserController
	verified = 0
	def self.handle(response, client, connection, s)
		if response =~ /uname/
			verified = Authenticate.verify(response, connection, s)
			if verified == 1		
				client.print "HTTP/1.0 200 OK\r\nContent-type: text/html\r\nSet-Cookie: username = "+s.getUsername()+"\r\nSet-Cookie: count = "+s.getCountLogin()+"\r\nServer: Aakash/0.1\r\n\r\n"		
				if s.getinput_response() != "empty"
					Execution.execute_desc(response, client, connection, s,s.getinput_response())
					s.setinput_response("empty")
				else
					Pages.load_Page(s.getnav(), client, connection, response, s)
				end
				verified = 0
			elsif verified == -1
				Fail.fail_page(client)
				verified = 0
			end
		elsif response =~ /confirmPassword/
			username = Authenticate.validate(response, connection)
			if username != "username is taken"
				s.setUsername(username)
				s.setCountLogin("1")
				client.print "HTTP/1.0 200 OK\r\nContent-type: text/html\r\nSet-Cookie: username = "+username+"\r\nSet-Cookie: count = 1\r\nServer: Aakash/0.1\r\n\r\n"
				if s.getinput_response() != "empty"
					Execution.execute_desc(response, client, connection, s, s.getinput_response())
					s.setinput_response("empty")
				else
					Pages.load_Page(s.getnav(), client, connection, response, s)
				end
			else
				SignUp.signup(client, username, -2)
			end
		elsif response =~ /updateaddress/
			Profile.update(response, connection, s)
		elsif response =~ /profile/ and response !~ /updateaddress/
			Profile.profile(client, connection, s)
		elsif response =~ /login/  and response !~ /png/
			s.setnav(response.scan(/login\$from(.*)\$ /).flatten.pop)
			Login.login_page(client)
		elsif response == "GET /tasklist HTTP/1.1\r\n"
			s.setUsername("Guest")
			client.print "HTTP/1.0 200 OK\r\nContent-type: text/html\r\nSet-Cookie: username = "+s.getUsername()+"\r\nSet-Cookie: count = "+s.getCountLogin()+"\r\nServer: Aakash/0.1\r\n\r\n"
			Tasklist.load_task_list(client, connection, s)
		elsif response =~ /signup/ and !(response =~ /confirmPassword/) and response !~ /png/
			s.setnav(response.scan(/signup\$from(.*)\$/).flatten.pop)
			SignUp.signup(client)
		end
	end
end
