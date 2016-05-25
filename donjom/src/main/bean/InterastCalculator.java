package main.bean;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import point.bean.PointDto;
import product.bean.RegisterDto;
import result.bean.CalculatorBean;

@Controller
public class InterastCalculator {
	
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
	public ModelAndView calculator(String investmoney,int term,String way,String rate){
		
		CalculatorBean calculator = new CalculatorBean();
		
		Map map = calculator.Calculator(investmoney, term, way, rate);
		
		mv.addObject("map",map);
		mv.setViewName("/calculator/calculatorresult.jsp");

		return mv;
	}
	
	

}
