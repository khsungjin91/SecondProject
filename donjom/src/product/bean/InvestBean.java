package product.bean;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import main.bean.HeadBean;
import main.bean.HeadDto;
import point.bean.PointDto;
import result.bean.CalculatorBean;

@Controller
public class InvestBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;

	private HeadBean hdbean = new HeadBean();
	private HeadDto hd = new HeadDto();
	
	@RequestMapping("/fund_ready.dj")
	public ModelAndView Investcal(RegisterDto dto,String amount,HttpSession session,PointDto pointdto){
		String email = (String)session.getAttribute("memId");
		CalculatorBean calculator =  new CalculatorBean();
		Map map = null;
		if(email == null){
			mv.setViewName("/user/signIn.jsp");
		}else{
		
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		pointdto = (PointDto)sqlMap.queryForObject("get_total", no);
		
		long mypoint = pointdto.getTotal_ch() - pointdto.getTotal_re(); 
		
		pointdto = (PointDto)sqlMap.queryForObject("get_total", no);
		
		dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
		
		int term = Integer.parseInt(dto.getP_term());
		
		map = calculator.Calculator(amount, term, dto.getP_way(), dto.getP_rate());
		
		hd = hdbean.headcall(session,sqlMap);
		
		mv.addObject("hd", hd);
	
		mv.addObject("mypoint", mypoint);
		mv.addObject("amount", amount);
		mv.addObject("map", map);
		mv.addObject("dto", dto);
		mv.setViewName("/product/fund_invest.jsp");
		}
		return mv;
	}
	
}
