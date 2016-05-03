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
		  
		  String from = "psj9102@naver.com";    // 메일 보내는 사람
		  String to = "psj9102@naver.com";   // 메일 보낼사람
		  String cc = "";     // 참조
		  String subject = "잘가는지 테스트 중~~~~~~~~~~";// 제목
		  String content = 
		   "안녕하세요. 반갑습니다.\n G-Mail을 이용한 메일 발송 예제입니다.\n 감사합니다.";// 내용
		  
		  if(from.trim().equals("")) {
		   System.out.println("보내는 사람을 입력하지 않았습니다.");
		  }
		  else if(to.trim().equals("")) {
		   System.out.println("받는 사람을 입력하지 않았습니다.");
		  }
		  else {
		   try {
		    mailTest mt = new mailTest();
		    
		    // 메일보내기
		    mt.sendEmail(from, to, cc, subject, content);
		    System.out.println("메일 전송에 성공하였습니다.");
		   }
		   catch(MessagingException me) {
		    System.out.println("메일 전송에 실패하였습니다.");
		    System.out.println("실패 이유 : " + me.getMessage());
		   }
		   catch(Exception e) {
		    System.out.println("메일 전송에 실패하였습니다.");
		    System.out.println("실패 이유 : " + e.getMessage());
		   }
		  }
		  
		  mv.setViewName("/mail/test.jsp");
		  return mv;
		 }
}
