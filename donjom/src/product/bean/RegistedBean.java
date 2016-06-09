package product.bean;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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

import time.bean.TimeFormat;

@Controller
public class RegistedBean {

	@Autowired
	SqlMapClientTemplate sqlMap;
	@Autowired
	ModelAndView mv;
	
	
	@RequestMapping("/fundView.dj")
	public ModelAndView productview(String p_code,RegisterDto dto, HttpSession session)throws Exception{
		TimeFormat time = new TimeFormat();
		FailBean fail = new FailBean();
		Map map = new HashMap();
		String email = (String)session.getAttribute("memId");
		// ���� �ݾ� �ѵ� ������ ���� ����� �ʱ�ȭ
		int check = 0;
		int limit = 0;
		int limit2= 0;
		
		// �α��������� ����
		if(session.getAttribute("memId") != null){
		int no = (Integer)sqlMap.queryForObject("getno", email);
		
		map.put("no", no);
		map.put("p_code", p_code);
		
		check = (Integer)sqlMap.queryForObject("result.investcheck", map);
		mv.addObject("no",no);
		}	
		//product 1���� �����ش�.
		dto = (RegisterDto)sqlMap.queryForObject("productone", dto);
		
		List contentlist = sqlMap.queryForList("contentlist", p_code);
		List filelist = sqlMap.queryForList("filelist", p_code);
		
		// �ִ� ���� �ݾ��� ����� / 5
		limit = Integer.parseInt(dto.getP_price())/5;
		// ���� �ݾ��� �ִ� ���� �ݾ׺��� ������ limit2 �� �޴´�
		limit2 = Integer.parseInt(dto.getP_price()) - Integer.parseInt(dto.getP_invest());
	
		if(limit > limit2){
			limit = limit2;
		}
		// Ÿ�̸� 
		Map When = time.Time();
		
		mv.addObject("When",When);
		mv.addObject("limit", limit);
		mv.addObject("check", check);
		mv.addObject("dto",dto);
		mv.addObject("contentlist",contentlist);
		mv.addObject("filelist",filelist);
		mv.setViewName("/product/fund_view.jsp");
		return mv;
	}
	
}
