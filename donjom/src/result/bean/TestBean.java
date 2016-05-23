package result.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/manager_investmn2.dj")
	public ModelAndView managerinvestmn(){
		int count  = (Integer)sqlMap.queryForObject("result.investcount", null);
		String [] category = new String[count];
		String [] y = {"8","9","6","10.5"};
		int p = 0;
		int c = 0;
		int b = 0;	
		int m = 0;
		String p_code = "";
		
		List list = sqlMap.queryForList("result.investmanager", null);
		
		for(int i = 0; i<count ; i++){
		
			p_code = (String) list.get(i);
				
			String [] x = p_code.split("-");
				
			category[i] = x[1];
			
			if(category[i].equals("B")){
				b += category[i].indexOf("B")+1;
			}
			if(category[i].equals("R")){
				c += category[i].indexOf("R")+1;
			}
			
		}
		System.out.println(b);
		System.out.println(c);
		mv.addObject("y", y);
		mv.addObject("p", p);
		mv.addObject("b", b);
		mv.addObject("c", c);
		mv.addObject("m", m);
		mv.setViewName("/manager/manager_investmn.jsp");
		return mv;
	}

}
