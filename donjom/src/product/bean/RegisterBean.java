package product.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/product_register.dj")
	public ModelAndView RegisterWrite(int no, String br_object,BorrowDto dto){
		Map map = new HashMap();
		
		map.put("no", no);
		map.put("br_object", br_object);
		
		dto = (BorrowDto)sqlMap.queryForObject("registerReady", map);
		
		mv.addObject("dto", dto);
		mv.setViewName("/product/fund_register.jsp");
		return mv;
	}
	
	@RequestMapping("/registerPro.dj")
	public ModelAndView RegisterPro(HttpServletRequest request){
		
		
		System.out.println(request.getParameter("content[0]"));
		
		
		mv.setViewName("/product/fundManager.jsp");
		return mv;
	}

}
