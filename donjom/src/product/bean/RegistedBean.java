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
		FailBean fail = new FailBean();
		Map map = new HashMap();
		String email = (String)session.getAttribute("memId");
		// 투자 금액 한도 설정에 대한 명시적 초기화
		int check = 0;
		int limit = 0;
		int limit2= 0;
		
		// 로그인했을때 실행
		if(session.getAttribute("memId") != null){
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		map.put("no", no);
		map.put("p_code", p_code);
		
		check = (Integer)sqlMap.queryForObject("result.investcheck", map);
		mv.addObject("no",no);
		}	
		//product 1개를 껀내준다.
		dto = (RegisterDto)sqlMap.queryForObject("productone", dto);
		
		List contentlist = sqlMap.queryForList("contentlist", p_code);
		List filelist = sqlMap.queryForList("filelist", p_code);
		
		// 최대 투자 금액은 대출금 / 5
		limit = Integer.parseInt(dto.getP_price())/5;
		// 남은 금액이 최대 투자 금액보다 낮으면 limit2 를 받는다
		limit2 = Integer.parseInt(dto.getP_price()) - Integer.parseInt(dto.getP_invest());
	
		if(limit > limit2){
			limit = limit2;
		}
		// 타이머 
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
