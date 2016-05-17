package product.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegistedBean {

	@Autowired
	SqlMapClientTemplate sqlMap;
	@Autowired
	ModelAndView mv;
	
	@RequestMapping("/fundList_total.dj")
	public ModelAndView productList(){
		
		List list = sqlMap.queryForList("productList", null);
		
		mv.addObject("list", list);
		mv.setViewName("/product/fund_list.jsp");
		return mv;
	}
	
	@RequestMapping("/fundView.dj")
	public ModelAndView productview(String p_code,RegisterDto dto, HttpSession session){
		Map map = new HashMap();
		String email = (String)session.getAttribute("memId");
		int check = 0;

		if(session.getAttribute("memId") != null){
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		map.put("no", no);
		map.put("p_code", p_code);
		
		check = (Integer)sqlMap.queryForObject("result.investcheck", map);
		}	
		
		dto = (RegisterDto)sqlMap.queryForObject("productone", dto);
		List contentlist = sqlMap.queryForList("contentlist", p_code);
		List filelist = sqlMap.queryForList("filelist", p_code);

		
		
		mv.addObject("check", check);
		mv.addObject("dto",dto);
		mv.addObject("contentlist",contentlist);
		mv.addObject("filelist",filelist);
		mv.setViewName("/product/fund_view.jsp");
		return mv;
	}
	
	@RequestMapping("/laon_history.dj")
	public ModelAndView investhistory(){
		
		
		
		
		mv.setViewName("/profile/laon_history.jsp");
		return mv;
	}
	
}
