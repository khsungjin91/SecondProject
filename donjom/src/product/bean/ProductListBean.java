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
	
	@RequestMapping("/fundList.dj")
	public ModelAndView productList(String category){
		String fundcount;
		List list = null;
		
		System.out.println(category);
		
		if(category == null){
		list = sqlMap.queryForList("productList", null);
		}else{
		list = sqlMap.queryForList("list_anoter", category);
		}
		
		mv.addObject("list", list);
		fundcount = (String)sqlMap.queryForObject("productborrow", null);
		mv.addObject("fundcount",fundcount);
		mv.setViewName("/product/fund_list.jsp");
		return mv;
	}


}
