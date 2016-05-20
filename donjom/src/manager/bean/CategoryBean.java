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
	
	// 카테고리 목록
		@RequestMapping("/manager_category.dj")
		public ModelAndView category(ManagerCategoryDto category){
			ModelAndView mv = new ModelAndView();
			// 카테고리 목록 불러오기
			List list = sqlMap.queryForList("cetegoryList", null);
			
			mv.addObject("list", list);
			mv.setViewName("/managerpage/manager_category.jsp");
			return mv;
		}
		
		//카테고리 추가
		@RequestMapping("/manager_categoryPro.dj")
		public ModelAndView categoryPro(ManagerCategoryDto category){
			ModelAndView mv = new ModelAndView();
			// input 입력
			mv.setViewName("category");	
			// db 저장
			sqlMap.insert("categoryin", category);
			// 저장된 목록
			mv.addObject("category", category);
			mv.setViewName("/managerpage/manager_categoryPro.jsp");	
			return mv;	
		}
		
		// 카테고리 수정
		@RequestMapping("/manager_categoryModify.dj")
		public ModelAndView categoryModify(ManagerCategoryDto category){
			
			sqlMap.update("categorymodify", category);
			mv.addObject("category", category);
			mv.setViewName("/managerpage/manager_categoryModify.jsp");
			return mv;
		}
		
		// 카테고리 삭제
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
