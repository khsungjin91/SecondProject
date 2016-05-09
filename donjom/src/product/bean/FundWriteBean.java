package product.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import setting.bean.SettingDto;
import sign.bean.memberDto;

@Controller
public class FundWriteBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/loan_step1.dj")
	public ModelAndView write1(SettingDto sedto,memberDto memdto,HttpSession session){
		
		String email=(String)session.getAttribute("memId");
		
		memdto = (memberDto)sqlMap.queryForObject("getoneInfo", email);
		
		sedto = (SettingDto)sqlMap.queryForObject("getmemberInfo", memdto.getNo());
		
		
		mv.addObject("memdto", memdto);
		mv.addObject("sedto", sedto);
		mv.setViewName("/product/fund_writeForm.jsp");
		return mv;
	}
	
	@RequestMapping("/loan_step2.dj")
	public ModelAndView write2(){
		
		mv.setViewName("/product/fund_writeForm2.jsp");
		return mv;
	}
	
	@RequestMapping("/loan_writPro.dj")
	public ModelAndView writePro(){
		
		mv.setViewName("/product/fund_writePro.jsp");
		return mv;
	}
	
	
}
