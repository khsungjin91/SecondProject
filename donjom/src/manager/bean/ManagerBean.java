package manager.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//ȸ������
	@RequestMapping("/manager_member.dj")
	public String managermember(){
	
		return "/manager/manager_member.jsp";
	}
	
	//����ȸ��
	@RequestMapping("/manager_confirm.dj")
	public ModelAndView managerconfirm(){
		int setting = 1;
		
		List list = sqlMap.queryForList("m_memberInfo", null);
		
		mv.addObject("setting", setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_confirm.jsp");
		
		return mv;
	}
	
	//����ȸ�� �˻�
	@RequestMapping()
	public ModelAndView confirm_search(String confirm,String search){
		
		int setting = 2;
		
		Map map = new HashMap();
		
		map.put("confirm", confirm);
		map.put("search", search);
		
		List list = sqlMap.queryForList("confirm_search", map);
		
		mv.addObject("setting", setting);
		mv.addObject("list", list);
		mv.setViewName("/manager/manager_confirm.jsp");		
		return mv;
	}
	
	//�Ϲ�ȸ��
	@RequestMapping("/manager_noconfirm.dj")
	public ModelAndView managernoconfirm(){
		int setting = 1;
	
		List list = sqlMap.queryForList("m_member", null);
		
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_noconfirm.jsp");
		return mv;
	}
	
	@RequestMapping("/nocofirm_search.dj")
	public ModelAndView noconfirm_search(String noconfirm,String search){
		
		int setting = 2;
		
		Map map = new HashMap();
		
		map.put("noconfirm", noconfirm);
		map.put("search", search);
		
		List list = sqlMap.queryForList("noconfirm_search", map);
		
		mv.addObject("setting", setting);
		mv.addObject("list", list);
		mv.setViewName("/manager/manager_noconfirm.jsp");		
		return mv;
	}
	
	// ������ ����
	@RequestMapping("/manager_page.dj")
	public ModelAndView managerpage(){
		mv.setViewName("/manager/manager_page.jsp");
		return mv;
	}
	// ȸ����������
	@RequestMapping("/manager_companyinfo.dj")
	public ModelAndView companyinfo(){
		mv.setViewName("/manager/manager_companyinfo.jsp");
		return mv;
	}
	
	// ī�װ� �߰�
	@RequestMapping("/manager_category.dj")
	public ModelAndView category(ManagerCategoryDto dto){
		List category = sqlMap.queryForList("categoryDto", null);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", dto);
		mv.setViewName("/manager/manager_category.jsp");
		return mv;
	}
	
	// �Խù� ����
		@RequestMapping("/manager_board.dj")
		public ModelAndView evaluation(){
			mv.setViewName("/manager/manager_board.jsp");
			return mv;
		}
		
		// ��������
		@RequestMapping("/manager_notice.dj")
		public ModelAndView managernotice(){
			
			mv.setViewName("/manager/manager_notice.jsp");
			return mv;
		}
		@RequestMapping("/manager_noticePro.dj")
		public ModelAndView noticePro(){
			
			mv.setViewName("/manager/manager_noticePro.jsp");
			return mv;
		}
		
		// ����
		@RequestMapping("/manager_help.dj")
		public ModelAndView managerhelp(){
			
			mv.setViewName("/manager/manager_help.jsp");
			return mv;
		}
		@RequestMapping("manager_helpPro.dj")
		public ModelAndView managerhelpPro(){
			mv.setViewName("/manager/manager_helpPro.jsp");
			return mv;
		}
		
		// ���� ����
		@RequestMapping("/manager_repay.dj")
		public ModelAndView repay(){
			mv.setViewName("/manager/manager_repay.jsp");
			return mv;
		}
		
		// ���� ����
		@RequestMapping("/manager_borrow.dj")
		public ModelAndView refund(){
			mv.setViewName("/manager/manager_refund.jsp");
			return mv;    
		}

}
