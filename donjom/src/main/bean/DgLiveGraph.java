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
		
		
		//���� �����ڼ� borrow ���ο��� �����̸����� �ߺ�����
		int acc_br_person = (Integer)sqlMap.queryForObject("distinct_br_count", null);
		//�δ� ��� �����  = borrow����� ����/borrow ���ο��� 
		long borrow_avg = Long.parseLong(borrowmoney_total)/acc_br_person;
		//���� �����ڼ� (�ߺ����̵�����)
		int investperson_total = (Integer)sqlMap.queryForObject("distinct_count", null);
		//�δ� ��� ���ھ� = invest����� ����/investperson_total
		long person_avg = Long.parseLong(investmoney_total)/investperson_total;
		//���� ���ڰ� ��
		int invest_count = (Integer)sqlMap.queryForObject("all_count", null);
		//�Ǵ� ��� ���ھ�= invest����� ����/invest_count 
		long onebyone_avg = Long.parseLong(investmoney_total)/invest_count;
	
		
		//���������  = ��ü �������� �� / product��ü count
		float interest_count = Float.parseFloat((String) sqlMap.queryForObject("sum_interest", null));
		float avg_interest = interest_count/total_interest;
				
		//��������� = borrow ���� success �� �ݾ��� ��ü��
		String accumulate_loan = (String)sqlMap.queryForObject("sum_borrow", null) + "0000";
				
		//������ȯ�� = refunds ����  i_money�� ��ü ��
		//long accumulate_refunds = (Long)sqlMap.queryForObject("", null);
				
		//�ε��� = product��ü count / product ���� success�� fail ��
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
