package manager.bean;

import java.util.Calendar;
import java.util.List;

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
	
	//송금
	@RequestMapping("/manager_remittance.dj")
	public ModelAndView Remittance(InvestDto dto){
		
		List investlist = sqlMap.queryForList("result.manager_p", null);
		List remittancelist = sqlMap.queryForList("result.manager_rt", null);
		
		mv.addObject("list", investlist);
		mv.addObject("listrt", remittancelist);
		mv.setViewName("/managerprice/manager_remittance.jsp");
		return mv;
	}
	
	//환급
	@RequestMapping("/manager_refunds.dj")
	public ModelAndView Refund(RegisterDto dto){
		Calendar repayday = Calendar.getInstance();
		
		List repaydaylist = sqlMap.queryForList("result.matchday", null);
		List remittancelist = sqlMap.queryForList("result.manager_rt", null);
		
		int [] possible = new int[repaydaylist.size()];
		
		for(int i = 0; i < repaydaylist.size(); i++ ){
	
		if(repayday.get(Calendar.DAY_OF_MONTH) >= Integer.parseInt((String) repaydaylist.get(i))
				&& repayday.get(Calendar.DAY_OF_MONTH) <= Integer.parseInt((String) repaydaylist.get(i))+5){
			possible[i] = 1;
		}else{
			possible[i] = 0;
		}
		}
		mv.addObject("possible", possible);
		mv.addObject("listrt", remittancelist);
		mv.setViewName("/managerprice/manager_refunds.jsp");
		return mv;
	}
	
	//송금 미리보기
	@RequestMapping("/Money_check.dj")
	public ModelAndView MoneyCheck(String p_code,RegisterDto dto){		
		
		List list = sqlMap.queryForList("money_check", p_code);
		
		dto.setP_code(p_code);
		
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		
		mv.addObject("dto", dto);
		mv.addObject("list",list);
		mv.setViewName("/managerprice/Money_check.jsp");
		return mv;
	}
	
	//송금하기
	@RequestMapping("/send_loanmoney.dj")
	public ModelAndView SendMoney(String p_code){
		
		sqlMap.update("send_refunds_i", p_code);
		sqlMap.update("send_refunds_p", p_code);
		
		mv.setViewName("/managerprice/send_loanmoney.jsp");
		return mv;
	}
	
	//환급미리보기
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
		
		if(dto.getP_way().equals("1")){
			
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
			
			System.out.println(total[i]);
		}
		}else if(dto.getP_way().equals("0")){
			
		for(int i = 0; i<price.size();i++){
			
			interast = (Double.parseDouble(dto.getP_rate())/12/100);
			d = Double.parseDouble(String.format("%.7f", interast));
			total[i] = (int) (Double.parseDouble(price.get(i)+"0000") * d);
			
			System.out.println(total[i]);
		}
		}
		
		mv.addObject("total",total);
		mv.addObject("dto", dto);
		mv.addObject("list",list);
		mv.setViewName("/managerprice/Money_check_f.jsp");
		return mv;
	}
	
	//환급하기
	@RequestMapping("/refunds_money.dj")
	public ModelAndView RefundsMoney(String p_code){
	
		mv.setViewName("/managerprice/refunds_interastor.jsp");
		return mv;
	}
}
