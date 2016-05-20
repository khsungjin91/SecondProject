package product.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductListBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/fundList_total.dj")
	public ModelAndView productList(){
		
		List list = sqlMap.queryForList("productList", null);
		
		mv.addObject("list", list);
		mv.setViewName("/product/fund_list.jsp");
		return mv;
	}
	

}
