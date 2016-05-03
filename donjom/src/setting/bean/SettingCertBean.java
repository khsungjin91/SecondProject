package setting.bean;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SettingCertBean {

	
		@Autowired
		SqlMapClientTemplate sqlMap;
		@Autowired
		ModelAndView mv;
		
		@RequestMapping("/setting_cert_person.dj")
		public ModelAndView personCertView(HttpSession session,SettingDto dto){
			
			String email = (String)session.getAttribute("memId");
			
			int no = (Integer)sqlMap.queryForObject("getno", email);
			
			dto = (SettingDto)sqlMap.queryForObject("getoneCert", no);
			
			mv.addObject("dto", dto);
			mv.addObject("no", no);
			mv.setViewName("/profile/setting_cert_person.jsp");
			return mv;
		}
		
		@RequestMapping("/setting_cert_pro.dj")
		public ModelAndView personCertPro(SettingDto certDto){
			int setting = 1;
			
			sqlMap.insert("certinput", certDto);
			
			
			mv.addObject("setting", setting);
			mv.setViewName("/signup/signup_modifyPro.jsp");
			return mv;
		}
		
		
		@RequestMapping("/setting_detail_pro.dj")
		public ModelAndView personDetailPro(SettingDto dtDto){
			int setting = 1;
			
			sqlMap.update("detailinput", dtDto);
			
			mv.addObject("setting", setting);
			mv.setViewName("/signup/signup_modifyPro.jsp");
			return mv;
		}
		
		@RequestMapping("/setting_session_history.dj")
		public ModelAndView sessionChaser(HttpSession session){
			
			String email = (String)session.getAttribute("memId");
			int no = (Integer)sqlMap.queryForObject("getno", email);
			
			List list = sqlMap.queryForList("getsession", no);
		
			mv.addObject("session", list);
			mv.setViewName("/profile/setting_session_history.jsp");
			return mv;
		}
		
		
}
