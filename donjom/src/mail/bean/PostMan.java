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

	String from = "psj9102@naver.com";    // 메일 보내는 사람
	String to = chemail;   // 메일 받을사람
	String cc = "";     // 참조
	String subject = "DJ인증번호 번호 전송";// 제목
	String content = 
	"DJ 인증번호 전송 입니다."+mailSend+" 인증해주세요";// 내용

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
