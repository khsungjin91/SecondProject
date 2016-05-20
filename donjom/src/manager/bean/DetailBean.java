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
	
	
	// 페이지 관리
		@RequestMapping("/manager_page.dj")
		public ModelAndView managerpage(){
			mv.setViewName("/managerpage/manager_page.jsp");
			return mv;
		}
		
		// 뉴스 게시판
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
		
		// 뉴스올리기
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
		
		// 게시물 관리
		@RequestMapping("/manager_board.dj")
		public ModelAndView managerBoard(){
			mv.setViewName("/managerpage/manager_board.jsp");
			return mv;
		}
		// 도움말
		@RequestMapping("/manager_help.dj")
		public ModelAndView managerhelp(){
			mv.setViewName("/managerpage/manager_help.jsp");
			return mv;
		
		}


}
