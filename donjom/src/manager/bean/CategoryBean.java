package manager.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
		// ī�װ� ���
		@RequestMapping("/manager_category.dj")
		public ModelAndView category (HttpServletRequest request){
			List list =sqlMap.queryForList("categoryList", null);
			mv.addObject("list", list);
			mv.setViewName("/managerpage/manager_category.jsp");
			return mv;
		}
		//ī�װ� �߰�
		@RequestMapping("/manager_categoryPro.dj")
		public ModelAndView categoryPro(ManagerCategoryDto category){
			ModelAndView mv = new ModelAndView();
			// input �Է�
			mv.setViewName("category");	
			// db ����
			sqlMap.insert("categoryin", category);
			// ����� ���
			mv.addObject("category", category);
			mv.setViewName("/managerpage/manager_categoryPro.jsp");	
			return mv;	
		}
		// ī�װ� ����
		@RequestMapping("/manager_categoryModify.dj")
		public ModelAndView categoryModify(){
	
			mv.setViewName("/managerpage/manager_categorymodify.jsp");
			return mv;
		}
		@RequestMapping("/manager_categoryModifyPro.dj")
		public ModelAndView categoryModifyPro(){
			mv.setViewName("/managerpage/manager_categorymodifyPro.jsp");
			return mv;
		}
		
		// ī�װ� ����
		@RequestMapping("/manager_categoryDel.dj")
		public ModelAndView categoryDel(ManagerCategoryDto category){
			category = (ManagerCategoryDto) sqlMap.queryForObject("categoryList", category.getC_name());
			
			category.setC_name(category.getC_name());

			sqlMap.update("categorydel", category);
			
			mv.setViewName("/managerpage/manager_categoryDel.jsp");
			return mv;
		}
		
	
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
		public ModelAndView companyPro(ManagerCompanyDto companyinfo){
			// input �Է� 
			mv.setViewName("company");
			// db ����
			sqlMap.insert("companyin", companyinfo);
			// ����� ��� �����ֱ�
			mv.addObject("company", companyinfo);
			mv.setViewName("/managerpage/manager_companyPro.jsp");
			return mv;
		}
		// ȸ������ ����
		@RequestMapping("/manager_companyModify.dj")
		public ModelAndView companyModify(HttpServletRequest request, ManagerCompanyDto companyinfo){
			// ����� db�� input text�� �ҷ��;� ��
			List list = sqlMap.queryForList("companyList", null);
			mv.setViewName("company");
			// ������ ���� db ����
			sqlMap.update("companymodify", companyinfo);
			// ����� ��� �����ֱ�
			mv.addObject("company", companyinfo);
			mv.setViewName("/managerpage/manager_companyinfo.jsp");
			return mv;
		}
		@RequestMapping("/manager_companyModifyPro.dj")
		public ModelAndView companyModifyPro(){
			mv.setViewName("/managgerpage/manager_companyModifyPro.jsp");
			return mv;
		}


}
