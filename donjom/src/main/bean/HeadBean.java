package main.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;

import point.bean.PointDto;
import sign.bean.memberDto;

@Controller
public class HeadBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	public HeadDto headcall(HttpSession session,SqlMapClientTemplate sqlMap){
		HeadDto hd = new HeadDto();
		long total = 0;
		
		String email = (String)session.getAttribute("memId");
	
		int no = (Integer)sqlMap.queryForObject("getno", email);
			
	 	memberDto dto = (memberDto)sqlMap.queryForObject("getoneInfo", email);

	 	PointDto pointdto = (PointDto)sqlMap.queryForObject("get_total", no);
	 	
	 	total = pointdto.getTotal_ch() - pointdto.getTotal_re();
	
	 	hd.setTotal(total);
	 	hd.setJoin(dto.getJoin());
	 	hd.setNickname(dto.getNickname());
	 	hd.setProfile(dto.getProfile());
	 	hd.setEmail(email);

		return hd;
	}
	
}
