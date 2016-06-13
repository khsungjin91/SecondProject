package manager.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.bean.InvestDto;
import product.bean.RegisterDto;
import result.bean.PagingBean;
import setting.bean.pagingAction;

@Controller
public class ManagerRemittanceBean {

	
		@Autowired
		private SqlMapClientTemplate sqlMap;
		@Autowired
		private ModelAndView mv;
		
		
		//송금 안한 상품 
		@RequestMapping("/manager_remittance.dj")
		public ModelAndView Remittance(HttpServletRequest request,InvestDto dto){
			PagingBean page = new PagingBean();
			pagingAction input = null;
			String pagecurrent = request.getParameter("currentPage");
			int paging = 6;
			int currentPage = 0;
			int totalCount = 0;
			int blockCount = 10;
			int blockPage = 10;
			
			List investlist = sqlMap.queryForList("result.remmitance_before", null);
			
			if(pagecurrent != null){
				currentPage = Integer.parseInt(pagecurrent);
			}else{
				currentPage = 1;
			}
		
			totalCount = investlist.size();
			
			String pagingHtml  = page.getPage(currentPage, totalCount, blockCount, blockPage, input, paging);
			List list = page.getList(currentPage, totalCount, blockCount, blockPage, input, investlist, paging);
			
			mv.addObject("list", list);
			mv.addObject("pagingHtml", pagingHtml);
			mv.setViewName("/managerprice/manager_remittance.jsp");
			return mv;
		}
		
		//송금한 상품 보기
		
		@RequestMapping("/manager_remittanced.dj")
		public ModelAndView Remittanced(HttpServletRequest request,InvestDto dto,String pagecurrent){
			PagingBean page = new PagingBean();
			pagingAction input = null;
			int paging = 7;
			int currentPage = 0;
			int totalCount = 0;
			int blockCount =10;
			int blockPage = 10;
			
			List remittancelist = sqlMap.queryForList("result.remmitance_after", null);
			
			if(pagecurrent != null){
				currentPage = Integer.parseInt(pagecurrent);
			}else{
				currentPage = 1;
			}
			
			totalCount = remittancelist.size();
			
			String pagingHtml  = page.getPage(currentPage, totalCount, blockCount, blockPage, input, paging);
			List list = page.getList(currentPage, totalCount, blockCount, blockPage, input, remittancelist, paging);
			
			mv.addObject("listrt", list);
			mv.addObject("pagingHtmled", pagingHtml);
			mv.setViewName("/managerprice/manager_remittanced.jsp");
			return mv;
		}
		
		
		//송금 미리보기
		@RequestMapping("/Money_check.dj")
		public ModelAndView MoneyCheck(String p_code,RegisterDto dto){		
			
			List list = sqlMap.queryForList("money_check", p_code);
			
			dto.setP_code(p_code);
			
			dto = (RegisterDto)sqlMap.queryForObject("productone",dto);
			
			mv.addObject("dto", dto);
			mv.addObject("list",list);
			mv.setViewName("/managerprice/Money_check.jsp");
			return mv;
		}
		
		//송금하기
		@RequestMapping("/send_loanmoney.dj")
		public ModelAndView SendMoney(String p_code){
			sqlMap.update("send_refunds_i", p_code);
			sqlMap.update("send_refunds_p", p_code);
			mv.setViewName("/managerprice/send_loanmoney.jsp");
			return mv;
		}
}
