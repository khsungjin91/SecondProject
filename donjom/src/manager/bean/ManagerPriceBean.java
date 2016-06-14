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
	

	//환급
	@RequestMapping("/manager_refunds.dj")
	public ModelAndView Refund(RegisterDto dto){
		Calendar repayday = Calendar.getInstance();
	
		List refunds_inglist = sqlMap.queryForList("result.refunds_ing", null);
		//List refunds_endlist = sqlMap.queryForList("result.refunds_end", null);

		int ing_count =  refunds_inglist.size();
		
		
		mv.addObject("ing_count", ing_count);
		mv.addObject("listrt", refunds_inglist);
		//mv.addObject("list", refunds_endlist);
		mv.setViewName("/managerprice/manager_refunds.jsp");
		return mv;
	}

	@RequestMapping("/manager_refunded.dj")
	public ModelAndView Refunded(RegisterDto dto){
		
		List list = sqlMap.queryForList("result.refunds_end", null);
		
		int end_count = list.size();
		
		mv.addObject("end_count", end_count);
		mv.addObject("listrt", list);
		mv.setViewName("/managerprice/manager_refunded.jsp");
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
	
	//환급하기
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
			
		//상품에 투자한 투자자들의 이메일List 를 가져온다.
		List email = sqlMap.queryForList("get_invest_email", p_code);
		//투자자들의 투자금액List 를 가져온다.
		List price = sqlMap.queryForList("refunds_price", p_code);
		
		for(int i = 0; i <email.size() ; i++){
			System.out.println("email="+email.get(i));
			System.out.println("price="+price.get(i));
		}
		
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
					
					System.out.println(total[i]);
					
					map.put("no", no);
					map.put("refundmoney", total[i]);
					map.put("times", refunds_times);
					map.put("p_code", p_code);
					
					sqlMap.insert("result.refunds_insert", map); // refundsDB에 들어가는
					sqlMap.update("refunds_start", map);// 상환금을 투자자들에게 뿌린다.	
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
					
					sqlMap.insert("result.refunds_insert", map); // refundsDB에 들어가는
					sqlMap.update("refunds_start", map);// 상환금을 투자자들에게 뿌린다.	
					}
		}
	
		map.put("str", str);
		
		sqlMap.insert("result.refunds_insert", map); // refundsDB에 들어가는	
		sqlMap.update("result.back_update", map); // 상품개인DB에  back을 1로 만들어준다.
		sqlMap.update("result.fundingup", map); // 투자자들이 볼 수 있도록 회차를 늘려준다.
		
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		
		//만약 상환회차와 지금까지한 상환회차가 같으면 상환종료를 알린다.
		if(dto.getP_funding().equals(dto.getP_term())){
			
			sqlMap.update("result.changeEnd", p_code);
			sqlMap.update("result.changeOver", p_code);
			
		}
	
		mv.setViewName("/managerprice/refunds_interastor.jsp");
		return mv;
	}
}
