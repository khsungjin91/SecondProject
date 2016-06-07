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
		
		
		//�δ� ��� �����  = borrow����� ����/borrow ���ο��� 
		int borrowmoney_total = (Integer)sqlMap.queryForObject("", null);
		int borrowperson_total = (Integer)sqlMap.queryForObject("", null);
		//���� �����ڼ� borrow ���ο��� �����̸����� �ߺ�����
		String acc_br_person = (String)sqlMap.queryForObject("", null);
		
		//�δ� ��� ���ھ� = invest����� ����/invest ���ο��� 
		int investperson_total = (Integer)sqlMap.queryForObject("", null);
		
		//���� �����ڼ�
		String acc_iv_person = (String)sqlMap.queryForObject("", null);
		
		//�Ǵ� ��� ���ھ�
	
		//���� ���ڰ� �� = invest����� ����/invest �ѰǼ� 
		int invest_count = (Integer)sqlMap.queryForObject("distinct_count", null);
	
		
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
				
				
		mv.addObject("fail_avg", fail_avg);
		mv.addObject("accumulate_loan", accumulate_loan);
		mv.addObject("avg_interest", avg_interest);
		mv.setViewName("/main/djlive.jsp");
		return mv;
	}

}
