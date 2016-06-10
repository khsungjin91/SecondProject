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
		int currentPage = 0; //����������
		int blockCount = 10; //���������� �Խù��Ǽ�
		int blockPage = 5;	 //�� ȭ�鿡 ������ �������� �� 
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
	// ���ο��� �������� ����������
	@RequestMapping("/news_list.dj")
	public ModelAndView newslist(HttpServletRequest request){
		List list = sqlMap.queryForList("newsList", null);
		mv.addObject("list", list);
		mv.setViewName("/news/news_list.jsp");
		return mv;		
	}
	// ������ ��忡�� �������� ����������
	@RequestMapping("/news_manager.dj")
	public ModelAndView newsmanager(HttpServletRequest request, ManagerNewsDto news){
		List list = sqlMap.queryForList("newsView", null);
		mv.addObject("list", list);
		mv.setViewName("/news/news_manager.jsp");
		return mv;
	}
	// ���� �˻�
	@RequestMapping("/news_search.dj")
	public ModelAndView newssearch(){
		List list = sqlMap.queryForList("newsView", null);
		mv.addObject("list", list);
		mv.setViewName("/news_manager.dj");
		return mv;
	}
	// �����ø���
	@RequestMapping("/news_write.dj")
	public ModelAndView newswrite (ManagerNewsDto news){	
		// input txet�� �Է�
		mv.setViewName("news");
		// db��  ����
		sqlMap.insert("newsin", news);	
		mv.addObject("news", news);
		mv.setViewName("/news/news_write.jsp");
		return mv;
	}
	// ���� ����
	@RequestMapping("/news_writePro.dj")
	public ModelAndView newswritePro(ManagerNewsDto news){
		// input text�� DB �ҷ�����
		List list = sqlMap.queryForList("newsList", null);
		mv.addObject("list", list);
		// input text�� ������ �����Է�
		mv.setViewName("news");
		// db�� ������Ʈ�� �����ϱ�
		sqlMap.update("newsmodify", news);
		mv.addObject("list", list);
		mv.setViewName("/news/news_writePro.jsp");
		return mv;
	}
	// ���� ����
	@RequestMapping("/news_delete.dj")
	public ModelAndView newsdeletePro(ManagerNewsDto news, int no){
		news.setNum(no);
		// db���� ����
		sqlMap.update("newsDel", news);
		mv.setViewName("/news/news_manager.dj");
		return mv;
	}
}