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
			
			//���ݸ��⿡���� �۵� ������ ������ ��
			totalto += refunds[i];
			
			// ���ݸ��⿡���� �۵��ϴ� ��ȯ�� �հ�
			totaltotal = totalto+(int)(Float.parseFloat(investmoney+"0000"));
			
			//���� �հ�
			taxtotal += taxed[i];
			
			//���� �հ�
			interesttotal += interested[i];
		}
		
		supertotal = totaltotal - taxtotal;
		p_price[term-1] = (int)(Float.parseFloat(investmoney+"0000"));
		refunds[term-1] = (int) (total + (Float.parseFloat(investmoney+"0000")));
		realtotaled[term-1] = (int)(Float.parseFloat(investmoney+"0000")+realtotal);
		orgprice= p_price[term-1];
		
	}else if(way.equals("0")){
		
		//������
		interast = (Double.parseDouble(rate)/12/100);
		
		//������ ���ϱ�
		x = 1+interast;
		y = x;
		for(int j = 0 ; j < term-1 ; j++){
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
	
	return map;
	
	}
		


}
