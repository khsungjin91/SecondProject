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
	public ModelAndView companyPro(ManagerCompanyDto company){
		// input 입력 
		mv.setViewName("company");
		// db 저장
		sqlMap.insert("companyin", company);
		// 저장된 목록 보여주기
		mv.addObject("company", company);
		mv.setViewName("/managerpage/manager_companyPro.jsp");
		return mv;
	}
	// 회사정보 수정
	@RequestMapping("/manager_companyModify.dj")
	public ModelAndView companyModify(HttpServletRequest request, ManagerCompanyDto company){
		// 저장된 db를 input text에 불러와야 함
		List list = sqlMap.queryForList("companyList", null);
		mv.setViewName("company");
		// 수정된 내용 db 저장
		sqlMap.update("companymodify", company);
		// 저장된 목록 보여주기
		mv.addObject("company", company);
		mv.setViewName("/managerpage/manager_companyinfo.jsp");
		return mv;
	}
	@RequestMapping("/manager_companyModifyPro.dj")
	public ModelAndView companyModifyPro(){
		mv.setViewName("/managgerpage/manager_companyModifyPro.jsp");
		return mv;
	}
}
	