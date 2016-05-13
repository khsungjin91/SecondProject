package manager.bean;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.bean.BorrowDto;


@Controller
public class ManagerBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/manager_main.dj")
	public ModelAndView managermain(){
		mv.setViewName("/manager/manager_main.jsp");
		return mv;
	}
	//회원관리
	@RequestMapping("/manager_member.dj")
	public String managermember(){
		return "/manager/manager_member.jsp";
	}
	//인증회원
	@RequestMapping("/manager_confirm.dj")
	public ModelAndView managerconfirm(){
		int setting=1;
		List list = sqlMap.queryForList("m_memberInfo",null);
		mv.addObject("setting",setting);
		mv.addObject("list", list);
		mv.setViewName("/manager/manager_confirm.jsp");
		return mv;
	}
	@RequestMapping("/confirm_search.dj")
	public ModelAndView confirm_search(String confirm,String search){
		int setting=2;
		Map map = new HashMap();
		map.put("confirm", confirm);
		map.put("search", search);
		List list=sqlMap.queryForList("confirm_search",map);
		System.out.println(list.size()+"save");
		int x=list.size();
		mv.addObject("x" ,x);
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_confirm.jsp");
		return mv;
	}
	
	//인증회원 상세페이지
	@RequestMapping("/manager_view.dj")
	public ModelAndView managerview(){
		mv.setViewName("/manager/manager_view.jsp");
		return mv;
	}
	
	//일반회원
	@RequestMapping("/manager_noconfirm.dj")
	public ModelAndView managernoconfirm(){
		int setting = 1;
		List list = sqlMap.queryForList("m_member", null);
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_noconfirm.jsp");
		return mv;
	}
	
	@RequestMapping("/noconfirm_search.dj")
	public ModelAndView noconfirm_search(String noconfirm,String search){
		int setting = 2;
		Map map = new HashMap();
		map.put("noconfirm", noconfirm);
		//noconfirm을  받아서 noconfirm이름으로 map에 저장
		map.put("search", search);
		List list = sqlMap.queryForList("noconfirm_search", map);
		//map을 가지고 sql문을  수행하여 나온결과를 list에 저장  
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_noconfirm.jsp");
		return mv;
	}
	//상세페이지 - 투자
	@RequestMapping("/manager_invest.dj")
	public ModelAndView managerinvest(){
		System.out.println("invest");
		mv.setViewName("/manager/manager_view.jsp");
		return mv;
	}
	//상세페이지 - 대출 
	@RequestMapping("/manager_borrow.dj")
	public ModelAndView managerborrow(){
		System.out.println("borrow");
		mv.setViewName("/manager/manager_borrow.jsp");
		return mv;
	}
	//투자
	@RequestMapping("/manager_investmn.dj")
	public ModelAndView managerinvestmn(){
		mv.setViewName("/manager/manager_investmn.jsp");
		return mv;
	}
	
	//대출
	@RequestMapping("/manager_borrowmn.dj")
	public ModelAndView managerborrowmn(){
		List list =sqlMap.queryForList("borrowmn", null);
		
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_borrowmn.jsp");
		return mv;
	}
	
	//성진이가 한것입니다.
	@RequestMapping("/manager_borrowlist.dj")
	public ModelAndView managerborrowlist(){
		List list = sqlMap.queryForList("borrowlist", null);
		int count = list.size();
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.setViewName("/manager/manager_borrowlist.jsp");
		return mv;
	}
	
	//대출심사 
	@RequestMapping("/manager_evaluation.dj")
	public ModelAndView managerevaluation(){
		List list= sqlMap.queryForList("evaluation", null);
		int count = list.size();
		
		mv.addObject("count",count);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_evaluation.jsp");
		return mv;
	}
	//심사-찾기 
	@RequestMapping("/manager_evaluation_search.dj")
	public ModelAndView managerevaluationsearch(){
		
		mv.setViewName("/manager/manager_evaluation.jsp");
		return mv;
	}
	//심사평작성
	
	@RequestMapping("/manager_evaluation_write.dj")
	public ModelAndView managerevaluationwrite(BorrowDto dto,int no){
		dto=(BorrowDto)sqlMap.queryForObject("borrow", no);
	
		mv.addObject("dto",dto);
		mv.setViewName("/manager/manager_evaluation_write.jsp");
		return mv;
	}
	//심사평 insert
	@RequestMapping("/manager_evaluation_writeinsert.dj")
	public ModelAndView managerevaluationwriteinsert(evaluationDto dto,BorrowDto dto2){
		sqlMap.insert("evaluation_writeinsert",dto);
		sqlMap.update("borrowup",dto2);
		
		mv.setViewName("/manager/manager_evaluation_writesc.jsp");
		return mv;
	}
	
}
