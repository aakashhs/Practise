require 'prawn'
require 'prawn/table'
require 'mail'
require 'json'
require 'pg'
require 'socket'
require 'cgi'
require 'base64'
require_relative 'UI_scripts/download'
require_relative 'UI_scripts/images'
require_relative 'UI_scripts/verify'
require_relative 'UI_scripts/tasklist3'
require_relative 'UI_scripts/history5'
require_relative 'UI_scripts/execution4'
require_relative 'UI_scripts/currenttime'
require_relative 'UI_scripts/sendmail'
require_relative 'UI_scripts/mailpdf'
require_relative 'UI_scripts/contact'
require_relative 'UI_scripts/pages'
require_relative 'UI_scripts/profile'
verified = 0
mailpdf = false
pdf_name = ""
input_response = "empty"
count_login = ""
in_login = true
nav = ""
user = 0
challenge_name = ""
username = ""
new_user = false
server = TCPServer.new('0.0.0.0', 4500)
connection = PG.connect :dbname => 'mahaswami', :user => 'postgres', :password => 'msuser1'
Encoding.encoding
cookie1 = CGI::Cookie.new( "name"=>"username", "value" => "Guest")
cookie2 = CGI::Cookie.new( "name"=>"count", "value" => "")
cookie3 = CGI::Cookie.new( "name"=>"challenge_name", "value" => "")
while client = server.accept do
	cookie1.value[0] = username
	cookie2.value[0] = count_login.to_s
	cookie3.value[0] = challenge_name
	client.print "HTTP/1.1 200/OK\r\nContent-type:text/html\r\nSet-Cookie:#{cookie1}\r\nSet-Cookie:#{cookie2}\r\nSet-Cookie:#{cookie3}\r\n\r\n"
	begin
		response = client.gets
	rescue Errno::ECONNRESET => e
  		puts "we are handling it!"	
	end
	begin
		username,count_login, challenge_name = Profile.get_cookie(client)
		if response == "GET / HTTP/1.1\r\n"
			username = Tasklist.load_task_list(client, connection)
		elsif response =~ /uname/
			verified, username, count_login = Verify.verify(response, connection, count_login)
			if verified == 1
				if input_response != "empty"
					challenge_name = Execution.execute_desc(response, client, connection, username, count_login,challenge_name,input_response)
					input_response = "empty"
				else
					Pages.load_Page(nav, client, connection, response, username, count_login, challenge_name)
				end
				verified = 0
			elsif verified == -1
				Pages.fail_page(client)
				verified = 0
			end
		elsif response =~ /confirmPassword/
			username = Verify.validate(response, connection)
			if username != "username is taken"
				count_login = "1"
				if input_response != "empty"
					challenge_name = Execution.execute_desc(response, client, connection, username, 1,challenge_name,input_response)
					input_response = "empty"
				else					
					Pages.load_Page(nav, client, connection, response, username, 1, challenge_name)
				end
			else
				Pages.signup(client, username, -2)
			end
		elsif response =~ /Compare/			 
			if Encoding.check_user? (username)
				input_response = response
				Pages.login_page(client)
			else
				Execution.check(client, response, challenge_name)
			end		
		elsif response =~ /updateaddress/			
			Profile.update(response, connection, username)
			Profile.profile(client, connection, username)
		elsif response =~ /profile/ and response !~ /updateaddress/			
			Profile.profile(client, connection, username)
		elsif response =~ /exec/ and response !~ /input/ and response !~ /Compare/ 			
			challenge_name = Execution.execute_desc(response, client, connection, username, count_login)
		elsif response =~ /login/ 
			nav = response.scan(/login\$from(.*)\$ /).flatten.pop
			Pages.login_page(client)
		elsif response =~ /tasklist/
			username = Tasklist.load_task_list(client, connection)
		elsif response =~ /homepage/
			Tasklist.load_task_list(client, connection, username, count_login)
		elsif response =~ /signup/ and !(response =~ /confirmPassword/)
			nav = response.scan(/signup\$from(.*)\$/).flatten.pop
			Pages.signup(client)
		elsif response =~ /input/ and response !~ /Compare/		
			if Encoding.check_user? (username)
				input_response = response
				Pages.login_page(client)
			else
				Execution.print_output(response, client, challenge_name, connection, username, count_login)
			end
		elsif response =~ /challengehistory/ and response !~ /SendPdf/ and response !~ /Downloadtask/			
			History.view_challenge_history(challenge_name, connection, client, username, count_login)
		elsif response =~ /userhistory/ and response !~ /SendPdf/ and response !~ /DarthVader/	
			History.view_login_history(connection, client, username)
		elsif response =~ /Downloadtask/			
			mailpdf, pdf_name = Download.download_challenge(response, connection, challenge_name, username)
			if mailpdf == true
				(in_login = false; MailPdf.mail_pdf(client, username, count_login, pdf_name);mailpdf = false)
			else
				History.view_challenge_history(challenge_name, connection, client, username, count_login, "downloaded")
			end
		elsif response =~ /contactus/ and response !~ /send/			
			Contact.emailus(client, username, count_login)
		elsif response =~ /send/ and response !~ /SendPdf/			
			Send.mail(response)
			Contact.emailus(client, username, count_login, true)
		elsif response =~ /SendPdf/
			MailPdf.send_pdf(response, pdf_name)
			if in_login == true
				History.view_login_history(connection, client, username, "mailed")
			else
				History.view_challenge_history(challenge_name, connection, client, username, count_login, "mailed")
			end
		elsif response =~ /DarthVader/		
			mailpdf, pdf_name = Download.download_login(response, connection, username)
			if mailpdf == true
				(in_login = true;MailPdf.mail_pdf(client, username, count_login, pdf_name);mailpdf = false) 
			else
				History.view_login_history(connection, client, username, "downloaded")
			end
		end
	client.close
	rescue Errno::EPIPE => e1
  		puts "we are handling it!"	
	end
end
connection.close
