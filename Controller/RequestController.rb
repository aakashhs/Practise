class RequestController
def self.request_controller(response, client, connection, s)
	if response =~ /Downloadtask/ || response =~ /DarthVader/ || response =~ /SendPdf/
		PdfController.handle(response, client, connection, s)
	elsif (response =~ /contactus/ and response !~ /send/ and response !~ /png/) || (response =~ /send/ and response !~ /SendPdf/)
		MailController.handle(response, client, connection, s)
	elsif response =~ /uname/ || response =~ /confirmPassword/ || (response =~ /profile/ and response !~ /updateaddress/) || (response =~ /login/  and response !~ /png/) || response == "GET /tasklist HTTP/1.1\r\n" || (response =~ /signup/ and !(response =~ /confirmPassword/) and response !~ /png/) || response =~ /updateaddress/
		UserController.handle(response, client, connection, s)
	else
		ProgramController.handle(response, client, connection, s)
	end		
end
end
