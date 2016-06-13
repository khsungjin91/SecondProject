package product.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import main.bean.HeadBean;
import main.bean.HeadDto;
import result.bean.MessageBean;
import result.bean.MessageDto;
import setting.bean.SettingDto;
import time.bean.ConsumeTime;

@Controller
public class InvestedBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired  
	private ModelAndView mv;

	@RequestMapping("/invest_start.dj")
	public ModelAndView invested(HttpSession session,SettingDto meminfodto,InvestDto investdto,
			RegisterDto registerDto)throws Exception{
		MessageBean msm = new MessageBean();
		ConsumeTime consume = new ConsumeTime();
		//메세지 경로
		int sns = 1; 
		
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
		
		msm.investMessageGo(investdto,sqlMap,sns);
		
		sqlMap.insert("investstart", investdto);
		sqlMap.update("updateinvest", investdto);
		
		registerDto.setP_code(investdto.getI_pcode());
		registerDto = (RegisterDto)sqlMap.queryForObject("productone", registerDto);
		
		//펀딩성공한경우
		if(Integer.parseInt(registerDto.getP_price()) == 
				Integer.parseInt(registerDto.getP_invest())){
			
			//소요시간 계산해서 DB에 넣는 객체생성
			String soyotume = consume.consumetime(registerDto);
			
			//펀딩성공의 경우 투자자들과 상품에 성공알림을 보내고 상품에 소요시간을 넣어준다.
			registerDto.setP_enddate(soyotume);
			registerDto.setP_success("success");
			sqlMap.update("result.completefund", registerDto);
			sqlMap.update("result.completeinvest", registerDto);
		}
		//무조건 맨밑에 있어야함
		investdto.setI_invest(investdto.getI_invest()+"0000");
		sqlMap.update("input_invest", investdto);
		
		mv.setViewName("/product/fund_investPro.jsp");
		return mv;
	}

	
	@RequestMapping("/fund_investcancle.dj")
	public ModelAndView investCancel(String code,InvestDto dto,HttpSession session){
		Map map = new HashMap();
		MessageBean message = new MessageBean();
		//메세지 경로
		int sns = 2;
		
		String email = (String)session.getAttribute("memId");
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		map.put("p_code", code);
		map.put("no", no);
		
		dto = (InvestDto)sqlMap.queryForObject("result.oneget_i", map);
		//투자금 형 변환
		String money = dto.getI_invest()+"0000";
		int invest =Integer.parseInt(money);
		
		map.put("invest", invest);

		//투자자에게 돈돌려주기
		sqlMap.update("returninvest", map);
		// 투자된 기록들 삭제
		sqlMap.update("update_p", dto);
		// 투자 삭제 메세지 발송
		message.investMessageGo(dto, sqlMap, sns);
		// 투자건 삭제
		sqlMap.delete("delete_i", map);
	
		mv.setViewName("/product/fund_investcancle.jsp");
		return mv;
	}
	
}
