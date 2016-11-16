import UI_codes.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.lang.Object;
import java.util.Base64;
import javax.servlet.http.Cookie;
import java.text.SimpleDateFormat;
import java.nio.file.*;
import java.sql.*;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import javax.xml.bind.DatatypeConverter;

public final  class Server {
	private final static int PORT = 4500;
    	private final static String SERVERSTRING = "Server: Aakash/0.1";
	static final String JDBC_DRIVER = "org.postgresql.Driver";
	static final String DB_URL = "jdbc:postgresql://localhost:5432/mahaswami";
	static final String USER = "postgres";
   	static final String PASS = "root";
	//static Cookie uid = new Cookie("username", "");
	//static Cookie cl = new Cookie("countLogin", "0");
	//static Cookie cid = new Cookie("challengeName", "");
    	private static final Map<String, String> mimeMap = new HashMap<String, String>() {{
		put("html", "text/html");
		put("css", "text/css");
		put("js", "application/js");
		put("jpg", "image/jpg");
		put("jpeg", "image/jpeg");
		put("png", "image/png");
    	}};

       private static void respondHeader(String code, String mime, int length, DataOutputStream out, Data s) throws Exception {
        
		System.out.println(" (" + code + ") ");
		out.writeBytes("HTTP/1.0 " + code + " OK\r\n");
		out.writeBytes("Content-Type: " + mimeMap.get(mime) + "\r\n");
		out.writeBytes("Content-Length: " + length + "\r\n");
		out.writeBytes("Set-Cookie: username = "+s.getUsername()+"\r\n");
		out.writeBytes("Set-Cookie: countLogin = " + s.getCountLogin() + "\r\n"); 
		out.writeBytes("Set-Cookie: challengeName = " + s.getChallengeName() + "\r\n"); 
		//out.writeBytes("Set-Cookie: " + cid + "\r\n"); 
		out.writeBytes(SERVERSTRING);
		out.writeBytes("\r\n\r\n");
	}
	
	public static String navigate(Data s,String responseString,Statement stmt, ResultSet res) throws Exception{
		String nav = s.getNav();
		if(nav.contains("Tasklist")){
			return Tasklist.response( stmt, res, s);
		}
		else if(nav.contains("Contact")){
			return Contact.contactUs(responseString, false, s);
		}else {
			return Execution.executeDesc(responseString ,  stmt,  res, s);
		}
	}
	private static void respondContent(String inString, DataOutputStream out, Statement stmt, ResultSet res, Data  s) throws Exception {
		String inputResponse = "";
		String method = inString.substring(0, inString.indexOf("/")-1);
		String file = inString.substring(inString.indexOf("/")+1, inString.lastIndexOf("/")-5);
		if(file.equals(""))
		{
		    System.out.println("hello");
		    file = "404.html";    
		}
		String mime = file.substring(file.indexOf(".")+1);        
		if(method.equals("GET")) {
		    try {
	 		String responseString = null; 
			if(inString.contains("GET / HTTP/1.1")){
				responseString = Tasklist.response( stmt, res, s);
			}
			else if(inString.contains("exec") && (!inString.contains("input"))  && (!inString.contains("uname"))){
				s.setChallengeName(URLDecoder.decode(inString.substring(inString.lastIndexOf("$")+1,inString.lastIndexOf("%")),"UTF-8"));
				responseString = Execution.executeDesc(responseString ,  stmt, res, s);
			}
			else if(inString.contains("contactus") && (!inString.contains("Send"))){
				responseString = Contact.contactUs(responseString, false, s);
			}
			else if(inString.contains("signup") && (!inString.contains("confirmPassword"))){
				s.setNav(inString);
				responseString = Pages.signup(responseString, "", -1,s);
			}
			else if(inString.contains("login") && (!inString.contains("uname")) && (!inString.contains("input"))&& (!inString.contains("Compare"))){
				s.setNav(inString);
				responseString = Pages.login(responseString,s,-1);
			}
			else if(inString.contains("uname")){
				if(Verify.verify(inString, s,stmt, res)){
					if(s.getInputResponse() != ""){
						responseString = Execution.executeDesc(responseString , stmt,  res, s);
					}else{
						responseString = navigate(s, responseString, stmt,  res);
					}
				}
				else{
					responseString = Pages.failPage(responseString,s,-2);
				}
			}
			else if(inString.contains("confirmPassword")){
				if(Verify.validate(inString, s, stmt,res)){
					if(s.getInputResponse() != ""){
						responseString = Execution.executeDesc(responseString ,  stmt,  res, s);
					}else{
						responseString = navigate(s, responseString, stmt,  res);
					}
				}else{
					responseString = Pages.signup(responseString, "username is taken", -2,s);
				}
			}
			else if(inString.contains("tasklist")){
				s.setUsername("Guest");
				responseString = Tasklist.response( stmt, res, s);
			}
			else if(inString.contains("userhistory") && (!inString.contains("getUserPdf")) && (!inString.contains("SendPdf"))){
				responseString = History.history(responseString, s, res, stmt, "User", "");
			}
			else if(inString.contains("challengehistory") && (!inString.contains("Downloadtask")) && (!inString.contains("SendPdf"))){
				responseString = History.history(responseString, s, res, stmt, "Challenge", "");
			}
			else if(inString.contains("homepage")){
				responseString = Tasklist.response( stmt, res, s);
			}
			else if(inString.contains("input")&& (!inString.contains("Compare"))){
				if(s.getUsername() == "Guest"){
					s.setInputResponse(inString);
					responseString = Pages.login(responseString,s,-1);
				}else{
					responseString = Execution.printOutput(responseString ,inString, stmt, res, s);
				}
			}
			else if(inString.contains("Compare")){
				if(s.getUsername() == "Guest"){
					s.setInputResponse(inString);
					responseString = Pages.login(responseString,s,-1);
				}else{
					responseString = Execution.compare( responseString, inString, s, -1);
				}
			}
			else if(inString.contains("profile") && (!inString.contains("updateaddress"))){
				responseString = Pages.profile(responseString, res, stmt, s, -1);
			}
			else if(inString.contains("updateaddress")){
				Pages.update( stmt, s, inString);
				responseString = Pages.profile(responseString, res, stmt, s, -2);
			}
			else if(inString.contains("Send") && (!inString.contains("SendPdf"))){
				SendMail.contactMail(inString, s);
				responseString = Contact.contactUs(responseString, true, s);
			}
			else if(inString.contains("getUserPdf")){
				History.generatePdf("User", stmt, res, s);
				if(inString.contains("mail")){
					responseString = Mailpdf.mailPdf(responseString, s, 1);
				}else{
					responseString = History.history(responseString, s, res, stmt, "User", "downloaded");
				}
			}
			else if(inString.contains("Downloadtask")){
				History.generatePdf("Challenge", stmt, res, s);
				if(inString.contains("mail")){
					responseString = Mailpdf.mailPdf(responseString, s, 2);
				}else{
					responseString = History.history(responseString, s, res, stmt, "Challenge", "downloaded");
				}
			}
			else if(inString.contains("sender")){
				if(Mailpdf.sendPdf(inString, s).equals("1")){
					responseString = History.history(responseString, s, res, stmt, "User", "mailed");
				}else{
					responseString = History.history(responseString, s, res, stmt, "Challenge", "mailed");
				}
			}
		        respondHeader("200", mime, responseString.length(), out, s);
		        out.write(responseString.getBytes());
		    
		        }catch(FileNotFoundException e) {
				try {
				    byte[] fileBytes = null;
				    InputStream is = new FileInputStream("404.html");
				    fileBytes = new byte[is.available()];
				    is.read(fileBytes);
				    respondHeader("404", "html", fileBytes.length, out, s);
				    out.write(fileBytes);
				}catch(FileNotFoundException e2) {
				    String responseString = "404 File Not Found";
				    respondHeader("404", mime, responseString.length(), out, s);
				    out.write(responseString.getBytes());
				}
		    }
		}else if(method.equals("POST")) {

		}else if(method.equals("HEAD")) {
		    respondHeader("200", "html", 0, out, s);
		}else {
		    respondHeader("501", "html", 0, out, s);
		}
    }

    private static  class WorkerRunnable implements Runnable {
        protected Socket socket = null;
	Statement stmt = null;
	ResultSet res = null;
        BufferedReader in;
        DataOutputStream out;
        String inString;
	Data s = null;
        
        public WorkerRunnable(Socket connectionSocket, Statement stmt, ResultSet res, Data s) throws Exception {
		System.out.println("in worker runnable");
            this.socket = connectionSocket;
	    this.stmt = stmt;
	    this.res = res;
	    this.s = s;
            this.in = new BufferedReader(new InputStreamReader(this.socket.getInputStream()));
            this.out = new DataOutputStream(this.socket.getOutputStream());
		String[] line = new String[20];
		int i = 0;
		while(!(line[i] = this.in.readLine()).equals("")){
			System.out.println(i+"--"+line[i]);
			if(line[i].contains("Cookie")){
				this.s.setUsername(URLDecoder.decode(this.s.extract("username=(.*); countLogin",line[i]),"UTF-8"));
				System.out.println(this.s.getUsername());
				this.s.setCountLogin(Integer.parseInt(URLDecoder.decode(this.s.extract("countLogin=(.*); challengeName",line[i]),"UTF-8")));
				System.out.println(this.s.getCountLogin());
				this.s.setChallengeName(URLDecoder.decode(this.s.extract("challengeName=(.*)",line[i]),"UTF-8"));
				System.out.println(this.s.getChallengeName());
			}
			i++;
			if(line.equals("\r\n"))
				break;
		}
System.out.println("broke");
            this.inString = line[0];
            String time = "[" + s.getTime() + "] ";
            System.out.print(time + this.socket.getInetAddress().toString() + "--- " + this.inString);  	          
        }

        public void run() {	
	System.out.println("in run");
            try{
		        if(this.inString != null)
		            respondContent(this.inString, this.out, this.stmt, this.res, this.s);
		        this.out.flush();
		        this.out.close();
		        this.in.close();
            } catch (Exception e) { 
		        System.out.println("Error flushing and closing");  
			System.out.println(e);  
            }
        }
    }

    public static void main(String argv[]) throws Exception {
        ServerSocket serverSocket = new ServerSocket(PORT);
	Connection conn = null;
	Statement stmt = null;
	ResultSet res = null;
	Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
	stmt = conn.createStatement();
	Data s = new Data();
	int u = 0;
        while(true) {
		System.out.println("in main "+u);
            Socket connectionSocket = serverSocket.accept();        
            new Thread(new WorkerRunnable(connectionSocket, stmt, res, s)).start();    
		u++;
        }
    }
}
