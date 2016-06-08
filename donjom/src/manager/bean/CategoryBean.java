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
	
		// 카테고리 목록
		@RequestMapping("/manager_category.dj")
		public ModelAndView category (HttpServletRequest request){
			List list =sqlMap.queryForList("categoryList", null);
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
		public ModelAndView categoryModify(){
	
			mv.setViewName("/managerpage/manager_categorymodify.jsp");
			return mv;
		}
		@RequestMapping("/manager_categoryModifyPro.dj")
		public ModelAndView categoryModifyPro(){
			mv.setViewName("/managerpage/manager_categorymodifyPro.jsp");
			return mv;
		}
		
		// 카테고리 삭제
		@RequestMapping("/manager_categoryDel.dj")
		public ModelAndView categoryDel(ManagerCategoryDto category){
			category = (ManagerCategoryDto) sqlMap.queryForObject("categoryList", category.getC_name());
			
			category.setC_name(category.getC_name());

			sqlMap.update("categorydel", category);
			
			mv.setViewName("/managerpage/manager_categoryDel.jsp");
			return mv;
		}
		
	
		// 회사정보 변경폼
		@RequestMapping("/manager_companyinfo.dj")
		public ModelAndView companyinfo(HttpServletRequest request){
			List list = sqlMap.queryForList("companyList", null);
			mv.addObject("list", list);
			mv.setViewName("/managerpage/manager_companyinfo.jsp");
			return mv;
		}
		// 회사정보 저장
		@RequestMapping("/manager_companyPro.dj") 
		public ModelAndView companyPro(ManagerCompanyDto companyinfo){
			// input 입력 
			mv.setViewName("company");
			// db 저장
			sqlMap.insert("companyin", companyinfo);
			// 저장된 목록 보여주기
			mv.addObject("company", companyinfo);
			mv.setViewName("/managerpage/manager_companyPro.jsp");
			return mv;
		}
		// 회사정보 수정
		@RequestMapping("/manager_companyModify.dj")
		public ModelAndView companyModify(HttpServletRequest request, ManagerCompanyDto companyinfo){
			// 저장된 db를 input text에 불러와야 함
			List list = sqlMap.queryForList("companyList", null);
			mv.setViewName("company");
			// 수정된 내용 db 저장
			sqlMap.update("companymodify", companyinfo);
			// 저장된 목록 보여주기
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
