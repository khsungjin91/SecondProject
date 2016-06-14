package board.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class notice {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;

	
	@RequestMapping("/notice.dj")
	public ModelAndView noticelist(HttpServletRequest request){
		List list;
		list = sqlMap.queryForList("noticelist",null);
		mv.addObject("list",list);
		mv.setViewName("notice/notice_list.jsp");
		return mv;
		
	}
	
	@RequestMapping("/noticeForm.dj")
	public String noticeForm(){
		return "/notice/notice_writeForm.jsp";
	}
	
	@RequestMapping("/notice_writePro.dj")
	public ModelAndView notice_writePro(noticeDTO nodto){
		sqlMap.insert("writePro", nodto);
		mv.setViewName("/notice.dj");		
		return mv;
	}
	
	@RequestMapping("notice_view.dj")
	public ModelAndView noticeView(noticeDTO nodto, int no){
		nodto = (noticeDTO)sqlMap.queryForObject("noticeview", no);
		mv.addObject("nodto",nodto);
		mv.setViewName("/notice/notice_view.jsp");
		return mv;
		
	}
	
	@RequestMapping("notice_admin.dj")
	public ModelAndView noticeAdmin(noticeDTO nodto, int no){
		nodto = (noticeDTO)sqlMap.queryForObject("noticeview", no);
		mv.addObject("nodto",nodto);
		mv.setViewName("/notice/notice_admin.jsp");
		return mv;
		
	}
	
	@RequestMapping("notice_modify.dj")
	public ModelAndView noticeModify(noticeDTO nodto, int no){
		nodto = (noticeDTO)sqlMap.queryForObject("noticeview", no);
		mv.addObject("nodto",nodto);
		mv.setViewName("/notice/notice_modify.jsp");
		return mv;
		
	}
	
	@RequestMapping("notice_modifyPro.dj")
	public ModelAndView noticePro(noticeDTO nodto, int no){
		nodto.setN_num(no);
		sqlMap.update("noticeupdate", nodto);
		mv.setViewName("/notice_view.dj");
		return mv;
		}
	
	@RequestMapping("notice_delete.dj")
	public ModelAndView noticeDelete(noticeDTO nodto, int no){
		nodto.setN_num(no);
		sqlMap.update("deleteNotice", nodto);
		mv.setViewName("notice.dj");
		return mv;

	}


	

}
