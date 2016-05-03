package sign.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignUpBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/signUp.dj")
	public ModelAndView signUpForm(){
		
		
		mv.setViewName("/signup/signup_inputForm.jsp");
		return mv;
	}
	
	@RequestMapping("/signUpPro.dj")
	public ModelAndView signUpPro(memberDto dto){
		
		sqlMap.insert("signUp", dto);
		
		mv.setViewName("/signup/signup_inputPro.jsp");
		return mv;
	}
	
	@RequestMapping("/signup_checkPw.dj")
	public ModelAndView deletePwcheck(String email){
		
		mv.addObject("email", email);
		mv.setViewName("/signup/signup_checkPw.jsp");
		return mv;
	}
	
	
	@RequestMapping("/signup_checkPwPro.dj")
	public ModelAndView signdelete(memberDto dto, HttpSession session){
		
	int check =	(Integer)sqlMap.queryForObject("signcheck", dto);
		
	if(check == 1){
		
		sqlMap.delete("deleteEmail", dto);
		session.invalidate();
		
		mv.setViewName("/signup/signup_deletePro.jsp");
		
	}else{
		
		mv.setViewName("/user/signError.jsp");
	}
	
	
	
		return mv;
	}
	
	

}	
