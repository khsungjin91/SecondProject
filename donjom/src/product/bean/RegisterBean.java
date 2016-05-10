package product.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/product_register.dj")
	public ModelAndView RegisterWrite(int no, String br_object,BorrowDto dto){
		Map map = new HashMap();
		
		map.put("no", no);
		map.put("br_object", br_object);
		
		dto = (BorrowDto)sqlMap.queryForObject("registerReady", map);
		
		mv.addObject("dto", dto);
		mv.setViewName("/product/fund_register.jsp");
		return mv;
	}
	
	
	
	@RequestMapping("/registerPro.dj")
	public ModelAndView RegisterPro(HttpServletRequest request,String [] content,RegisterDto dto){
		String p_content = "";
		String p_code = "";
		String m_code = "";
		String count = "";
		String upcount = "";
		String str ="";
		String br_category = request.getParameter("br_category");
		int indexno = Integer.parseInt(request.getParameter("indexno"));
		
		Date day = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yy");
		
		switch (br_category) {
		case "사업자":
			m_code = "B";
			break;
		case "부동산":
			m_code = "R";
			break;
		case "개인신용":
			m_code = "P";
			break;
		case "매출담보":
			m_code = "C";
			break;
			
		default:
			break;
		}
		
		count = (String)sqlMap.queryForObject("countborrow", null);
		
		if(count.length() == 1){	
			str = upcount.replace(count, "0000"+count);
		}else if(count.length() == 2){
			str = upcount.replace(count, "000"+count);
		}else if(count.length() == 3){
			str = upcount.replace(count, "00"+count);
		}else if(count.length() == 4){
			str = upcount.replace(count, "0"+count);
		}else if(count.length() == 5){
			str = count;
		}
		
		System.out.println(str);
		
		p_code = date.format(day)+"-"+m_code+"-"+str;
	
		System.out.println(p_code);
		
		dto.setP_code(p_code);
		
		for(int i = 0 ; i<=indexno ; i++){
			p_content = request.getParameter("content["+i+"]");
			dto.setP_content(p_content);
			sqlMap.insert("inputcontent", dto);
		}
		
		mv.setViewName("/product/fundManager.jsp");
		return mv;
	}

}
