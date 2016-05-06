package point.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import setting.bean.SettingDto;

@Controller
public class PointBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/point_deposit.dj")
	public ModelAndView pointDeposit(SettingDto dto,HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		dto = (SettingDto)sqlMap.queryForObject("getmemberInfo", no);
		
		
		mv.addObject("dto", dto);
		mv.setViewName("/point/point_deposit.jsp");
		return mv;
	}
	
	@RequestMapping("/point_withdrow.dj")
	public ModelAndView pointWithdrow(SettingDto dto,HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		dto = (SettingDto)sqlMap.queryForObject("getmemberInfo", no);
		
		
		mv.addObject("dto", dto);
		mv.setViewName("/point/point_withdrow.jsp");
		return mv;
		
	}
	
	@RequestMapping("/point_history.dj")
	public ModelAndView pointHistory(){
		
		mv.setViewName("/point/point_history.jsp");
		return mv;
	}

}
