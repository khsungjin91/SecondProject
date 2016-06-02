package main.bean;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import point.bean.PointDto;
import product.bean.InvestDto;
import product.bean.RegisterDto;
import result.bean.CalculatorBean;

@Controller
public class InterastCalculator {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	private int total = 0;
	private int tax = 0;
	private int realtotal = 0;
	
	@RequestMapping("/calculator.dj")
	public ModelAndView ready(){
		
		mv.setViewName("/calculator/calculatorinput.jsp");
		return mv;
	}
	
	@RequestMapping("/calculStart.dj")
	public ModelAndView calculator(String investmoney,int term,String way,
			String rate,int split,String p_code,HttpSession session,InvestDto dto)throws Exception{
		CalculatorBean calculator = new CalculatorBean();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		Map map = calculator.Calculator(investmoney, term, way, rate);

		if(split == 1){
			String [] repayday = new String[term];
			
			map.put("no", no);
			map.put("p_code", p_code);
		
			dto = (InvestDto)sqlMap.queryForObject("result.oneget_i", map);
			
			String z = dto.getI_date().substring(6, 7);
			int b = Integer.parseInt(z);
			cal.set(cal.MONTH, b);

			for(int i = 0; i<term ; i++){
	
			String  thisDayMiner = cal.get(cal.YEAR)+"."+(cal.get(cal.MONTH)+i+1)+"."+dto.getI_repayday();
			Date date = format.parse(thisDayMiner);
			thisDayMiner = new java.text.SimpleDateFormat ("yyyy.MM.dd").format(date);
			repayday[i] = thisDayMiner;
			
			}
			map.put("repayday", repayday);
			
		mv.addObject("map",map);
		mv.setViewName("/calculator/investresult.jsp");
		}else{
			
		mv.addObject("map",map);
		mv.setViewName("/calculator/calculatorresult.jsp");
		}

		return mv;
	}
	
}
