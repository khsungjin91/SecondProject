package product.bean;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class BorrowBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	
	@RequestMapping("/laon_history.dj")
	public ModelAndView investhistory(HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		List list = sqlMap.queryForList("result.getborrow", no);
		
		mv.addObject("list", list);
		mv.setViewName("/profile/laon_history.jsp");
		return mv;
	}
	
	@RequestMapping("/loanBack.dj")
	public ModelAndView backResult(int br_no,TableDto dto){
		List list = null;
		String p_code ="";
		String code = "";
		int count = (Integer)sqlMap.queryForObject("result.product_check", br_no);
		
		if(count == 1){
		p_code = (String)sqlMap.queryForObject("result.product_code", br_no);
		
		code = p_code.substring(5, 10);
	
		list = sqlMap.queryForList("result.getloan", code);
		dto = (TableDto)sqlMap.queryForObject("result.getoneloan", code);
		
		mv.addObject("list", list);
		mv.addObject("dto", dto);
		}
		
		mv.addObject("count", count);
		mv.setViewName("/calculator/loanbackresult.jsp");
		return mv;
	}
	

}
