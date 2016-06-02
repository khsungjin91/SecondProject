package admin.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class LoginBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/admin_login.dj")
	public ModelAndView adminlogin(){
		mv.setViewName("/admin/admin_login.jsp");
		return mv;
	}
	@RequestMapping("/admin_loginPro.dj")
	public ModelAndView adminloginpro(String id,String pw){
		
		mv.addObject("id",id);
		mv.addObject("pw",pw);
		
		mv.setViewName("/admin/admin_loginPro.jsp");
		return mv;
	}
	@RequestMapping("/admin_logout.dj")
	public ModelAndView adminlogoout(HttpSession session){
		
		session.invalidate();
		mv.setViewName("/admin/admin_logout.jsp");
		return mv;
	}
}
