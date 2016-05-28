package setting.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import result.bean.MessageDto;
import result.bean.PagingBean;

@Controller
public class NotificationBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;

	
	@RequestMapping("/notification.dj")
	public ModelAndView NotiMain(HttpSession session,MessageDto dto,PagingBean page,HttpServletRequest request){
		String pagecurrent = request.getParameter("currentPage");
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		sqlMap.update("result.readed", no);
		
		int paging = 1;
		pagingAction input = null;
		String pagingHtml;
		int totalCount = 0;
		int currentPage = 0;
		int blockCount = 10;
		int blockPage = 10;
	
		List list = sqlMap.queryForList("result.getmessage", no);
		
		if(pagecurrent != null){
			currentPage = Integer.parseInt(pagecurrent);
		}else{
			currentPage = 1;
		}
		
		totalCount = list.size();
		
		pagingHtml = page.getPage(currentPage, totalCount, blockCount, blockPage, input, paging);
		list = page.getList(currentPage, totalCount, blockCount, blockPage, input, list, paging);

		mv.addObject("list", list);
		mv.addObject("pagingHtml", pagingHtml);
		mv.setViewName("/profile/notification.jsp");
		return mv;
	}
	
	
}
