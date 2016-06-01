package product.bean;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	
	public void Makeit(String str,RegisterDto dto,SqlMapClientTemplate sqlMap)throws Exception{
		CalculatorBean calculator = new CalculatorBean();
		Map map = new HashMap();
		TableDto table = new TableDto();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdfmt = new SimpleDateFormat("yyyy.MM.dd");
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
		table.setMemno(dto.getP_memeno());
		table.setStr(str);
		
		for(int i = 0; i<term;i++){
			String  thisDayMiner = cal.get(cal.YEAR)+"."+(cal.get(cal.MONTH)+i+2)+"."+dto.getP_repayday();
			Date date = sdfmt.parse(thisDayMiner);
			thisDayMiner = new java.text.SimpleDateFormat ("yyyy.MM.dd").format(date);
						
			table.setRepayday(thisDayMiner);
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
