package product.bean;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import time.bean.TimeFormat;

@Controller
public class RegistedBean {

	@Autowired
	SqlMapClientTemplate sqlMap;
	@Autowired
	ModelAndView mv;
	
	
	@RequestMapping("/fundView.dj")
	public ModelAndView productview(String p_code,RegisterDto dto, HttpSession session)throws Exception{
		TimeFormat time = new TimeFormat();
		Map map = new HashMap();
		Calendar cal = Calendar.getInstance();
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String email = (String)session.getAttribute("memId");
		int check = 0;
		int limit = 0;
		int limit2= 0;
		
		if(session.getAttribute("memId") != null){
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		map.put("no", no);
		map.put("p_code", p_code);
		
		check = (Integer)sqlMap.queryForObject("result.investcheck", map);
		mv.addObject("no",no);
		}	
		dto = (RegisterDto)sqlMap.queryForObject("productone", dto);
	
		String x = (String)sqlMap.queryForObject("result.failday", dto);
		String failday = x.substring(0, 10);
		String today = format.format(now);
	
		if(failday.equals(today)){
			
			sqlMap.update("result.fail", dto.getNo());
		}
		
		dto = (RegisterDto)sqlMap.queryForObject("productone", dto);
		
		List contentlist = sqlMap.queryForList("contentlist", p_code);
		List filelist = sqlMap.queryForList("filelist", p_code);
		
		limit = Integer.parseInt(dto.getP_price())/5;
		
		limit2 = Integer.parseInt(dto.getP_price()) - Integer.parseInt(dto.getP_invest());
	
		if(limit > limit2){
			limit = limit2;
		}
		
		Map When = time.Time();
		
		mv.addObject("When",When);
		mv.addObject("limit", limit);
		mv.addObject("check", check);
		mv.addObject("dto",dto);
		mv.addObject("contentlist",contentlist);
		mv.addObject("filelist",filelist);
		mv.setViewName("/product/fund_view.jsp");
		return mv;
	}
	
}
