package board.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import help.bean.helpDTO;

@Controller
public class infoboard {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/inforboard.dj")
	public ModelAndView inforboard(HttpServletRequest request){
				
		List list = sqlMap.queryForList("infoList", null);
		
		mv.addObject("list",list);
		mv.setViewName("board/infoboard.jsp");
		return mv;
	}
	
	@RequestMapping("/info_view.dj")
	public ModelAndView inforView (infoDto indto, int no){
		indto = (infoDto)sqlMap.queryForObject("inforview", no);
		mv.addObject("indto",indto);
		mv.setViewName("board/infor_modify.jsp");
		return mv;
	}
	
	@RequestMapping("infor_modifyPro.dj")
	public ModelAndView informodifyPro(infoDto indto, int no){
		indto.setI_num(no);
		sqlMap.update("inforupdate", indto);
		mv.setViewName("/inforboard.dj");
		return mv;
		}
	
	@RequestMapping("/inforForm.dj")
	public ModelAndView inforForm(){
		mv.setViewName("board/infor_writeForm.jsp");
		return mv;
	}
	
	@RequestMapping("/inforPro.dj")
	public ModelAndView inforFormPro(infoDto indto){
		
		sqlMap.insert("inforwritePro", indto);
		mv.setViewName("inforboard.dj");
		return mv;
	}
	

	

}
