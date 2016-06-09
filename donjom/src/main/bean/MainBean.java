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

import point.bean.PointDto;
import product.bean.FailBean;
import product.bean.RegisterDto;
import sign.bean.memberDto;

@Controller
public class MainBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	
	@RequestMapping("/main.dj")
	public ModelAndView main(PointDto pdto,memberDto dto,RegisterDto rdto, HttpSession session,HttpServletRequest request){
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		FailBean fail = new FailBean();
		List<RegisterDto> reglist = new ArrayList<RegisterDto>();
		
		//fail�� ��ǰ���� �ش� ������ �Ǹ� ���з� �ٲ��ش�.
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
		mv.addObject("count", count);
		}
		//��ǰ����Ʈ 
		List list = sqlMap.queryForList("productList", null);
		
		int total_interest = (Integer)sqlMap.queryForObject("product_count", null);
		//���������  = ��ü �������� �� / product��ü count
		float interest_count = Float.parseFloat((String) sqlMap.queryForObject("sum_interest", null));
		float y = interest_count/total_interest;
		
		//��������� = borrow ���� success �� �ݾ��� ��ü��
		String accumulate_loan = (String)sqlMap.queryForObject("sum_borrow", null) + "0000";
		
		//������ȯ�� = refunds ����  i_money�� ��ü ��
		//long accumulate_refunds = (Long)sqlMap.queryForObject("", null);
		
		//�ε��� = product��ü count / product ���� success�� fail ��
		int fail_count = (Integer)sqlMap.queryForObject("fail_count", null);
		float x = (float)fail_count/(float)total_interest*100;
		
		double fail_avg = Double.parseDouble(String.format("%.2f", x));		
		double avg_interest = Double.parseDouble(String.format("%.2f", y));
		
		mv.addObject("fail_avg", fail_avg);
		mv.addObject("accumulate_loan", accumulate_loan);
		mv.addObject("avg_interest", avg_interest);
		mv.addObject("list",list);
		mv.setViewName("/main/main.jsp");
		return mv;
	}
}
