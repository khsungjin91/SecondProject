package product.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;

import result.bean.CalculatorBean;

@Controller
public class CreateTable {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	public void Makeit(String str,RegisterDto dto,SqlMapClientTemplate sqlMap){
		CalculatorBean calculator = new CalculatorBean();
		Map map = new HashMap();
		TableDto table = new TableDto();
		
		List list = sqlMap.queryForList("productList", null);
		
		System.out.println(list.size());
		
		int term = Integer.parseInt(dto.getP_term());
		
		
		sqlMap.insert("createTable", str);
		
		map = calculator.Calculator(dto.getP_price(), term , dto.getP_way(), dto.getP_rate());
		
		int [] price = new int[term];
		int [] interest = new int[term];
		int [] tax = new int[term];
		int [] refunds = new int[term];
		int [] realtotal = new int[term];
		int [] number = new int[term];		
		
		price = (int[])map.get("p_price");
		tax = (int[]) map.get("taxed");
		refunds =(int[])map.get("refunds");
		interest = (int[])map.get("interested");
		realtotal = (int[])map.get("realtotaled");
		
		table.setCode(dto.getP_code());
		table.setTerm(term);
		table.setWay(dto.getP_way());
		table.setRate(dto.getP_rate());
		table.setRepayday(dto.getP_repayday());
		table.setMemno(dto.getP_memeno());
		
		for(int i = 0; i<term;i++){
						
			number[i] = i+1;
			
			System.out.println(price[i]);
			
		}
		/*table.setNo(number[i]);
		sqlMap.insert("planrepay", table);
			table.setPrice(price[i]);
			table.setTax(tax[i]);
			table.setRefunds(refunds[i]);
			table.setInterest(interest[i]);
			table.setTotal(realtotal[i]);*/
		
	}
	
}
