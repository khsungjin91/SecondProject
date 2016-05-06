package mail.bean;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostMan {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	

	@RequestMapping("/confirm.dj")
	public ModelAndView confirm(HttpSession session,String chemail){
	int [] random = {0,0,0,0};

	for(int i = 0 ; i<1; i++){
		  
		  for(int j = 0; j<4 ; j++){
		  i = (int)(Math.random()*10);
		  random[j] = i;
		  }
	}
	String mailSend = random[0]+""+random[1]+""+random[2]+""+random[3];  

	String from = "psj9102@naver.com";    // ���� ������ ���
	String to = chemail;   // ���� �������
	String cc = "";     // ����
	String subject = "DJ������ȣ ��ȣ ����";// ����
	String content = 
	"DJ ������ȣ ���� �Դϴ�."+mailSend+" �������ּ���";// ����

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
	 
	 }}
	
	
	mv.addObject("mailSend", mailSend);
	mv.setViewName("/mail/confirm.jsp");
	return mv;
	}

	
	 
	@RequestMapping("/sendMailPro.dj")
	public ModelAndView confirmPro(HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		
		Map map = new HashMap();
		
		int confirmNo = 0;
		int on = 1;
		
		map.put("email", email);
		map.put("on", on);
		
			sqlMap.update("confirmUp", map);
	

		mv.setViewName("/mail/confirmPro.jsp");
		return mv;
	}
}
