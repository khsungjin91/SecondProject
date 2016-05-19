package product.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import point.bean.PointDto;

@Controller
public class InvestBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	private int total = 0;
	private int tax = 0;
	private int realtotal = 0;
	
	@RequestMapping("/fund_ready.dj")
	public ModelAndView calculator(RegisterDto dto,String amount,HttpSession session,PointDto pointdto){
		String email = (String)session.getAttribute("memId");
		
		
		if(email == null){
			mv.setViewName("/user/signIn.jsp");
		}else{
		
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		pointdto = (PointDto)sqlMap.queryForObject("get_total", no);
		
		long mypoint = pointdto.getTotal_ch() - pointdto.getTotal_re(); 
		
		pointdto = (PointDto)sqlMap.queryForObject("get_total", no);
		
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		
		int term = Integer.parseInt(dto.getP_term());
		//납입원금총액
		int investmoney = Integer.parseInt(amount+"0000");
		
		int [] p_price = new int[term];
		int [] interested = new int[term];
		int [] refunds = new int[term];
		int [] taxed = new int [term];
		int [] realtotaled = new int[term];	
		int [] count = new int[term];

		int supertotal = 0;
		int totaltotal = 0;
		int totalto = 0;
		int taxtotal = 0;
		int interesttotal = 0;
		int balance = 0;
		double d = 0.0; 
		double interast = 0.0;
		
		if(dto.getP_way().equals("원금만기 일시상환")){
			
			interast = (Double.parseDouble(dto.getP_rate())/12);
			
			d = Double.parseDouble(String.format("%.3f", interast));
					
			
			total = (int)(Float.parseFloat(amount+"0000") * d ) / 100;
			
			tax = (int)(total*27.5/100);
			
			realtotal = total-tax;
			
			for(int i = 0; i < term ; i++){
				
				count[i] = i+1;
					
				refunds[i] = total;
				p_price[i] = 0;
				interested[i] = total;
				taxed[i] = tax;
				realtotaled[i] = realtotal;
				
				//원금만기에서만 작동 나눠진 원금의 합
				totalto += refunds[i];
				
				// 원금만기에서만 작동하는 상환금 합계
				totaltotal = totalto+(int)(Float.parseFloat(amount+"0000"));
				
				//세금 합계
				taxtotal += taxed[i];
				
				//이자 합계
				interesttotal += interested[i];
			}
			
			supertotal = totaltotal - taxtotal;
			p_price[term-1] = (int)(Float.parseFloat(amount+"0000"));
			refunds[term-1] = (int) (total + (Float.parseFloat(amount+"0000")));
			realtotaled[term-1] = (int)(Float.parseFloat(amount+"0000")+realtotal);
			
		}else if(dto.getP_way().equals("원리금 균등 상환")){
			
			interast = (Double.parseDouble(dto.getP_rate())/12);
			
			d = Double.parseDouble(String.format("%.3f", interast));
			
			total = (int)((Float.parseFloat(amount+"0000"))/term+
					(int)(Float.parseFloat(amount+"0000") * d) / 100);
			
			balance = investmoney;
			
			for(int i = 0 ; i <term; i++){
				
					count[i] = i+1;
			
				refunds[i] = total;
				
				interested[i] = (int)((balance * (d / 100)));
				
				balance = balance - total;
				
				p_price[i]  = total - interested[i];
				
				taxed[i] = (int)(interested[i]*27.5/100);
				
				realtotaled[i] = refunds[i] - taxed[i];
						
				
				totaltotal += refunds[i];
				taxtotal += taxed[i]; 
				interesttotal += interested[i];
				supertotal += realtotaled[i];
				
			}
		}
			
		mv.addObject("mypoint", mypoint);
		mv.addObject("amount", amount);
		mv.addObject("count", count);
		mv.addObject("supertotal", supertotal);
		mv.addObject("investmoney", investmoney);
		mv.addObject("interesttotal", interesttotal);
		mv.addObject("totaltotal",totaltotal);
		mv.addObject("taxtotal",taxtotal);
		mv.addObject("realtotaled", realtotaled);
		mv.addObject("taxed", taxed);
		mv.addObject("interested", interested);
		mv.addObject("refunds",refunds);
		mv.addObject("p_price",p_price);
		mv.addObject("dto", dto);
		mv.setViewName("/product/fund_invest.jsp");
		}
		return mv;
	}
	
}
