package setting.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/dashboard.dj")
	public ModelAndView Dashboard(){
		
		mv.setViewName("/profile/dashboard.jsp");
		return mv;
	}
	
}
