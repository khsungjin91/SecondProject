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
	
	
	@RequestMapping("/point_charging.dj")
	public ModelAndView pointCharging(int ch_price,PointDto dto,HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		dto.setNo(no);
		dto.setCh_price(ch_price);
		
		sqlMap.insert("ch_noinput", dto);
		
		mv.setViewName("/point/point_deposit_Pro.jsp");
	return mv;	
	}
	
	
	
	@RequestMapping("/point_refunds.dj")
	public ModelAndView pointRefunds(int re_price,HttpSession session,PointDto dto){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		dto.setNo(no);
		dto.setRe_price(re_price);
		
		sqlMap.insert("re_noinput", dto);
		
		mv.setViewName("/point/point_withdrow_Pro.jsp");
		return mv;
	}

}
