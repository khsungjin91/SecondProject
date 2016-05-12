package product.bean;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InvestBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	private int total = 0;
	private int interest = 0;
	private int tax = 0;
	private int realtotal = 0;
	private int lastterm = 0;
	
	
	@RequestMapping("/fund_ready.dj")
	public ModelAndView investReview(RegisterDto dto){
	
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		
		int term = Integer.parseInt(dto.getP_term());
		

		int [] p_price = new int[term];
		int [] interested = new int[term];
		int [] refunds = new int[term];
		int [] taxed = new int [term];
		int [] realtotaled = new int [term];	
		
		int totaltotal = 0;
		int taxtotal = 0;
		int interesttotal = 0;
		
		if(dto.getP_way().equals("원리금 균등 상환")){
			
			total = (int)(Float.parseFloat(dto.getP_price()+"0000") * (Float.parseFloat(dto.getP_rate())/12)) / 100;
			
			tax = (int)(total*27.5/100);
			
			realtotal = total-tax;
			
			for(int i = 0; i < term ; i++){
				
				refunds[i] = total;
				p_price[i] = 0;
				taxed[i] = tax;
				realtotaled[i] = realtotal;
				
				totaltotal += refunds[i];
				taxtotal += taxed[i];
			}
			
			p_price[term-1] = (int)(Float.parseFloat(dto.getP_price()+"0000"));
			refunds[term-1] = (int) (total + (Float.parseFloat(dto.getP_price()+"0000")));
			realtotaled[term-1] = (int)(Float.parseFloat(dto.getP_price()+"0000")+realtotal);
			
		}else if(dto.getP_way().equals("")){
			
			total = (int)((Float.parseFloat(dto.getP_price()+"0000"))/term+
					(int)(Float.parseFloat(dto.getP_price()+"0000") * ((Float.parseFloat(dto.getP_rate())/12) / 100)));
			
			int price = (int)((Float.parseFloat(dto.getP_price()+"0000"))/term);
			
			interest = (int)(Float.parseFloat(dto.getP_price()+"0000") * (Float.parseFloat(dto.getP_rate())/12)) / 100;
			
			tax = (int)(interest*27.5/100);
			
			realtotal = total-tax;
			
			for(int i = 0; i < term ; i++){
				refunds[i] = total;
				p_price[i] = price;
				interested[i] = interest;
				taxed[i] = tax;
				realtotaled[i]=realtotal;
			}
		}
		
		mv.addObject("totaltotal",totaltotal);
		mv.addObject("taxtotal",taxtotal);
		mv.addObject("realtotaled", realtotaled);
		mv.addObject("taxed", taxed);
		mv.addObject("interested", interested);
		mv.addObject("refunds",refunds);
		mv.addObject("p_price",p_price);
		mv.setViewName("/product/fund_invest.jsp");
		return mv;
	}
	
}
