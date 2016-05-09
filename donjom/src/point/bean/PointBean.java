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
	public ModelAndView pointDeposit(PointDto pdto,SettingDto dto,HttpSession session){
		int total = 0;
		String email = (String)session.getAttribute("memId");
		
		if(session.getAttribute("memId") != null){
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		dto = (SettingDto)sqlMap.queryForObject("getmemberInfo", no);
	
		pdto = (PointDto)sqlMap.queryForObject("get_total", no);
			
		total = pdto.getTotal_ch() - pdto.getTotal_re();
		}
	
		mv.addObject("total",total);
		mv.addObject("dto", dto);
		mv.setViewName("/point/point_deposit.jsp");
		return mv;
	}
	
	
	@RequestMapping("/point_withdrow.dj")
	public ModelAndView pointWithdrow(PointDto pdto,SettingDto dto,HttpSession session){
		int total=0;
		String email = (String)session.getAttribute("memId");
		
		
		if(session.getAttribute("memId") != null){
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		dto = (SettingDto)sqlMap.queryForObject("getmemberInfo", no);
		
		pdto = (PointDto)sqlMap.queryForObject("get_total", no);
			
		total = pdto.getTotal_ch() - pdto.getTotal_re();
		}
		
		mv.addObject("total",total);
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
