package manager.bean;

import java.util.List;

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
		public ModelAndView category(ManagerCategoryDto category){
			ModelAndView mv = new ModelAndView();
			// ī�װ� ��� �ҷ�����
			List list = sqlMap.queryForList("cetegoryList", null);
			
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
		public ModelAndView categoryModify(ManagerCategoryDto category){
			
			sqlMap.update("categorymodify", category);
			mv.addObject("category", category);
			mv.setViewName("/managerpage/manager_categoryModify.jsp");
			return mv;
		}
		
		// ī�װ� ����
		@RequestMapping("/manager_categoryDel.dj")
		public ModelAndView categoryDel(ManagerCategoryDto category){
			ModelAndView mv = new ModelAndView();
			category = (ManagerCategoryDto) sqlMap.queryForObject("categoryList", category.getC_name());
			
			category.setC_name(category.getC_name());

			sqlMap.update("categorydel", category);
			
			mv.setViewName("/managerpage/manager_categoryDel.jsp");
			return mv;
		}
		

}
