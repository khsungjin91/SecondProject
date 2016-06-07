package main.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DgLiveGraph {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/DJlive.dj")
	public ModelAndView graph(){
		
		int investmoney_total = (Integer)sqlMap.queryForObject("", null);
		int total_interest = (Integer)sqlMap.queryForObject("product_count", null);
		
		
		//인당 평균 대출액  = borrow대출액 총합/borrow 총인원수 
		int borrowmoney_total = (Integer)sqlMap.queryForObject("", null);
		int borrowperson_total = (Integer)sqlMap.queryForObject("", null);
		//누적 대출자수 borrow 총인원수 같은이름대출 중복금지
		String acc_br_person = (String)sqlMap.queryForObject("", null);
		
		//인당 평균 투자액 = invest대출액 총합/invest 총인원수 
		int investperson_total = (Integer)sqlMap.queryForObject("", null);
		
		//누적 투자자수
		String acc_iv_person = (String)sqlMap.queryForObject("", null);
		
		//건당 평균 투자액
	
		//누적 투자건 수 = invest대출액 총합/invest 총건수 
		int invest_count = (Integer)sqlMap.queryForObject("distinct_count", null);
	
		
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
		mv.setViewName("/main/djlive.jsp");
		return mv;
	}

}
