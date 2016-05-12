package product.bean;

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
	
	@RequestMapping("/fund_ready.dj")
	public ModelAndView investReview(RegisterDto dto){
		
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		
		int term = Integer.parseInt(dto.getP_term());
		
		int total = 0;
		int [] p_price = new int[term];
		int [] interest = new int[term];
		int [] refunds = new int[term];
		
		System.out.println(dto.getP_way());
		
		if(dto.getP_way().equals("원금만기 일시상환")){
			total = (int)(Float.parseFloat(dto.getP_price()+"0000") * (Float.parseFloat(dto.getP_rate())/12) / 100);
			
			
			for(int i = 0; i < term ; i++){
				refunds[i] = total;
				
				}
			
			
			
		}else if(dto.getP_way().equals("원리금 균등 상환")){
			
			total = (int)((Float.parseFloat(dto.getP_price()+"0000"))/term+
					(int)(Float.parseFloat(dto.getP_price()+"0000") * ((Float.parseFloat(dto.getP_rate())/12) / 100)));
			
			for(int i = 0; i < term ; i++){
				refunds[i] = total;
				
				}
			
		}
	
		
		mv.addObject("refunds",refunds);
		mv.setViewName("/product/fund_invest.jsp");
		return mv;
	}
	
}
