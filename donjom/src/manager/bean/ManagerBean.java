package manager.bean;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.views.xslt.ArrayAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import product.bean.BorrowDto;
import result.bean.PagingBean;
import setting.bean.pagingAction;
import sign.bean.memberDto;

@Controller
public class ManagerBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/manager_main.dj")
	public ModelAndView managermain(){
		
		mv.setViewName("/manager/manager_main.jsp");
		return mv;
	}
	
	//회원관리
	@RequestMapping("/manager_member.dj")
	public ModelAndView managermember(HttpServletRequest request, PagingBean page ){
		String pagecurrent = request.getParameter("currentPage");
		pagingAction input = null;
		int setting=1;
		int currentPage=0;
		int blockCount=10; // 한 페이지에 들어오는 목록 갯수
		int blockPage=10; // 한번에 보여지는 페이지의 수 
		int paging=2;
				
		List list = sqlMap.queryForList("m_memberInfo",null);
		if (pagecurrent !=null){
			currentPage = Integer.parseInt(pagecurrent);
		}else{currentPage = 1;}
		
		int c_count = (Integer)sqlMap.queryForObject("confirmmemCount", null);
		int m_count = (Integer)sqlMap.queryForObject("memberCount", null);
		int totalCount=list.size();
		String pagingHtml = page.getPage(currentPage, totalCount, blockCount, blockPage, input, paging);
		List pagelist = page.getList(currentPage, totalCount, blockCount, blockPage, input, list, paging);
		
		mv.addObject("pagingHtml",pagingHtml);
		mv.addObject("setting",setting);
		mv.addObject("plist", pagelist);
		mv.addObject("c_count",c_count);
		mv.addObject("m_count",m_count);
		mv.addObject("setting",setting);
		mv.setViewName("/manager/manager_member.jsp");
		return mv;
	}

	//인증회원 검색
	@RequestMapping("/confirm_search.dj")
	public ModelAndView confirm_search(HttpServletRequest request,String confirm,String search){
		String pagecurrent = request.getParameter("currentPage");
			
		int setting=2;
		int currentPage=1;
		int blockCount=10; // 한 페이지에 들어오는 목록 갯수
		int blockPage=10; // 한번에 보여지는 페이지의 수 
		String pagingHtml;
		
		Map map = new HashMap();
		map.put("confirm", confirm);
		map.put("search", search);
		
		List list=sqlMap.queryForList("confirm_search",map);
		if(pagecurrent != null){
			currentPage=Integer.parseInt(pagecurrent);
		}else{	currentPage=1;	}		
		int totalCount=list.size();
		
		SearchPagingA page = new SearchPagingA(currentPage, totalCount, blockCount, blockPage, confirm, search);
		pagingHtml = page.getPagingHtml().toString(); 
	
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("pagingHtml",pagingHtml);
		mv.addObject("setting",setting);
		mv.addObject("plist",list);
		mv.setViewName("/manager/manager_member.jsp");
		return mv;
	}
	
	// 인증회원 상세페이지- 투자
	@RequestMapping("/manager_view.dj")
	public ModelAndView managerview(String email){

		int no=(Integer)sqlMap.queryForObject("getno",email);
		List list=sqlMap.queryForList("invest_email",no);
		int count=(Integer)sqlMap.queryForObject("invest_count", no);
		int sum=0;
		if(count!=0){
			sum=(Integer)sqlMap.queryForObject("invest_sum_no", no);		
		}else{
			sum=0;
		}
		mv.addObject("count",count);
		mv.addObject("sum",sum);
		mv.addObject("list",list);
		mv.addObject("email",email);
		mv.setViewName("/manager/manager_view.jsp");
		return mv;
	}
	
	
	// 인증회원 상세페이지 - 대출 
		@RequestMapping("/manager_borrow.dj")
		public ModelAndView managerborrow(String email){
		
			int no=(Integer)sqlMap.queryForObject("getno", email);
			List list=sqlMap.queryForList("borrow_email",no);
			int count=(Integer)sqlMap.queryForObject("borrow_count", no);
			int sum=0;
			if(count!=0){
				sum=(Integer)sqlMap.queryForObject("borrow_sum_no", no);			
			}else{
				sum=0;
			}	
			
			mv.addObject("count",count);
			mv.addObject("sum",sum);
			mv.addObject("list",list);
			mv.addObject("email",email);
			mv.setViewName("/manager/manager_borrow.jsp");
			return mv;
		}
		
	//일반회원
	@RequestMapping("/manager_noconfirm.dj")
	public ModelAndView managernoconfirm(){
		int setting = 1;
		List list = sqlMap.queryForList("m_member", null);
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_noconfirm.jsp");
		return mv;
	}
	
	//일반회원 검색
	@RequestMapping("/noconfirm_search.dj")
	public ModelAndView noconfirm_search(String noconfirm,String search){
		int setting = 2;
		Map map = new HashMap();
		map.put("noconfirm", noconfirm);
		//noconfirm을  받아서 noconfirm이름으로 map에 저장
		map.put("search", search);
		List list = sqlMap.queryForList("noconfirm_search", map);
		//map을 가지고 sql문을  수행하여 나온결과를 list에 저장  
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_noconfirm.jsp");
		return mv;
	}
	
	//투자자list,차트 (성진이가 할것)
	@RequestMapping("/manager_investmn.dj")
	public ModelAndView managerinvestmn(){
		mv.setViewName("/manager/manager_investmn.jsp");
		
		return mv;
	}
	
	
	//성진이가 한것입니다. 대출 리스트
	@RequestMapping("/manager_borrowlist.dj")
	public ModelAndView managerborrowlist(){
		List list = sqlMap.queryForList("borrowlist", null);
		int count = list.size();
		
		System.out.println(count);
		
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.setViewName("/manager/manager_borrowlist.jsp");
		return mv;
	}
		
}
