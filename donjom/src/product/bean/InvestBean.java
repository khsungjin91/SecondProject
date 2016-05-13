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
	
	private int total = 0;
	private int interest = 0;
	private int tax = 0;
	private int realtotal = 0;
	private int lastterm = 0;
	
	
	@RequestMapping("/fund_ready.dj")
	public ModelAndView calculator(RegisterDto dto,String amount){
	
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		
		int term = Integer.parseInt(dto.getP_term());
		//���Կ����Ѿ�
		int borrowmoney = Integer.parseInt(amount+"0000");
		
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
		
		if(dto.getP_way().equals("���ݸ��� �Ͻû�ȯ")){
			
			total = (int)(Float.parseFloat(amount+"0000") * (Float.parseFloat(dto.getP_rate())/12)) / 100;
			
			tax = (int)(total*27.5/100);
			
			realtotal = total-tax;
			
			for(int i = 0; i < term ; i++){
				
				count[i] = i+1;
					
				refunds[i] = total;
				p_price[i] = 0;
				interested[i] = total;
				taxed[i] = tax;
				realtotaled[i] = realtotal;
				
				//���ݸ��⿡���� �۵� ������ ������ ��
				totalto += refunds[i];
				
				// ���ݸ��⿡���� �۵��ϴ� ��ȯ�� �հ�
				totaltotal = totalto+(int)(Float.parseFloat(amount+"0000"));
				
				//���� �հ�
				taxtotal += taxed[i];
				
				//���� �հ�
				interesttotal += interested[i];
			}
			
			supertotal = totaltotal - taxtotal;
			p_price[term-1] = (int)(Float.parseFloat(amount+"0000"));
			refunds[term-1] = (int) (total + (Float.parseFloat(amount+"0000")));
			realtotaled[term-1] = (int)(Float.parseFloat(amount+"0000")+realtotal);
			
		}else if(dto.getP_way().equals("������ �յ� ��ȯ")){
			
			total = (int)((Float.parseFloat(amount+"0000"))/term+
					(int)(Float.parseFloat(amount+"0000") * ((Float.parseFloat(dto.getP_rate())/12) / 100)));
			
			balance = borrowmoney;
			
			for(int i = 0 ; i <term; i++){
				
					count[i] = i+1;
			
				refunds[i] = total;
				
				interested[i] = (int)((balance * ((Float.parseFloat(dto.getP_rate())/12) / 100)));
				
				balance = balance - total;
				
				p_price[i]  = total - interested[i];
				
				taxed[i] = (int)(interested[i]*27.5/100);
				
				realtotaled[i] = refunds[i] - taxed[i];
						
				
				totaltotal += refunds[i];
				taxtotal += taxed[i]; 
				interesttotal += interested[i];
				supertotal += realtotaled[i];
				
			}
			/* 
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
			*/
		}
			
		mv.addObject("count", count);
		mv.addObject("supertotal", supertotal);
		mv.addObject("borrowmoney", borrowmoney);
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
		return mv;
	}
	
}
