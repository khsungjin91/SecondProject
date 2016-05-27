package setting.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import result.bean.MessageDto;

@Controller
public class DashboardBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/dashboard.dj")
	public ModelAndView Dashboard(HttpSession session,MessageDto dto,HttpServletRequest request){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		List list = sqlMap.queryForList("result.getmessage", no);
		
		mv.addObject("list", list);
		mv.setViewName("/profile/dashboard.jsp");
		return mv;
	}
	
}
