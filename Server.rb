require 'prawn'
require 'prawn/table'
require 'mail'
require 'json'
require 'pg'
require 'socket'
require 'cgi'
require 'base64'
require 'logger'
require_relative 'Controller/RequestController'
require_relative 'Controller/ProgramController'
require_relative 'Controller/UserController'
require_relative 'Controller/MailController'
require_relative 'Controller/PdfController'
require_relative 'Controller/Data'
require_relative 'Models/download'
require_relative 'Models/verify'
require_relative 'Models/tasklist3'
require_relative 'Models/history5'
require_relative 'Models/execution4'
require_relative 'Models/currenttime'
require_relative 'Models/sendmail'
require_relative 'Models/mailpdf'
require_relative 'Models/contact'
require_relative 'Models/pages'
require_relative 'Models/profile'
$LOG = Logger.new('response.log', 'monthly')
$PGLOG = Logger.new('postgresql.log', 'monthly')
server = TCPServer.new('0.0.0.0', 3000)
connection = PG.connect :dbname => 'mahaswami', :user => 'postgres', :password => 'msuser1'
s = Variables.new
method = ""
while true do
	Thread.fork(server.accept) do |client| 
		begin
			puts response = client.gets
			method = response.slice(0 ... response.index(' '))		
			if method == "GET"
				s.get_cookie(client)
				RequestController.request_controller(response, client, connection, s)
				client.close
			elsif method == "POST"
			elsif method == "HEAD"
			else
				client.print "HTTP/1.0 501 OK\r\nContent-type: text/html\r\nSet-Cookie: username = "+s.getUsername()+"\r\nSet-Cookie: count = "+s.getCountLogin()+"\r\nServer: Aakash/0.1\r\n\r\n"
				file = File.read("Views/501.html")
				client.write(file)
				client.flush()
			end
		rescue Errno::EPIPE => e1
			$LOG.error "Error in write pipe!: #{e1}" 
			puts "we are handling it!"
		rescue Errno::ECONNRESET => e
			$LOG.error "Error in response!: #{e}" 
			puts "we are handling it!"
		rescue PG::Error => e2
			$PGLOG.error "Error in database query execution!: #{e2}"
			puts "we will handle it !!"
		rescue Errno::ENOENT
			file = File.read("Views/404.html")
			client.write(file)
			client.flush()
			puts "file not found bru!"
		end
	end
end
connection.close
