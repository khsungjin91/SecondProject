package manager.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DetailBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	
	// ������ ����
		@RequestMapping("/manager_page.dj")
		public ModelAndView managerpage(){
			mv.setViewName("/managerpage/manager_page.jsp");
			return mv;
		}
		
		// ���� �Խ���
		@RequestMapping("/manager_newslist.dj")
		public ModelAndView newslist(){
			mv.setViewName("/managerpage/manager_newslist.jsp");
			return mv;
		}
		
		@RequestMapping("/manager_newsboard.dj")
		public ModelAndView newsboard(){
			mv.setViewName("/managerpage/manager_newsboard.jsp");
			return mv;
		}
		
		// �����ø���
		@RequestMapping("/manager_newswrite.dj")
		public ModelAndView newswrite(){
			mv.setViewName("/managerpage/manager_newswrite.jsp");
			return mv;
		}
		@RequestMapping("/manager_newswritePro.dj")
		public ModelAndView newswritePro(){
			mv.setViewName("/managerpage/manager_newswritePro.jsp");
			return mv;
		}
		
		// �Խù� ����
		@RequestMapping("/manager_board.dj")
		public ModelAndView managerBoard(){
			mv.setViewName("/managerpage/manager_board.jsp");
			return mv;
		}
		// ����
		@RequestMapping("/manager_help.dj")
		public ModelAndView managerhelp(){
			mv.setViewName("/managerpage/manager_help.jsp");
			return mv;
		
		}


}
