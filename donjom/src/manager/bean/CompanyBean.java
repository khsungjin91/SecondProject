package manager.bean;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import result.bean.CalculatorBean;

@Controller
public class CompanyBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	//메인
	@RequestMapping("/manager_main.dj")
	public ModelAndView managermain(){
		SimpleDateFormat format = new SimpleDateFormat("dd");
		Date now = new Date(); 
		String day = format.format(now);
		//none 상황인 대출 카운트 가져오기
		int borrow_count = (Integer)sqlMap.queryForObject("company.in_count", null);
		int eval_count = (Integer)sqlMap.queryForObject("company.eval_count", null);
		int none_register = (Integer)sqlMap.queryForObject("company.none_register", null);
		String total_borrow = (String)sqlMap.queryForObject("sum_borrow", null);
		List rm_list = sqlMap.queryForList("company.remittance_list", null);
		List rf_list = sqlMap.queryForList("company.refunds_list", day);
		List noList = sqlMap.queryForList("noticelist", null) ;
		List helplist = sqlMap.queryForList("faqList", null);
		
		int rm_count = rm_list.size();
		int rf_count = rf_list.size();
		/*System.out.println(rf_count);*/
		mv.addObject("helpList",helplist);
		mv.addObject("noList",noList);
		mv.addObject("rf_count", rf_count);
		mv.addObject("rm_count", rm_count);
		mv.addObject("rm_list", rm_list);
		mv.addObject("rf_list", rf_list);
		mv.addObject("borrow_count", borrow_count);
		mv.addObject("eval_count", eval_count);
		mv.addObject("none_register", none_register);
		mv.addObject("total_borrow", total_borrow);
		mv.setViewName("/manager/manager_main.jsp");
		return mv;
	}
	
	
	
}
	