package mail.bean;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostMan {
	
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/sendMail.dj")
	public ModelAndView MailSend(){
		  
		  String from = "psj9102@naver.com";    // ���� ������ ���
		  String to = "psj9102@naver.com";   // ���� �������
		  String cc = "";     // ����
		  String subject = "�߰����� �׽�Ʈ ��~~~~~~~~~~";// ����
		  String content = 
		   "�ȳ��ϼ���. �ݰ����ϴ�.\n G-Mail�� �̿��� ���� �߼� �����Դϴ�.\n �����մϴ�.";// ����
		  
		  if(from.trim().equals("")) {
		   System.out.println("������ ����� �Է����� �ʾҽ��ϴ�.");
		  }
		  else if(to.trim().equals("")) {
		   System.out.println("�޴� ����� �Է����� �ʾҽ��ϴ�.");
		  }
		  else {
		   try {
		    mailTest mt = new mailTest();
		    
		    // ���Ϻ�����
		    mt.sendEmail(from, to, cc, subject, content);
		    System.out.println("���� ���ۿ� �����Ͽ����ϴ�.");
		   }
		   catch(MessagingException me) {
		    System.out.println("���� ���ۿ� �����Ͽ����ϴ�.");
		    System.out.println("���� ���� : " + me.getMessage());
		   }
		   catch(Exception e) {
		    System.out.println("���� ���ۿ� �����Ͽ����ϴ�.");
		    System.out.println("���� ���� : " + e.getMessage());
		   }
		  }
		  
		  mv.setViewName("/mail/test.jsp");
		  return mv;
		 }
}
