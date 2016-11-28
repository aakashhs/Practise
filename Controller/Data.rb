class Variables
	 @@username = "Guest"
	 @@count_login = "0"
	 @@challenge_name = ""
	 @@pdf_name = ""
	 @@mailpdf = false
	 @@in_login = true
	@@yo = 1	
	 @@input_response = "empty"
	 @@nav = ""

	public def setinput_response(val)
		@@input_response = val
	end 
	public def getinput_response()
		return @@input_response
	end 


	public def setnav(val)
		@@nav = val
	end 
	public def getnav()
		return @@nav
	end 


	public def setUsername(uname)
		@@username = uname
	end 

	public def getUsername()
		return @@username
	end 

	public def setCountLogin(clogin)
	@@count_login = clogin
	end 

	



	public def setin_login(val)
	@@in_login = val
	end 
	public def getin_login()
	return @@in_login
	end 
	public def setPdfName(val)
	@@pdf_name = val
	end 
	public def getPdfName()
	return @@pdf_name
	end 


	public def setMailPdf(val)
	@@mailpdf = val
	end 
	public def getMailPdf()
	return @@mailpdf
	end 

	public def getCountLogin()
	return @@count_login
	end 

	public def setChallengeName(cname)
	@@challenge_name = cname
	end 

	public def getChallengeName()
	return @@challenge_name
	end 

	public def get_cookie(client)			
		while line = client.readline do
			if line =~ /Cookie/
			puts "--#{line}--"
				@@username = line.scan(/username=(.*); count=/).flatten.pop
				@@count_login = line.scan(/count=(.*)/).flatten.pop 
				break
			end
			break if line == "\r\n"
		end
	end
end


