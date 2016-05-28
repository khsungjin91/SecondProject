package result.bean;

import java.util.HashMap;
import java.util.Map;

public class CalculatorBean {
	
	
	private int total = 0;
	private int tax = 0;
	private int realtotal = 0;
	
	public Map Calculator(String investmoney, int term,String way,String rate){
		
	int investmoney2 = Integer.parseInt(investmoney+"0000");
	
	Map map = new HashMap();
	
	int [] p_price = new int[term];
	int [] interested = new int[term];
	int [] refunds = new int[term];
	int [] taxed = new int [term];
	int [] realtotaled = new int[term];	
	int [] count = new int[term];

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
	
	if(way.equals("1")){
		
		interast = (Double.parseDouble(rate)/12);
		
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
			
			//원금만기에서만 작동 나눠진 원금의 합
			totalto += refunds[i];
			
			// 원금만기에서만 작동하는 상환금 합계
			totaltotal = totalto+(int)(Float.parseFloat(investmoney+"0000"));
			
			//세금 합계
			taxtotal += taxed[i];
			
			//이자 합계
			interesttotal += interested[i];
		}
		
		supertotal = totaltotal - taxtotal;
		p_price[term-1] = (int)(Float.parseFloat(investmoney+"0000"));
		refunds[term-1] = (int) (total + (Float.parseFloat(investmoney+"0000")));
		realtotaled[term-1] = (int)(Float.parseFloat(investmoney+"0000")+realtotal);
		orgprice= p_price[term-1];
		
	}else if(way.equals("0")){
		
		//이자율
		interast = (Double.parseDouble(rate)/12/100);
		
		//저당상수 구하기
		x = 1+interast;
		y = x;
		for(int j = 0 ; j < term-1 ; j++){
			y *= x;
		}
		d = (interast*y) / (y-1); 
		
		//저당상수 소숫점 7번째자리수 까지만 자르기
		d = Double.parseDouble(String.format("%.7f", d));
		
		//월 상환액  
		total = (int)((Float.parseFloat(investmoney+"0000")*d));  
		
		//총투자금액 
		balance = investmoney2;
		
		//만기 개월 수 만큼 for문 돌리기
		for(int i = 0 ; i <term; i++){
			
			count[i] = i+1;   //회차 구하기
				
			refunds[i] = total;  //월상환액 균등하다
			
			interested[i] = (int)(balance * interast);  // 월 이자 월마다 다르다
		
			p_price[i]  = total - interested[i]; //원금  월마다 다르다
			
			taxed[i] = (int)(interested[i]*27.5/100); //이자에따른 세금
			
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
	
	return map;
	
	}
		


}
