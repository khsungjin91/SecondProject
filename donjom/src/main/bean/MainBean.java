package main.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView main(PointDto pdto,memberDto dto, HttpSession session,HttpServletRequest request){
	
		
		if(session.getAttribute("memId") != null){
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		int count = (Integer)sqlMap.queryForObject("result.alarm", no);
		
		
		//프로필 사진 가져오기
		dto = (memberDto)sqlMap.queryForObject("getoneInfo", email);
		
		
		//예치금 가져오기
		pdto = (PointDto)sqlMap.queryForObject("get_total", no);
		long total = pdto.getTotal_ch() - pdto.getTotal_re();
		
		//상품리스트 
		List list = sqlMap.queryForList("productList", null);
		
		
		mv.addObject("dto",dto);
		mv.addObject("total", total);
		mv.addObject("list",list);
		mv.addObject("count", count);
		}
		
		mv.setViewName("/main/main.jsp");
		return mv;
	}

}
