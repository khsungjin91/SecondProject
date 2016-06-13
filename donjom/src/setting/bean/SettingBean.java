package setting.bean;


import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import main.bean.HeadBean;
import main.bean.HeadDto;
import sign.bean.memberDto;


@Controller
public class SettingBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	private HeadBean hdbean = new HeadBean();
	private HeadDto hd = new HeadDto();
	
	@RequestMapping("/setting.dj")
	public ModelAndView settingForm(HttpSession session,memberDto getDto,HttpServletRequest request){
	String email = (String)session.getAttribute("memId");
		
	getDto = (memberDto)sqlMap.queryForObject("getoneInfo", email);
	
	try {
		request.setCharacterEncoding("euc-kr");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	hd = hdbean.headcall(session,sqlMap);
	
		mv.addObject("hd", hd);
		mv.addObject("dto",getDto);
		mv.setViewName("/profile/setting.jsp");
		return mv;
	}

	
	@RequestMapping("/signup_modifyPro.dj")
	public ModelAndView settingPro(MultipartHttpServletRequest request,String pw,String newpw,HttpSession session,memberDto ModiDto)
		throws Exception{
		
		MultipartFile mf = null;
		int setting = 0; // signup_modifiPro 경로
		int x = 1; //singError 경로표시
		String email = (String)session.getAttribute("memId");
		String mempw = (String)sqlMap.queryForObject("findPw", email);
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		mf = request.getFile("save");
		
		String orgname = mf.getOriginalFilename();
		
		if(orgname.equals("")){}else{
		ModiDto.setEmail(email);
		ModiDto.setProfile(no + orgname);
		
		sqlMap.update("modifyprofile", ModiDto);
		
		String path = request.getServletContext().getRealPath("")+"//save//";
		
		File copy = new File(path + no +orgname );
		
		mf.transferTo(copy);
		}
	
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
	
	
	@RequestMapping("/deleteimg.dj")
	public ModelAndView delete(HttpSession session,String profile){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
	
		File f = new File(profile);
		f.delete();
	
		sqlMap.update("deleteimg", no);
		
		mv.setViewName("/profile/deleteimg.jsp");
		return mv;
	}

	/*upload jquery 실패
	 * 
	 * @RequestMapping("/upload.dj")
	public ModelAndView profileup(MultipartHttpServletRequest request,HttpSession session,memberDto dto)throws Exception{
		System.out.println("1");
		int setting = 0;
		MultipartFile mf = null;
		
		String email = (String)session.getAttribute("memId");
		
		mf = request.getFile("save");
		
		String orgname = mf.getOriginalFilename();
		
		dto.setEmail(email);
		dto.setProfile(orgname);
		
		sqlMap.update("modifyprofile", dto);
		
		String path = request.getServletContext().getRealPath("")+"//save//";
		
		File copy = new File(path + orgname);
		
		mf.transferTo(copy);
		
		mv.addObject("setting", setting);
		mv.setViewName("/signup/signup_modifyPro.jsp");
		return mv;
	}*/


}
