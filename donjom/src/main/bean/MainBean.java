package main.bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mail.bean.mailTest;
import point.bean.PointDto;
import product.bean.FailBean;
import product.bean.RegisterDto;
import result.bean.PagingBean;
import setting.bean.pagingAction;
import sign.bean.memberDto;

@Controller
public class MainBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	
	@RequestMapping("/main.dj")
	public ModelAndView main(PointDto pdto,memberDto dto,RegisterDto rdto, HttpSession session,HttpServletRequest request,PagingBean page){
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		FailBean fail = new FailBean();
		HeadBean hdbean = new HeadBean();
		HeadDto hd = new HeadDto();
		List<RegisterDto> reglist = new ArrayList<RegisterDto>();
		float y = 0;
		double avg_interest =0;
		double fail_avg = 0;
		String accumulate_loan ="0";
		int maincount = (Integer)sqlMap.queryForObject("product_count", null);
		
		//fail될 상품들을 해당 요일이 되면 실패로 바꿔준다.
		reglist = sqlMap.queryForList("productList", null);
		
		for(int i = 0; i < reglist.size() ; i++){
			
			rdto = reglist.get(i);
			
		String x = (String)sqlMap.queryForObject("result.failday", rdto);
		String failday = x.substring(0, 10);
		String today = format.format(now);
	
		if(failday.equals(today) && rdto.getP_success().equals("doing")){
		fail.faillaon(sqlMap, rdto);
		}
		}
		
		if(session.getAttribute("memId") != null){
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		int count = (Integer)sqlMap.queryForObject("result.alarm", no);
		hd = hdbean.headcall(session,sqlMap);
	
		mv.addObject("hd", hd);
		mv.addObject("count", count);
		}
		//상품리스트 
		List list = sqlMap.queryForList("productList", null);
		
		int total_interest = (Integer)sqlMap.queryForObject("product_count", null);
		//평균이자율  = 전체 이자율의 합 / product전체 count
		
		if(maincount != 0){
			
		float interest_count = Float.parseFloat((String) sqlMap.queryForObject("sum_interest", null));
		y = interest_count/total_interest;
		//누적대출액 = borrow 에서 success 한 금액의 전체합
		accumulate_loan = (String)sqlMap.queryForObject("sum_borrow", null) + "0000";
		
		//누적상환액 = refunds 에서  i_money의 전체 합
		//long accumulate_refunds = (Long)sqlMap.queryForObject("", null);
		
		//부도율 = product전체 count / product 에서 success의 fail 값
		int fail_count = (Integer)sqlMap.queryForObject("fail_count", null);
		float x = (float)fail_count/(float)total_interest*100;
		
		fail_avg = Double.parseDouble(String.format("%.2f", x));		
		avg_interest = Double.parseDouble(String.format("%.2f", y));
		}
		
		int paging = 1;
		pagingAction input = null;
		String pagingHtml;
		int totalCount = 0;
		int currentPage = 1;
		int blockCount = 6;
		int blockPage = 10;
		
		totalCount = list.size();
		
		pagingHtml = page.getPage(currentPage, totalCount, blockCount, blockPage, input, paging);
		list = page.getList(currentPage, totalCount, blockCount, blockPage, input, list, paging);
		
		int refunds_price = (Integer)sqlMap.queryForObject("result.refunds_price", null);
		
		mv.addObject("maincount", maincount);
		mv.addObject("fail_avg", fail_avg);
		mv.addObject("accumulate_loan", accumulate_loan);
		mv.addObject("avg_interest", avg_interest);
		mv.addObject("list",list);
		mv.addObject("refunds_price", refunds_price);
		mv.setViewName("/main/main.jsp");
		return mv;
	}
}
