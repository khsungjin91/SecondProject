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

import setting.bean.pagingAction;

@Controller
public class NewsBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	public String getPage(int currentPage, int totalCount, int blockCount, int blockPage, ManagerPageingA input, int paging){
		String pagingHtml = null;
		input = new ManagerPageingA(currentPage, totalCount, blockCount, blockPage, paging);
		pagingHtml = input.getPagingHtml().toString();
		return pagingHtml;
	}
	public List getList(int currentPage, int totalCount, int blockCount, int blockPage, ManagerPageingA input, List list, int paging){
		input = new ManagerPageingA(currentPage, totalCount, blockCount, blockPage, paging);
		int lastCount = totalCount;
		if(input.getEndCount() < totalCount)
			lastCount = input.getEndCount() + 1;
		list = list.subList(input.getStartCount(), lastCount);
		return list;
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
	public ModelAndView newsmanager(HttpServletRequest request, ManagerNewsDto news, NewsBean page){
		String pagecurrent = request.getParameter("currentPage");
		ManagerPageingA input = null;
		
		int setting = 1;
		int currentPage = 0;
		int blockCount = 10;
		int blockPage = 10;
		int paging = 2;
		
		List list = sqlMap.queryForList("newsList", null);
		
		if(pagecurrent != null){
			currentPage = Integer.parseInt(pagecurrent);
		}else {currentPage = 1;}
		int totalCount = list.size();
		String pagingHtml = page.getPage(currentPage, totalCount, blockCount, blockPage, input, paging);
		List pagelist = page.getList(currentPage, totalCount, blockCount, blockPage, input, list, paging);
		
		mv.addObject("pagingHtml", paging);
		mv.addObject("list", pagelist);
		mv.addObject("setting",setting);
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
	// 뉴스 글쓰기 폼
	@RequestMapping("/news_write.dj")
	public ModelAndView newswrite (){	
		mv.setViewName("/news/news_write.jsp");
		return mv;
	}
	// 뉴스 글쓰기 저장
	@RequestMapping("/news_writePro.dj")
	public ModelAndView newswritePro(ManagerNewsDto news){
		sqlMap.insert("newsin", news);
		mv.setViewName("/news_manager.dj");
		return mv;
	}
	@RequestMapping("/news_view.dj")
	public ModelAndView newsview(ManagerNewsDto news, int no){
		news = (ManagerNewsDto) sqlMap.queryForObject("newsView", no);
		mv.addObject("news", news);
		mv.setViewName("/news/news_view.jsp");
		return mv;
	}
	@RequestMapping("/news_modify.dj")
	public ModelAndView newsmodify (ManagerNewsDto news, int no){
		news = (ManagerNewsDto) sqlMap.queryForObject("newsView", no);
		mv.addObject("news", news);
		mv.setViewName("/news/news_modify.jsp");
		return mv;
	}
	@RequestMapping("/news_modifyPro.dj")
	public ModelAndView newsmodifyPro (ManagerNewsDto news, int no){
		news.setNum(no);
		sqlMap.update("newsmodify", news);
		mv.setViewName("/news_view.dj");
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