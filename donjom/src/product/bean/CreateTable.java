package product.bean;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;

import result.bean.CalculatorBean;

@Controller
public class CreateTable {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	public void Makeit(String str,RegisterDto dto){
		CalculatorBean calculator = new CalculatorBean();
		Map map = new HashMap();
		TableDto table = new TableDto();
		
		int term = Integer.parseInt(dto.getP_term());
		
		table.setStr(str);
		
		sqlMap.insert("createTable", table);
		
		map = calculator.Calculator(dto.getP_invest(), term , dto.getP_way(), dto.getP_rate());
		
		String [] price = new String[term];
		String [] interest = new String[term];
		String [] tax = new String[term];
		String [] refunds = new String[term];
		String [] realtotal = new String[term];
		int [] number = new int[term];		
		
		price = (String[])map.get("p_price");
		tax = (String[]) map.get("taxed");
		refunds =(String[])map.get("refunds");
		interest = (String[])map.get("interested");
		realtotal = (String[])map.get("realtotaled");
		
		table.setCode(dto.getP_code());
		table.setTerm(term);
		table.setWay(dto.getP_way());
		table.setRate(dto.getP_rate());
		table.setRepayday(dto.getP_repayday());
		table.setMemno(dto.getP_memeno());
		
		for(int i = 0; i<term;i++){
						
			number[i] = i+1;
			
			table.setNo(number[i]);
			table.setPrice(price[i]);
			table.setTax(tax[i]);
			table.setRefunds(refunds[i]);
			table.setInterest(interest[i]);
			table.setTotal(realtotal[i]);
			
			sqlMap.insert("planrepay", table);
		}
		
		
	}
	
}
