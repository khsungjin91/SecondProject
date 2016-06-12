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