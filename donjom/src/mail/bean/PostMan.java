package mail.bean;

import java.util.HashMap;
import java.util.Map;

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
	
	 
	@RequestMapping("/sendMailPro.dj")
	public ModelAndView confirmPro(String mailSend, String confirm,HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		
		Map map = new HashMap();
		
		int confirmNo = 0;
		int on = 1;
		
		map.put("email", email);
		map.put("on", on);
		
		
		if(mailSend.equals(confirm)){
		
			confirmNo = 1;
			sqlMap.update("confirmUp", map);
			
		}else{
			
			confirmNo = 0;
		}
		
		mv.addObject("confirmNo", confirmNo);
		mv.setViewName("/mail/confirmPro.jsp");
		return mv;
	}
}
