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
	public ModelAndView newsmanager(HttpServletRequest request){
		List list = sqlMap.queryForList("newsList", null);
		mv.setViewName("/news/news_manager.jsp");
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
	@RequestMapping("/news_deletePro.dj")
	public ModelAndView newsdeletePro(ManagerNewsDto news, String title){
		news.setTitle(title);
		System.out.println("a");
		// db���� ����
		sqlMap.update("newsDel", news);
		System.out.println("b");
		mv.setViewName("/news/news_manager.dj");
		return mv;
	}
}