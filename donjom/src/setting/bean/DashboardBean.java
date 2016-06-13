package setting.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import main.bean.HeadBean;
import main.bean.HeadDto;
import point.bean.PointDto;
import result.bean.MessageDto;
import sign.bean.memberDto;
import sign.bean.sessionDto;

@Controller
public class DashboardBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	private HeadBean hdbean = new HeadBean();
	private HeadDto hd = new HeadDto();
	
	@RequestMapping("/dashboard.dj")
	public ModelAndView Dashboard(HttpSession session,memberDto dto,SettingDto infodto, HttpServletRequest request, PointDto pdto){
		int count = 0;
		long total = 0;
		
		String email = (String)session.getAttribute("memId");
		
		if(session.getAttribute("memId") != null){
		int no = (Integer)sqlMap.queryForObject("getno", email);
		List list = sqlMap.queryForList("result.getmessage", no);
		count = list.size();
		
		infodto = (SettingDto)sqlMap.queryForObject("getmemberInfo", no);
		pdto = (PointDto)sqlMap.queryForObject("get_total", no);
				
		total = pdto.getTotal_ch() - pdto.getTotal_re();
		
		hd = hdbean.headcall(session,sqlMap);
		mv.addObject("hd", hd);
		mv.addObject("infodto", infodto);
		mv.addObject("list", list);
		
		}
		
		dto = (memberDto)sqlMap.queryForObject("getoneInfo", email);
		
		mv.addObject("total",total);
		mv.addObject("count",count);
		mv.addObject("dto", dto);
		mv.setViewName("/profile/dashboard.jsp");
		return mv;
	}
	
}
