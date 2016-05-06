package point.bean;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PointCalculator {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@Autowired
	private ModelAndView mv;
	
	
	@RequestMapping("point_charging.dj")
	public ModelAndView pointCharging(int ch_price,PointDto dto,HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		String ch_name = (String)sqlMap.queryForObject("findname", no);
		
		dto.setNo(no);
		dto.setCh_price(ch_price);
		dto.setCh_name(ch_name);
		
		sqlMap.insert("pointinput", dto);
		
		mv.setViewName("");
	return mv;	
	}

}
