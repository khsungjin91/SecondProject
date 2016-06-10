package board.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class infoboard {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/inforboard.dj")
	public ModelAndView infoboard(){
		List list = sqlMap.queryForList("infoList", null);
		mv.addObject("list",list);
		mv.setViewName("board/infoboard.jsp");
		return mv;
	}
	
	@RequestMapping("/inforForm.dj")
	public String inforForm(){
		return "/board/infor_writeForm.jsp";
	}
	
	@RequestMapping("/infor_writePro.dj")
	public ModelAndView infor_writePro(infoDto infoDto){
		sqlMap.insert("inforwritePro", infoDto);
		mv.setViewName("/infor.dj");		
		return mv;
	}
	
	@RequestMapping("infor_view.dj")
	public ModelAndView inforView(infoDto infoDto, int no){
		infoDto = (infoDto)sqlMap.queryForObject("inforview", no);
		mv.addObject("nodto",infoDto);
		mv.setViewName("/board/infor_view.jsp");
		return mv;
		
	}
	
	@RequestMapping("infor_modify.dj")
	public ModelAndView inforModify(infoDto infoDto, int no){
		infoDto = (infoDto)sqlMap.queryForObject("inforview", no);
		mv.addObject("nodto",infoDto);
		mv.setViewName("/board/infor_modify.jsp");
		return mv;
		
	}
	
	@RequestMapping("infor_modifyPro.dj")
	public ModelAndView inforPro(infoDto infoDto, int no){
		infoDto.setI_num(no);
		sqlMap.update("inforupdate", infoDto);
		mv.setViewName("/infor_view.dj");
		return mv;
		}
	
	@RequestMapping("infor_delete.dj")
	public ModelAndView inforDelete(infoDto infoDto, int no){
		infoDto.setI_num(no);
		sqlMap.update("deleteinfor", infoDto);
		mv.setViewName("infor.dj");
		return mv;

	}

	

}
