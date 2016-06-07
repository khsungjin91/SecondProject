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
		mv.addObject("count", count);
		}
		//상품리스트 
		List list = sqlMap.queryForList("productList", null);
		
		
		int total_interest = (Integer)sqlMap.queryForObject("product_count", null);
		//평균이자율  = 전체 이자율의 합 / product전체 count
		float interest_count = Float.parseFloat((String) sqlMap.queryForObject("sum_interest", null));
		float avg_interest = interest_count/total_interest;
		
		//누적대출액 = borrow 에서 success 한 금액의 전체합
		String accumulate_loan = (String)sqlMap.queryForObject("sum_borrow", null) + "0000";
		
		//누적상환액 = refunds 에서  i_money의 전체 합
		//long accumulate_refunds = (Long)sqlMap.queryForObject("", null);
		
		//부도율 = product전체 count / product 에서 success의 fail 값
		int fail_count = (Integer)sqlMap.queryForObject("fail_count", null);
		float fail_avg = (float)fail_count/(float)total_interest;
		
		
		mv.addObject("fail_avg", fail_avg);
		mv.addObject("accumulate_loan", accumulate_loan);
		mv.addObject("avg_interest", avg_interest);
		mv.addObject("list",list);
		mv.setViewName("/main/main.jsp");
		return mv;
	}
}
