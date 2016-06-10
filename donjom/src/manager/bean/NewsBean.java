package manager.bean;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewsBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	// pagetest
	@RequestMapping("/test.dj")
	public ModelAndView test(HttpServletRequest request, ManagerPageingA page, String pagingHtml){
		String pagecurrent = request.getParameter("currentPage");
		ManagerPageingA input = null;
		
		int setting = 1;
		int currentPage = 0; //현재페이지
		int blockCount = 10; //한페이지의 게시물의수
		int blockPage = 5;	 //한 화면에 보여줄 페이지의 수 
		int paging = 1;		//
		
		List list = sqlMap.queryForList("newsList", null);
		
		if(pagecurrent != null){
			currentPage = Integer.parseInt(pagecurrent);
		}else{currentPage = 1;}
		int count = (Integer) sqlMap.queryForObject("allcount", null);
		int totalCount = list.size();
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("setting", setting);
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.setViewName("/news/test.jsp");
		return mv;
	}
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
	public ModelAndView newsmanager(HttpServletRequest request, ManagerNewsDto news){
		List list = sqlMap.queryForList("newsView", null);
		mv.addObject("list", list);
		mv.setViewName("/news/news_manager.jsp");
		return mv;
	}
	// 뉴스 검색
	@RequestMapping("/news_search.dj")
	public ModelAndView newssearch(){
		List list = sqlMap.queryForList("newsView", null);
		mv.addObject("list", list);
		mv.setViewName("/news_manager.dj");
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
	@RequestMapping("/news_delete.dj")
	public ModelAndView newsdeletePro(ManagerNewsDto news, int no){
		news.setNum(no);
		// db에서 삭제
		sqlMap.update("newsDel", news);
		mv.setViewName("/news/news_manager.dj");
		return mv;
	}
}