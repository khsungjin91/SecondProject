package mail.bean;
	
	import javax.mail.Authenticator;
	import javax.mail.PasswordAuthentication;
	 
	public class SMTPAuthenticator extends Authenticator {
	 
	 protected PasswordAuthentication getPasswordAuthentication() {
	  String username = "pstar9102@gmail.com"; // gmail 사용자;
	  String password = "tjdwls147";  // 패스워드;
	  return new PasswordAuthentication(username, password);
	 }
	 
	}

