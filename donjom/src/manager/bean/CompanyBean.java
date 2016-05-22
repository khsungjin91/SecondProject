package manager.bean;

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
	
	
	// ȸ������ ������
	@RequestMapping("/manager_companyinfo.dj")
	public ModelAndView companyinfo(ManagerCompanyDto company){
		
		mv.setViewName("company");	
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
	
	

}