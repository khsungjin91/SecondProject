package mail.bean;
	
	import javax.mail.Authenticator;
	import javax.mail.PasswordAuthentication;
	 
	public class SMTPAuthenticator extends Authenticator {
	 
	 protected PasswordAuthentication getPasswordAuthentication() {
	  String username = "pstar9102@gmail.com"; // gmail �����;
	  String password = "tjdwls147";  // �н�����;
	  return new PasswordAuthentication(username, password);
	 }
	 
	}

