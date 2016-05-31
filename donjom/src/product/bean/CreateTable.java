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
		
		System.out.println(dto.getP_invest());
		
		int term = Integer.parseInt(dto.getP_term());
		
		sqlMap.insert("createTable", str);
		
		map = calculator.Calculator(dto.getP_invest(), term , dto.getP_way(), dto.getP_rate());
		
		
		
		
	}
	
}
