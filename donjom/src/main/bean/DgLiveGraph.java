package main.bean;

import java.util.HashMap;
import java.util.Map;

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
	public ModelAndView graph()throws Exception{
		Map map_r = new HashMap();
		Map map_l = new HashMap();
		InterastGraph ig = new InterastGraph();
		MonthTotalGraph mg = new MonthTotalGraph();
		String investmoney_total = (String)sqlMap.queryForObject("total_invest_money", null)+"0000";
		String borrowmoney_total = (String)sqlMap.queryForObject("sum_borrow", null)+"0000";
		int total_interest = (Integer)sqlMap.queryForObject("product_count", null);
		
		
		//누적 대출자수 borrow 총인원수 같은이름대출 중복금지
		int acc_br_person = (Integer)sqlMap.queryForObject("distinct_br_count", null);
		//인당 평균 대출액  = borrow대출액 총합/borrow 총인원수 
		long borrow_avg = Long.parseLong(borrowmoney_total)/acc_br_person;
		//누적 투자자수 (중복아이디제거)
		int investperson_total = (Integer)sqlMap.queryForObject("distinct_count", null);
		//인당 평균 투자액 = invest대출액 총합/investperson_total
		long person_avg = Long.parseLong(investmoney_total)/investperson_total;
		//누적 투자건 수
		int invest_count = (Integer)sqlMap.queryForObject("all_count", null);
		//건당 평균 투자액= invest대출액 총합/invest_count 
		long onebyone_avg = Long.parseLong(investmoney_total)/invest_count;
	
		
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
				
		map_r = ig.interast(sqlMap);
		map_l = mg.monthtotal(sqlMap);
		
		mv.addObject("map_l",map_l);
		mv.addObject("map_r", map_r); 
		mv.addObject("acc_br_person", acc_br_person);
		mv.addObject("borrow_avg", borrow_avg);
		mv.addObject("investperson_total", investperson_total);
		mv.addObject("person_avg", person_avg);
		mv.addObject("invest_count", invest_count);
		mv.addObject("onebyone_avg", onebyone_avg);
		mv.addObject("fail_avg", fail_avg);
		mv.addObject("accumulate_loan", accumulate_loan);
		mv.addObject("avg_interest", avg_interest);
		mv.setViewName("/main/djlive.jsp");
		return mv;
	}

}
