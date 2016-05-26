package manager.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	@SuppressWarnings("unused")
	private int currentPage = 1; //����������
	@SuppressWarnings("unused")
	private int totalCount;		 // �� �Խù��� ��
	@SuppressWarnings("unused")
	private int blockCount = 10; // �� �������� �Խù��� ��
	@SuppressWarnings("unused")
	private int blockPage = 5;	 // �� ȭ�鿡 ������ �������� ��
	@SuppressWarnings("unused")
	private String pagingHtml;	 // ����¡�� ������ HTML
	
	
	// ȸ������ ������
	@RequestMapping("/manager_companyinfo.dj")
	public ModelAndView companyinfo(ManagerCompanyDto company){
		List list = sqlMap.queryForList("companyList", company);
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
	public ModelAndView companyModify(HttpServletRequest request, HttpServletResponse response, ManagerCompanyDto company){
		// ����� dto�ҷ���
		List list = sqlMap.queryForList("companyList", company);
		mv.setViewName("company");
		// ������ ���� db ����
		sqlMap.update("companymodify", company);
		// ����� ��� �����ֱ�
		mv.addObject("company", company);
		mv.setViewName("/managerpage/manager_companyinfo.jsp");
		return mv;
	}
	
	
	// ���ο��� �������� ����������
	@RequestMapping("/news_list.dj")
	public ModelAndView newslist(){
		mv.setViewName("/news/news_list.jsp");
		return mv;
	}
	// ������ ��忡�� �������� ����������
	@SuppressWarnings("unchecked")
	@RequestMapping("/news_manager.dj")
	public ModelAndView newsmanager(ManagerPageingDto dto, HttpServletRequest request, HttpServletResponse response) throws Exception{
		// ����������
		int currentPage = Integer.parseInt(pagingHtml);
		@SuppressWarnings("unused")
		List<ManagerNewsDto> list = sqlMap.queryForList("newsList", dto);
		
		totalCount = list.size(); // ��ü �� ����
		dto = new ManagerPageingDto(currentPage, totalCount, blockCount, blockPage, totalCount);
		pagingHtml = dto.getPagingHtml().toString();
		int lastCount = totalCount;
		
		if(dto.getEndCount() < totalCount)
			lastCount = dto.getEndCount() + 1;
		
		list = list.subList(dto.getStartCount(), lastCount);
		
		mv.setViewName("/news/news_manager.jsp");
		
		return mv;
	}
	// �����ø���
	@RequestMapping("/news_write.dj")
	public ModelAndView newswrite (){
		mv.setViewName("/news/news_write.jsp");
		return mv;
	}
	// ���� ����
	@RequestMapping("/news_writePro.dj")
	public ModelAndView newswritePro(ManagerNewsDto news){
		mv.setViewName("news");
		sqlMap.insert("newsin", news);
		List list = sqlMap.queryForList("newsList", null);
		mv.addObject("list", list);
		mv.setViewName("/news/news_writePro.jsp");
		return mv;
	}
	// ���� ����
	@RequestMapping("/news_deletePro.dj")
	public ModelAndView newsdeletePro(){
		mv.setViewName("/news/news_deletePro.jsp");
		return mv;
	}
	
	

}
