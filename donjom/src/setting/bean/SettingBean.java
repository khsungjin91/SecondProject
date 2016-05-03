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
	
	
	
	@RequestMapping("signup_modifyPro.dj")
	public ModelAndView settingPro(String pw,String newpw,HttpSession session,memberDto ModiDto,MultipartHttpServletRequest request)
		throws Exception{
		
		String email = (String)session.getAttribute("memId");
		String mempw = (String)sqlMap.queryForObject("findPw", email);
		
		MultipartFile mf = request.getFile("save");
		String orgName  = mf.getOriginalFilename();
		
		if(orgName.equals("")){
			
			}else{

				File copy = new File("E:\\save\\" + orgName);
				mf.transferTo(copy);
				ModiDto.setProfile(orgName);
			}
	
		int setting = 0;
		
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
