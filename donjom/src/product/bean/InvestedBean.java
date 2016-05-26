package product.bean;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import result.bean.MessageBean;
import result.bean.MessageDto;
import setting.bean.SettingDto;

@Controller
public class InvestedBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired  
	private ModelAndView mv;
	
	@RequestMapping("/invest_start.dj")
	public ModelAndView invested(HttpSession session,SettingDto meminfodto,InvestDto investdto,
			RegisterDto registerDto,MessageDto dto){
		MessageBean msm = new MessageBean();
		
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
		
		msm.investMessageGo(investdto,dto,sqlMap);
		
		sqlMap.insert("investstart", investdto);
		sqlMap.update("updateinvest", investdto);
		
		registerDto.setP_code(investdto.getI_pcode());
		registerDto = (RegisterDto)sqlMap.queryForObject("productone", registerDto);
		
		if(Integer.parseInt(registerDto.getP_price()) == 
				Integer.parseInt(registerDto.getP_invest())){
			 
			registerDto.setP_success("success");
			//펀드가 성공한경우 투자자들과 상품에 성공알림을 보낸다.
			sqlMap.update("result.completefund", registerDto);
			sqlMap.update("result.completeinvest", registerDto);
			
		}
		//무조건 맨밑에 있어야함
		investdto.setI_invest(investdto.getI_invest()+"0000");
		sqlMap.update("input_invest", investdto);
		//
		
		mv.setViewName("/product/fund_investPro.jsp");
		return mv;
	}
	
	@RequestMapping("/invest_history.dj")
	public ModelAndView investhistory(HttpSession session){
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		List list = sqlMap.queryForList("result.in_history", no);
		
		mv.addObject("list",list);
		mv.setViewName("/profile/invest_history.jsp");
		return mv;
	}
	
}
