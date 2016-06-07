package manager.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewsBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;

	// 메인에서 보여지는 뉴스페이지
	@RequestMapping("/news_list.dj")
	public ModelAndView newslist(HttpServletRequest request){
		List list = sqlMap.queryForList("newsList", null);
		mv.addObject("list", list);
		mv.setViewName("/news/news_list.jsp");
		return mv;		
	}
	// 관리자 모드에서 보여지는 뉴스페이지
	@RequestMapping("/news_manager.dj")
	public ModelAndView newsmanager(HttpServletRequest request){
		List list = sqlMap.queryForList("newsList", null);
		mv.setViewName("/news/news_manager.jsp");
		return mv;
	}
	// 뉴스올리기
	@RequestMapping("/news_write.dj")
	public ModelAndView newswrite (ManagerNewsDto news){
		// input txet에 입력
		mv.setViewName("news");
		// db에  저장
		sqlMap.insert("newsin", news);	
		mv.addObject("news", news);
		mv.setViewName("/news/news_write.jsp");
		return mv;
	}
	// 뉴스 수정
	@RequestMapping("/news_writePro.dj")
	public ModelAndView newswritePro(ManagerNewsDto news){
		// input text에 DB 불러오기
		List list = sqlMap.queryForList("newsList", null);
		mv.addObject("list", list);
		// input text에 수정할 내용입력
		mv.setViewName("news");
		// db에 업데이트로 수정하기
		sqlMap.update("newsmodify", news);
		mv.addObject("list", list);
		mv.setViewName("/news/news_writePro.jsp");
		return mv;
	}
	// 뉴스 삭제
	@RequestMapping("/news_deletePro.dj")
	public ModelAndView newsdeletePro(ManagerNewsDto news, String title){
		news.setTitle(title);
		System.out.println("a");
		// db에서 삭제
		sqlMap.update("newsDel", news);
		System.out.println("b");
		mv.setViewName("/news/news_manager.dj");
		return mv;
	}
}