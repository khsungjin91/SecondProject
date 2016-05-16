package setting.bean;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import result.bean.MessageDto;

@Controller
public class NotificationBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;

	
	@RequestMapping("/notification.dj")
	public ModelAndView NotiMain(HttpSession session,MessageDto dto){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		List list = sqlMap.queryForList("getmessage", no);
		
		System.out.println(list.size());
		
		mv.addObject("list",list);
		mv.setViewName("/profile/notification.jsp");
		return mv;
	}
	
	
}
