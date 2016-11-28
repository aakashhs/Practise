class ProgramController
	def self.handle(response, client, connection, s)
		if response == "GET / HTTP/1.1\r\n"
			Tasklist.load_task_list(client, connection, s)
		elsif response =~ /Compare/			 
			if s.getUsername() == "Guest"
				s.setinput_response(response)
				Login.login_page(client)
			else
				Compare.check(client, response, s)
			end				
		elsif response =~ /exec/ and response !~ /input/ and response !~ /Compare/ 	
				Execution.execute_desc(response, client, connection, s)
		elsif response =~ /homepage/
				puts "hompage----"
				Tasklist.load_task_list(client, connection, s)
				puts "outta homepage----"
		elsif response =~ /input/ and response !~ /Compare/		
			if s.getUsername() == "Guest"
				s.setinput_response(response)
				Login.login_page(client)
			else
				Execution.print_output(response, client, connection, s)
			end
		elsif response =~ /challengehistory/ and response !~ /SendPdf/ and response !~ /Downloadtask/			
			History.view_challenge_history(connection, client, s)
		elsif response =~ /userhistory/ and response !~ /SendPdf/ and response !~ /DarthVader/	
			History.view_login_history(connection, client, s)
		end	
		if response =~ /page/ and response !~ /homepage/
			Pagination.send_content(response, client, connection)
		end
		if response =~ /\.png/ || response =~ /\.js/ || response =~ /\.css/ || response =~ /\.gif/
			 External_File.read(client, response)
		end
	end
end
