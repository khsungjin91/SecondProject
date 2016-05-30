package setting.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import setting.bean.pagingAction;
import result.bean.PagingBean;
import sign.bean.memberDto;

@Controller
public class SettingCertBean {

		@Autowired
		SqlMapClientTemplate sqlMap;
		@Autowired
		ModelAndView mv;
		
		@RequestMapping("/setting_cert_person.dj")
		public ModelAndView personCertView(HttpSession session,SettingDto dto,memberDto memdto){
			
			String email = (String)session.getAttribute("memId");
			
			if(session.getAttribute("memId") != null){
			int no = (Integer)sqlMap.queryForObject("getno", email);
			dto = (SettingDto)sqlMap.queryForObject("getoneCert", no);
			memdto = (memberDto)sqlMap.queryForObject("getoneInfo", email);
			mv.addObject("no", no);
			}
			
			mv.addObject("memdto", memdto);
			mv.addObject("dto", dto);
			mv.setViewName("/profile/setting_cert_person.jsp");
			return mv;
		}
		
		@RequestMapping("/setting_cert_pro.dj")
		public ModelAndView personCertPro(SettingDto certDto,HttpSession session){
			int setting = 1;
			String last = "";

			String email = (String)session.getAttribute("memId");
			
			int no = (Integer)sqlMap.queryForObject("getno", email);
			
			switch (certDto.getBankcode()) {
			case "신한은행":
				last = "088"; 
				break;
			case "우리은행":
				last = "020"; 
				break;
			case "농협은행":
				last = "011"; 
				break;
			case "기업은행":
				last = "003"; 
				break;
			case "국민은행":
				last = "004"; 
				break;
			case "하나은행":
				last = "081"; 
				break;

			default:
				break;
			}
			
			int [] bankcode = {0,0,0,0,0,0,0,0,0,0,0};
			
			for(int i = 0; i<11 ; i++){		
				bankcode[i] = (int)(Math.random()*10);		
			}
			
			String randomcode = bankcode[0] +""+ bankcode[1] +""+ bankcode[2] +"-"+ bankcode[3] +""+ bankcode[4]
					+""+ bankcode[5] +""+ bankcode[6] +""+ bankcode[7] +""+ bankcode[8] +"-"+ bankcode[9] 
							+""+ bankcode[10] +"-"+last;
			certDto.setNo(no);
			certDto.setRandomacc(randomcode);
			
			sqlMap.insert("certinput", certDto);
			
			mv.addObject("setting", setting);
			mv.setViewName("/signup/signup_modifyPro.jsp");
			return mv;
		}
		
		
		@RequestMapping("/setting_detail_pro.dj")
		public ModelAndView personDetailPro(SettingDto dtDto,HttpSession session){
			int setting = 1;
			
			String email = (String)session.getAttribute("memId");
			int no = (Integer)sqlMap.queryForObject("getno", email);
			
			dtDto.setNo(no);
			
			sqlMap.update("detailinput", dtDto);
			
			mv.addObject("setting", setting);
			mv.setViewName("/signup/signup_modifyPro.jsp");
			return mv;
		}
		
		@RequestMapping("/setting_session_history.dj")
		public ModelAndView sessionChaser(HttpSession session,PagingBean page,HttpServletRequest request){
			int paging = 0;
			String email = (String)session.getAttribute("memId");
			
			String pagecurrent = request.getParameter("currentPage");
			
			List list = null;
			pagingAction input = null;
			String pagingHtml;
			int totalCount = 0;
			int currentPage = 0;
			int blockCount = 10;
			int blockPage = 10;
			
			if(pagecurrent != null){
				
				currentPage = Integer.parseInt(pagecurrent);
			}else{
				
				currentPage = 1;
			}
	
			if(session.getAttribute("memId") != null){
			int no = (Integer)sqlMap.queryForObject("getno", email);
			list = sqlMap.queryForList("getsession", no);
			totalCount = list.size();
			}
			
			pagingHtml = page.getPage(currentPage, totalCount, blockCount, blockPage, input,paging);
			list = page.getList(currentPage, totalCount, blockCount, blockPage, input, list,paging);
			
			mv.addObject("session", list);
			mv.addObject("pagingHtml", pagingHtml);
			mv.setViewName("/profile/setting_session_history.jsp");
			return mv;
		}
		
		
}
