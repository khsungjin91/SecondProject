package manager.bean;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.views.xslt.ArrayAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/manager_main.dj")
	public ModelAndView managermain(){
		
		mv.setViewName("/manager/manager_main.jsp");
		return mv;
	}
	@RequestMapping("/manager_member.dj")
	public String managermember(){
	
		return "/manager/manager_member.jsp";
	}
	
	@RequestMapping("/manager_confirm.dj")
	public ModelAndView managerconfirm(){
		
		List list= new ArrayList();
		list = sqlMap.queryForList("m_memberInfo", null);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_confirm.jsp");
		
		return mv;
	}
	@RequestMapping("/manager_noconfirm.dj")
	public ModelAndView managernoconfirm(){
		
		List list= new ArrayList();
		list = sqlMap.queryForList("m_member", null);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_noconfirm.jsp");
		
		return mv;
	}
	
	@RequestMapping("/manager_page.dj")
	public ModelAndView managercategory(){
		
		mv.setViewName("/manager/manager_category.jsp");
		return mv;
	}
	@RequestMapping("/manager_board.dj")
	public ModelAndView evaluation(){
		
		mv.setViewName("/manager/manager_evaluation.jsp");
		return mv;
	}
	@RequestMapping("/manager_repay.dj")
	public ModelAndView repay(){
		
		mv.setViewName("/manager/manager_repay.jsp");
		return mv;
	}
	@RequestMapping("/manager_borrow.dj")
	public ModelAndView refund(){
		
		mv.setViewName("/manager/manager_refund.jsp");
		return mv;
	    
	}

}
