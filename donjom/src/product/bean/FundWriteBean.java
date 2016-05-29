package product.bean;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import setting.bean.SettingDto;
import sign.bean.memberDto;

@Controller
public class FundWriteBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/loan_step1.dj")
	public ModelAndView write1(SettingDto settingdto,memberDto dto,HttpSession session){
		
		String email=(String)session.getAttribute("memId");
		if(session.getAttribute("memId") != null){
		
		settingdto = (SettingDto)sqlMap.queryForObject("getmemberInfo", dto.getNo());
		
		mv.addObject("sedto", settingdto);
		}
	int borrowcount  = (Integer)sqlMap.queryForObject("onlyoneborrow", dto.getNo());
		
	if(borrowcount != 0){
		mv.addObject("borrowcount", borrowcount);
		mv.setViewName("/product/fund_already.jsp");
	}else{
	
		mv.setViewName("/product/fund_writeForm.jsp");
	}
		return mv;
	}
	
	
	
	@RequestMapping("/loan_step2.dj")
	public ModelAndView write2(BorrowDto dto){

	
		mv.addObject("memname",dto.getMemname());
		mv.addObject("membirth",dto.getMembirth());
		mv.addObject("memphone",dto.getMemphone());
		mv.addObject("mememail",dto.getMememail());
		mv.addObject("br_sum", dto.getBr_sum());
		mv.addObject("br_way", dto.getBr_way());
		mv.addObject("br_term", dto.getBr_term());
		mv.setViewName("/product/fund_writeForm2.jsp");
		return mv;
	}
	
	@RequestMapping("/loan_writePro.dj")
	public ModelAndView writePro(HttpSession session,BorrowDto borrowDto,SettingDto dto){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		borrowDto.setMemno(no);

		sqlMap.insert("basicborrow", borrowDto);
		
		dto = (SettingDto)sqlMap.queryForObject("getmemberInfo",no);
		
		mv.addObject("dto", dto);
		mv.setViewName("/product/fund_writePro.jsp");
		return mv;
	}

	
	@RequestMapping("/fund_cancle.dj")
	public ModelAndView cancleBorrow(HttpSession session){
		Map map = new HashMap();
		
		String email=(String)session.getAttribute("memId");
		int memno = (Integer)sqlMap.queryForObject("getno", email);
		int no = (Integer)sqlMap.queryForObject("maxno", memno);
	
		map.put("memno", memno);
		map.put("no", no);
		
		sqlMap.delete("cancleborrow", map);
		
		mv.setViewName("/product/fund_cancle.jsp");
		return mv;
	}
	
	
}
