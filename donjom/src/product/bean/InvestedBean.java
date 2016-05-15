package product.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import setting.bean.SettingDto;

@Controller
public class InvestedBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired  
	private ModelAndView mv;
	
	@RequestMapping("/invest_start.dj")
	public ModelAndView invested(HttpSession session,SettingDto meminfodto,InvestDto investdto,RegisterDto registerDto){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		
		meminfodto = (SettingDto)sqlMap.queryForObject("getmemberInfo", no);
		
		investdto.setI_memname(meminfodto.getName());
		investdto.setI_memno(meminfodto.getNo());
		
		registerDto.setP_code(investdto.getI_pcode());
		registerDto = (RegisterDto)sqlMap.queryForObject("productone", registerDto);
		
		investdto.setI_way(registerDto.getP_way());
		investdto.setI_times(registerDto.getP_term());
		investdto.setI_profit(registerDto.getP_rate());
		investdto.setI_repayday(registerDto.getP_repayday());
	
		sqlMap.insert("investstart", investdto);
		
		mv.setViewName("/product/fund_view.jsp");
		return mv;
	}
	
}
