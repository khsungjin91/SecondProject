package product.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InvestedBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired  
	private ModelAndView mv;
	
	@RequestMapping("/invest_start.dj")
	public ModelAndView invested(HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		
		
		
		
		mv.setViewName("/product/fund_view.jsp");
		return mv;
	}
	
}
