package manager.bean;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.bean.InvestDto;
import product.bean.RegisterDto;

@Controller
public class ManagerPriceBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	

	//ȯ��
	@RequestMapping("/manager_refunds.dj")
	public ModelAndView Refund(RegisterDto dto){
		Calendar repayday = Calendar.getInstance();
		
		List repaydaylist = sqlMap.queryForList("result.matchday", null);
		List refunds_inglist = sqlMap.queryForList("result.refunds_ing", null);
		//List refunds_endlist = sqlMap.queryForList("result.refunds_end", null);
		
		int [] possible = new int[repaydaylist.size()];
		System.out.println(repayday.get(repayday.DAY_OF_WEEK));
		for(int i = 0; i < repaydaylist.size(); i++ ){
	//Integer.parseInt((String) repaydaylist.get(i)
		if(repayday.get(repayday.DAY_OF_WEEK) >= 30
				|| repayday.get(Calendar.DAY_OF_MONTH) <= Integer.parseInt((String) repaydaylist.get(i))+5){
			possible[i] = 1;
		}else{
			possible[i] = 0;
		}
		}
		mv.addObject("possible", possible);
		mv.addObject("listrt", refunds_inglist);
		//mv.addObject("list", refunds_endlist);
		mv.setViewName("/managerprice/manager_refunds.jsp");
		return mv;
	}

	@RequestMapping("/manager_refunded.dj")
	public ModelAndView Refunded(RegisterDto dto){
		
		List list = sqlMap.queryForList("result.refunds_end", null);
		
		mv.addObject("listrt", list);
		mv.setViewName("/managerprice/manager_refunded.jsp");
		return mv;
	}
	
	//ȯ�޹̸�����
	@RequestMapping("/Money_check_f.dj")
	public ModelAndView MoneyCheck_f(String p_code,RegisterDto dto){		
		double interast = 0;
		double d = 0.0; 
		double x = 0;
		double y = 0;
		
		dto.setP_code(p_code);
		
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		int term = Integer.parseInt(dto.getP_term()); 
			
		List list = sqlMap.queryForList("money_check", p_code);
		List price = sqlMap.queryForList("refunds_price", p_code);
		
		int [] investmoney = new int[price.size()];
		int [] total = new int[price.size()];
		
		if(dto.getP_way().equals("0")){
			
		for(int i = 0; i<price.size();i++){
			interast = (Double.parseDouble(dto.getP_rate())/12/100);
			x = 1+interast;
			y = x;
			for(int j = 0 ; j < term-1 ; j++){
				y *= x;
			}
			d = (interast*y) / (y-1); 
			d = Double.parseDouble(String.format("%.7f", d));
			total[i] = (int)((Float.parseFloat(price.get(i)+"0000")*d));
			}
		}else if(dto.getP_way().equals("1")){
			
		for(int i = 0; i<price.size();i++){
			interast = (Double.parseDouble(dto.getP_rate())/12/100);
			d = Double.parseDouble(String.format("%.7f", interast));
			total[i] = (int) (Double.parseDouble(price.get(i)+"0000") * d);
			}
		}
		mv.addObject("total",total);
		mv.addObject("dto", dto);
		mv.addObject("list",list);
		mv.setViewName("/managerprice/Money_check_f.jsp");
		return mv;
	}
	
	//ȯ���ϱ�
	@RequestMapping("/refunds_money.dj")
	public ModelAndView RefundsMoney(String p_code,RegisterDto dto){
		Map map = new HashMap();
		double interast = 0;
		double d = 0.0; 
		double x = 0;
		double y = 0;
		int no = 0;
		
		String str = p_code.substring(5,10);
		
		dto.setP_code(p_code);
		
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		int refunds_times = (Integer)sqlMap.queryForObject("result.minno", str);
		
		int term = Integer.parseInt(dto.getP_term()); 
			
		//��ǰ�� ������ �����ڵ��� �̸���List �� �����´�.
		List email = sqlMap.queryForList("get_invest_email", p_code);
		//�����ڵ��� ���ڱݾ�List �� �����´�.
		List price = sqlMap.queryForList("refunds_price", p_code);
		
		int [] investmoney = new int[price.size()];
		int [] total = new int[price.size()];
		
		
		if(dto.getP_way().equals("0")){
			
				for(int i = 0; i<price.size();i++){
					no = (Integer)sqlMap.queryForObject("getno", email.get(i));
					
					interast = (Double.parseDouble(dto.getP_rate())/12/100);
					
					x = 1+interast;
					y = x;
					for(int j = 0 ; j < term-1 ; j++){
						y *= x;
					}
					d = (interast*y) / (y-1); 
					
					d = Double.parseDouble(String.format("%.7f", d));
					total[i] = (int)((Float.parseFloat(price.get(i)+"0000")*d));
					
					map.put("no", no);
					map.put("refundmoney", total[i]);
					map.put("times", refunds_times);
					map.put("p_code", p_code);
					
					sqlMap.insert("result.refunds_insert", map); // refundsDB�� ����
					sqlMap.update("refunds_start", map);// ��ȯ���� �����ڵ鿡�� �Ѹ���.	
				}
				
		}else if(dto.getP_way().equals("1")){
			
				for(int i = 0; i<price.size();i++){
					no = (Integer)sqlMap.queryForObject("getno", email.get(i));
					
					interast = (Double.parseDouble(dto.getP_rate())/12/100);
					d = Double.parseDouble(String.format("%.7f", interast));
					total[i] = (int) (Double.parseDouble(price.get(i)+"0000") * d);
					
					map.put("no", no);
					map.put("refundmoney", total[i]);
					map.put("times", refunds_times);
					map.put("p_code", p_code);
					
					sqlMap.insert("result.refunds_insert", map); // refundsDB�� ����
					sqlMap.update("refunds_start", map);// ��ȯ���� �����ڵ鿡�� �Ѹ���.	
					}
		}
	
		map.put("str", str);
		
		sqlMap.insert("result.refunds_insert", map); // refundsDB�� ����	
		sqlMap.update("result.back_update", map); // ��ǰ����DB��  back�� 1�� ������ش�.
		sqlMap.update("result.fundingup", map); // �����ڵ��� �� �� �ֵ��� ȸ���� �÷��ش�.
		
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		
		//���� ��ȯȸ���� ���ݱ����� ��ȯȸ���� ������ ��ȯ���Ḧ �˸���.
		if(dto.getP_funding().equals(dto.getP_term())){
			
			sqlMap.update("result.changeEnd", p_code);
			sqlMap.update("result.changeOver", p_code);
			
		}
	
		mv.setViewName("/managerprice/refunds_interastor.jsp");
		return mv;
	}
}
