package setting.bean;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.bean.InvestDto;

@Controller
public class InvestHistoryBean {

	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	private int total = 0;
	private int tax = 0;
	private int realtotal = 0;
	
	@RequestMapping("/refundsresult.dj")
	public ModelAndView investDetail(String p_code,HttpSession session,InvestDto dto)throws Exception{
		Calendar cal = Calendar.getInstance();
		Map map = new HashMap();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		String str = p_code.substring(5,10);
		int refunds_max = (Integer)sqlMap.queryForObject("result.max_refunds_no", str);
		
		map.put("no", no);
		map.put("p_code", p_code);
	
		dto = (InvestDto)sqlMap.queryForObject("result.oneget_i", map);
		String investmoney = dto.getI_invest();
		int investmoney2 = Integer.parseInt(investmoney+"0000");
		
		String times = String.valueOf(investmoney2);;
		
		//ȯ�޵Ǿ��Ҽ�
		int term_times = Integer.parseInt(dto.getI_times());
		//ȯ�޵� ��
		int term = refunds_max;
		
		int [] p_price = new int[term];
		int [] interested = new int[term];
		int [] refunds = new int[term];
		int [] taxed = new int [term];
		int [] realtotaled = new int[term];	
		int [] count = new int[term];
		String [] repayday = new String[term];
		
		int orgprice = 0;
		int supertotal = 0;
		int totaltotal = 0;
		int totalto = 0;
		int taxtotal = 0;
		int interesttotal = 0;
		int balance = 0;
		double d = 0.0; 
		double interast = 0;
		double x = 0;
		double y = 0;
		
		String z = dto.getI_date().substring(6, 7);
		int b = Integer.parseInt(z);
		cal.set(cal.MONTH, b);

		for(int i = 0; i<term ; i++){
			
			String  thisDayMiner = cal.get(cal.YEAR)+"."+(cal.get(cal.MONTH)+i+1)+"."+dto.getI_repayday();
			Date date = format.parse(thisDayMiner);
			thisDayMiner = new java.text.SimpleDateFormat ("yyyy.MM.dd").format(date);
			repayday[i] = thisDayMiner;
		}
		
		if(dto.getI_way().equals("1")){
			
			interast = (Double.parseDouble(dto.getI_profit())/12);
			
			d = Double.parseDouble(String.format("%.3f", interast));
					
			total = (int)(Double.parseDouble(investmoney+"0000") * d) / 100;
			
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
				totaltotal = totalto+(int)(Float.parseFloat(investmoney+"0000"));
				
				//���� �հ�
				taxtotal += taxed[i];
				
				//���� �հ�
				interesttotal += interested[i];
			}
			
			
			if(dto.getI_times().equals(times)){
			supertotal = totaltotal - taxtotal;
			p_price[term-1] = (int)(Float.parseFloat(investmoney+"0000"));
			refunds[term-1] = (int) (total + (Float.parseFloat(investmoney+"0000")));
			realtotaled[term-1] = (int)(Float.parseFloat(investmoney+"0000")+realtotal);
			orgprice= p_price[term-1];
			}
			
		}else if(dto.getI_way().equals("0")){
			
			//������
			interast = (Double.parseDouble(dto.getI_profit())/12/100);
			
			//������ ���ϱ�
			x = 1+interast;
			y = x;
			for(int j = 0 ; j < term_times-1 ; j++){
				y *= x;
			}
			d = (interast*y) / (y-1); 
			
			//������ �Ҽ��� 7��°�ڸ��� ������ �ڸ���
			d = Double.parseDouble(String.format("%.7f", d));
			
			//�� ��ȯ��  
			total = (int)((Float.parseFloat(investmoney+"0000")*d));  
			
			//�����ڱݾ� 
			balance = investmoney2;
			
			//���� ���� �� ��ŭ for�� ������
			for(int i = 0 ; i <term; i++){
				
				count[i] = i+1;   //ȸ�� ���ϱ�
					
				refunds[i] = total;  //����ȯ�� �յ��ϴ�
				
				interested[i] = (int)(balance * interast);  // �� ���� ������ �ٸ���
			
				p_price[i]  = total - interested[i]; //����  ������ �ٸ���
				
				taxed[i] = (int)(interested[i]*27.5/100); //���ڿ����� ����
				
				realtotaled[i] = refunds[i] - taxed[i];
						
				balance = balance-p_price[i];
				
				orgprice += p_price[i];
				totaltotal += refunds[i];
				taxtotal += taxed[i]; 
				interesttotal += interested[i];
				supertotal += realtotaled[i];
				
			}
		}
		
		map.put("orgprice", orgprice);
		map.put("count", count);
		map.put("supertotal", supertotal);
		map.put("investmoney", investmoney);
		map.put("interesttotal", interesttotal);
		map.put("totaltotal",totaltotal);
		map.put("taxtotal",taxtotal);
		map.put("realtotaled", realtotaled);
		map.put("taxed", taxed);
		map.put("interested", interested);
		map.put("refunds",refunds);
		map.put("p_price",p_price);
		map.put("repayday", repayday);
		
		int garbige = investmoney2 - orgprice;
		
		mv.addObject("dto", dto);
		mv.addObject("garbige", garbige);
		mv.addObject("map", map);
		mv.setViewName("/calculator/refundsresult.jsp");
		return mv;
	}
}
