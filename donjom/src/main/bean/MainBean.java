package main.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import point.bean.PointDto;
import sign.bean.memberDto;

@Controller
public class MainBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	
	@RequestMapping("/main.dj")
	public ModelAndView main(PointDto pdto, HttpSession session){
		
		
		if(session.getAttribute("memId") != null){
		String email = (String)session.getAttribute("memId");
		
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		int count = (Integer)sqlMap.queryForObject("result.alarm", no);
		
		System.out.println(count);
		
		pdto = (PointDto)sqlMap.queryForObject("get_total", no);
		
		long total = pdto.getTotal_ch() - pdto.getTotal_re();
		
		mv.addObject("count", count);
		mv.addObject("total", total);
		}	
		mv.setViewName("/main/main.jsp");
		return mv;
	}

}
