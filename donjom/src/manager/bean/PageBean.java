package manager.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	// 회사소개
	@RequestMapping("/manager_introduction.dj")
	public ModelAndView introduction(){
		mv.setViewName("/managerpage/manager_introduction.jsp");
		return mv;
	}
	// 이용약관
	@RequestMapping("/manager_agreement.dj")
	public ModelAndView agreement(){
		mv.setViewName("/managerpage/manager_agreement.jsp");
		return mv;
	}
	// 개인정보취급방침
	@RequestMapping("/manager_individual.dj")
	public ModelAndView individual(){
		mv.setViewName("/managerpage/manager_individual.jsp");
		return mv;
	}
	// 투자이용약관
	@RequestMapping("/manager_investment.dj")
	public ModelAndView investment(){
		mv.setViewName("/managerpage/manager_investment.jsp");
		return mv;
	}
	// 대출 안내
	@RequestMapping("/manager_loanguide.dj")
	public ModelAndView loanguide(){
		mv.setViewName("/managerpage/manager_loanguide.jsp");
		return mv;
	}
	// 투자 안내
	@RequestMapping("/manager_investguide.dj")
	public ModelAndView investguide(){
		mv.setViewName("/managerpage/manager_investguide.jsp");
		return mv;
	}
	
	// 투자 방법
	@RequestMapping("/manager_investmethod.dj")
	public ModelAndView inveestmethod(){
		mv.setViewName("/managerpage/manager_investmethod.jsp");
		return mv;
	}
	// 환급방법
	@RequestMapping("/manager_refundmethod.dj")
	public ModelAndView refundmethod(){
		mv.setViewName("/managerpage/manager_refundmethod.jsp");
		return mv;
	}
	
}
