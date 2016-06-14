package product.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import main.bean.HeadBean;
import main.bean.HeadDto;
import result.bean.PagingBean;
import setting.bean.pagingAction;

@Controller
public class ProductListBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	private HeadBean hdbean = new HeadBean();
	private HeadDto hd = new HeadDto();
	
	@RequestMapping("/fundList.dj")
	public ModelAndView productList(String category,HttpSession session,PagingBean page,HttpServletRequest request){
		Map map = new HashMap();
		int fundcount = 0;
		String [] status = {"refunds","overend","fail"};
		String [] status_jsp = {"상환중","상환완료","부도"};
		int [] status_count = new int[status.length];
		List list = null;
		int maincount = 0;
	
		String pagecurrent = request.getParameter("currentPage");
		
		if(category == null){
		list = sqlMap.queryForList("productList", null);
		fundcount = (Integer)sqlMap.queryForObject("product_count", null);
		
		for(int i = 0; i < status.length ; i++){
		status_count[i] = (Integer)sqlMap.queryForObject("success_sort", status[i]);
		}
		
		}else{
		list = sqlMap.queryForList("list_another", category);
		fundcount = (Integer)sqlMap.queryForObject("another_count", category);
		
		for(int i = 0; i < status.length ; i++){
			map.put("status",status[i]);
			map.put("category",category);
			status_count[i] = (Integer)sqlMap.queryForObject("success2_sort", map);
			}
		}
		
		maincount = list.size();
	
		if(session.getAttribute("memId") != null){
			hd = hdbean.headcall(session,sqlMap);
			mv.addObject("hd", hd);
		}
		
		int paging = 8;
		pagingAction input = null;
		String pagingHtml;
		int totalCount = 0;
		int currentPage = 0;
		int blockCount = 6;
		int blockPage = 10;
		
		if(pagecurrent != null){
			currentPage = Integer.parseInt(pagecurrent);
		}else{
			currentPage = 1;
		}
		
		totalCount = list.size();
		
		pagingHtml = page.getPage(currentPage, totalCount, blockCount, blockPage, input, paging);
		list = page.getList(currentPage, totalCount, blockCount, blockPage, input, list, paging);

		
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("maincount", maincount);
		mv.addObject("refunds", status_count[0]);
		mv.addObject("overend", status_count[1]);
		mv.addObject("fail", status_count[2]);
		mv.addObject("list", list);
		mv.addObject("fundcount",fundcount);
		mv.setViewName("/product/fund_list.jsp");
		return mv;
	}

	@RequestMapping("/ex.dj")
	private ModelAndView exfund(){
		mv.setViewName("/product/fund_practice.jsp");
		return mv;
	}

}
