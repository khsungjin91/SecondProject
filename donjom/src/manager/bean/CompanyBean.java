package manager.bean;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import result.bean.CalculatorBean;

@Controller
public class CompanyBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	//∏ﬁ¿Œ
	@RequestMapping("/manager_main.dj")
	public ModelAndView managermain(){
		CalculatorBean cal = new CalculatorBean();
		
		
		
		mv.setViewName("/manager/manager_main.jsp");
		return mv;
	}
	
	
	
}
	