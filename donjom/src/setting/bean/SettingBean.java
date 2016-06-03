package setting.bean;


import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import sign.bean.memberDto;


@Controller
public class SettingBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("setting.dj")
	public ModelAndView settingForm(HttpSession session,memberDto getDto){
		
	String email = (String)session.getAttribute("memId");
		
	getDto = (memberDto)sqlMap.queryForObject("getoneInfo", email);
		
		mv.addObject("dto",getDto);
		mv.setViewName("/profile/setting.jsp");
		return mv;
	}
	
	@RequestMapping("/upProfile.dj")
	public ModelAndView profileup(MultipartHttpServletRequest request,HttpSession session,memberDto dto)throws Exception{
		int setting = 0;
		MultipartFile mf = null;
		
		String email = (String)session.getAttribute("memId");
		
		mf = request.getFile("save");
		
		String orgname = mf.getOriginalFilename();
		
		System.out.println(orgname);
		
		dto.setEmail(email);
		dto.setProfile(orgname);
		
		sqlMap.update("modifyprofile", dto);
		
		String path = request.getServletContext().getRealPath("")+"//save//";
		
		File copy = new File(path + orgname);
		
		mf.transferTo(copy);
		
		mv.addObject("setting", setting);
		mv.setViewName("/signup/signup_modifyPro.jsp");
		return mv;
	}
	
	
	
	@RequestMapping("signup_modifyPro.dj")
	public ModelAndView settingPro(String pw,String newpw,HttpSession session,memberDto ModiDto)
		throws Exception{
		
		String email = (String)session.getAttribute("memId");
		String mempw = (String)sqlMap.queryForObject("findPw", email);
		int no = (Integer)sqlMap.queryForObject("getno", email);
	
		int setting = 0; // signup_modifiPro 경로
		int x = 1; //singError 경로표시
	
		if(pw.equals(mempw)){			
			
			ModiDto.setEmail(email);		
			
			if(newpw.equals("")){
				
			sqlMap.update("modifyInfo", ModiDto);
			
			}else{
				
			ModiDto.setPw(newpw);
			
			sqlMap.update("modifyInfo", ModiDto);	
			
			}			
			
			mv.addObject("setting", setting);
			mv.setViewName("/signup/signup_modifyPro.jsp");
			
		}else{
			
			mv.addObject("x", x);
			mv.setViewName("/user/signError.jsp");
		}
		
		return mv;
	}
	
	
	@RequestMapping("/signup_modifyPro2.dj")
	public ModelAndView singUpModifyPro2(memberDto ModiDto,HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		int setting = 0;
		
		ModiDto.setEmail(email);
		sqlMap.update("modifyInfo2", ModiDto);
		
		mv.addObject("setting", setting);
		mv.setViewName("/signup/signup_modifyPro.jsp");
		return mv;
	}


}
