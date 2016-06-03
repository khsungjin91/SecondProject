package manager.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompanyBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	// ȸ������ ������
	@RequestMapping("/manager_companyinfo.dj")
	public ModelAndView companyinfo(HttpServletRequest request){
		List list = sqlMap.queryForList("companyList", null);
		mv.addObject("list", list);
		mv.setViewName("/managerpage/manager_companyinfo.jsp");
		return mv;
	}
	// ȸ������ ����
	@RequestMapping("/manager_companyPro.dj") 
	public ModelAndView companyPro(ManagerCompanyDto company){
		// input �Է� 
		mv.setViewName("company");
		// db ����
		sqlMap.insert("companyin", company);
		// ����� ��� �����ֱ�
		mv.addObject("company", company);
		mv.setViewName("/managerpage/manager_companyPro.jsp");
		return mv;
	}
	// ȸ������ ����
	@RequestMapping("/manager_companyModify.dj")
	public ModelAndView companyModify(HttpServletRequest request, ManagerCompanyDto company){
		// ����� db�� input text�� �ҷ��;� ��
		List list = sqlMap.queryForList("companyList", null);
		mv.setViewName("company");
		// ������ ���� db ����
		sqlMap.update("companymodify", company);
		// ����� ��� �����ֱ�
		mv.addObject("company", company);
		mv.setViewName("/managerpage/manager_companyinfo.jsp");
		return mv;
	}
	@RequestMapping("/manager_companyModifyPro.dj")
	public ModelAndView companyModifyPro(){
		mv.setViewName("/managgerpage/manager_companyModifyPro.jsp");
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
	public ModelAndView newsdeletePro(ManagerNewsDto news){
		// db���� ����
		sqlMap.delete("newsDel", news);
		mv.addObject("news", news);
		mv.setViewName("/news/news_deletePro.jsp");
		return mv;
	}
}
