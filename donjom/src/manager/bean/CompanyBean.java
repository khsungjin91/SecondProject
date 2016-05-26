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
	private int currentPage = 1; //현재페이지
	@SuppressWarnings("unused")
	private int totalCount;		 // 총 게시물의 수
	@SuppressWarnings("unused")
	private int blockCount = 10; // 한 페이지의 게시물의 수
	@SuppressWarnings("unused")
	private int blockPage = 5;	 // 한 화면에 보여줄 페이지의 수
	@SuppressWarnings("unused")
	private String pagingHtml;	 // 페이징을 구현한 HTML
	
	
	// 회사정보 변경폼
	@RequestMapping("/manager_companyinfo.dj")
	public ModelAndView companyinfo(ManagerCompanyDto company){
		List list = sqlMap.queryForList("companyList", company);
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
	public ModelAndView companyModify(HttpServletRequest request, HttpServletResponse response, ManagerCompanyDto company){
		// 저장된 dto불러옴
		List list = sqlMap.queryForList("companyList", company);
		mv.setViewName("company");
		// 수정된 내용 db 저장
		sqlMap.update("companymodify", company);
		// 저장된 목록 보여주기
		mv.addObject("company", company);
		mv.setViewName("/managerpage/manager_companyinfo.jsp");
		return mv;
	}
	
	
	// 메인에서 보여지는 뉴스페이지
	@RequestMapping("/news_list.dj")
	public ModelAndView newslist(){
		mv.setViewName("/news/news_list.jsp");
		return mv;
	}
	// 관리자 모드에서 보여지는 뉴스페이지
	@SuppressWarnings("unchecked")
	@RequestMapping("/news_manager.dj")
	public ModelAndView newsmanager(ManagerPageingDto dto, HttpServletRequest request, HttpServletResponse response) throws Exception{
		// 현재페이지
		int currentPage = Integer.parseInt(pagingHtml);
		@SuppressWarnings("unused")
		List<ManagerNewsDto> list = sqlMap.queryForList("newsList", dto);
		
		totalCount = list.size(); // 전체 글 갯수
		dto = new ManagerPageingDto(currentPage, totalCount, blockCount, blockPage, totalCount);
		pagingHtml = dto.getPagingHtml().toString();
		int lastCount = totalCount;
		
		if(dto.getEndCount() < totalCount)
			lastCount = dto.getEndCount() + 1;
		
		list = list.subList(dto.getStartCount(), lastCount);
		
		mv.setViewName("/news/news_manager.jsp");
		
		return mv;
	}
	// 뉴스올리기
	@RequestMapping("/news_write.dj")
	public ModelAndView newswrite (){
		mv.setViewName("/news/news_write.jsp");
		return mv;
	}
	// 뉴스 수정
	@RequestMapping("/news_writePro.dj")
	public ModelAndView newswritePro(ManagerNewsDto news){
		mv.setViewName("news");
		sqlMap.insert("newsin", news);
		List list = sqlMap.queryForList("newsList", null);
		mv.addObject("list", list);
		mv.setViewName("/news/news_writePro.jsp");
		return mv;
	}
	// 뉴스 삭제
	@RequestMapping("/news_deletePro.dj")
	public ModelAndView newsdeletePro(){
		mv.setViewName("/news/news_deletePro.jsp");
		return mv;
	}
	
	

}
