package manager.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import result.bean.PagingBean;
import setting.bean.pagingAction;

@Controller
public class ManagerMember {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	//일반회원
		@RequestMapping("/manager_noconfirm.dj")
		public ModelAndView managernoconfirm(HttpServletRequest request,PagingBean page){
			String pagecurrent = request.getParameter("currentPage");
			pagingAction input= null;
			
			int setting = 1;
			int currentPage = 0;
			int blockCount = 10;
			int blockPage = 10;
			int paging = 3;
			
			List list = sqlMap.queryForList("m_member", null);
			
			if(pagecurrent != null){
				currentPage = Integer.parseInt(pagecurrent);
			}else{currentPage = 1;}
			
			int totalCount = list.size();
			String pagingHtml  = page.getPage(currentPage, totalCount, blockCount, blockPage, input, paging);
			List pagelist = page.getList(currentPage, totalCount, blockCount, blockPage, input, list, paging);
			
			mv.addObject("pagingHtml",pagingHtml);
			mv.addObject("setting",setting);
			mv.addObject("list",pagelist);
			mv.setViewName("/manager/manager_noconfirm.jsp");
			return mv;
		}
		
		//일반회원 검색
		@RequestMapping("/noconfirm_search.dj")
		public ModelAndView noconfirm_search(HttpServletRequest request,String noconfirm,String search){
			String pagecurrent = request.getParameter("currentPage");
			
			int setting = 2;
			int currentPage = 1;
			int blockCount = 10;
			int blockPage = 10;
			String pagingHtml;
			
			Map map = new HashMap();
			map.put("noconfirm", noconfirm);
			//noconfirm을  받아서 noconfirm이름으로 map에 저장
			map.put("search", search);
			
			List list = sqlMap.queryForList("noconfirm_search", map);
			//map을 가지고 sql문을  수행하여 나온결과를 list에 저장  
			if(pagecurrent != null){
				currentPage = Integer.parseInt(pagecurrent);
			}else{ currentPage = 1;}
			int totalCount = list.size();
			
			SearchPagingA page = new SearchPagingA(currentPage, totalCount, blockCount, blockPage, noconfirm, search);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			list = list.subList(page.getStartCount(), lastCount);
						
			mv.addObject("pagingHtml",pagingHtml);
			mv.addObject("setting",setting);
			mv.addObject("list",list);
			mv.setViewName("/manager/manager_noconfirm.jsp");
			return mv;
		}
	
}
