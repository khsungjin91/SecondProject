package help.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class helpFAQ {
	
	@Autowired
	private SqlMapClientTemplate sqlmap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/help_faq.dj")
	public ModelAndView helpFaq(HttpServletRequest request){
		List list;
		
		list = sqlmap.queryForList("faqList", null);
		
		mv.addObject("list",list);
		mv.setViewName("faq/faq_list.jsp");
		return mv;
	}
	
	@RequestMapping("/help_faqForm.dj")
	public ModelAndView helpForm(){
		mv.setViewName("faq/faq_write.jsp");
		return mv;
	}
	
	@RequestMapping("/help_faqPro.dj")
	public ModelAndView helpFormPro(helpDTO helpDto){
		
		sqlmap.insert("helpWrite", helpDto);
		mv.setViewName("faq/faq_list.jsp");
		return mv;
	}
	

}
