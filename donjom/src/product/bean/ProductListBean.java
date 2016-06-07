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
		String fundcount = "";
		String [] status = {"refunds","fail","overend"};
		int [] status_count = new int[status.length];
		List list = null;
		
		System.out.println(category);
		
		if(category == null){
		list = sqlMap.queryForList("productList", null);
		fundcount = (String)sqlMap.queryForObject("product_count", null);
		
		for(int i = 0; i < status.length ; i++){
		status_count[i] = (Integer)sqlMap.queryForObject("", status[i]);
		}
		
		}else{
		list = sqlMap.queryForList("list_another", category);
		fundcount = (String)sqlMap.queryForObject("another_count", category);
		
		for(int i = 0; i < status.length ; i++){
			status_count[i] = (Integer)sqlMap.queryForObject("", status[i]);
		}
		}
		
		mv.addObject("list", list);
		mv.addObject("fundcount",fundcount);
		mv.setViewName("/product/fund_list.jsp");
		return mv;
	}


}
