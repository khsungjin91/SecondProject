package result.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.bean.InvestDto;

@Controller
public class TestBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/manager_investmn2.dj")
	public ModelAndView managerinvestmn(InvestDto dto){
		int count  = (Integer)sqlMap.queryForObject("result.investcount", null);
		String [] category = new String[count];
		String [] way ={"0","1"};
		int [] way_count = new int[way.length];
		int p = 0;
		int c = 0;
		int b = 0;	
		int r = 0;
		String p_code = "";
	
		List code_list = sqlMap.queryForList("result.investpcode", null);
		
		for(int i = 0; i<way.length ; i++){
		dto.setI_way(way[i]);
		way_count[i] = (int) sqlMap.queryForObject("result.investway", dto.getI_way());
		}
		
		for(int i = 0; i<count ; i++){
			p_code = (String) code_list.get(i);
			String [] x = p_code.split("-");
			category[i] = x[1];
			if(category[i].equals("B")){
				b += category[i].indexOf("B")+1;
			}
			if(category[i].equals("R")){
				r += category[i].indexOf("R")+1;
			}
			if(category[i].equals("P")){
				p += category[i].indexOf("P")+1;
			}
			if(category[i].equals("C")){
				c += category[i].indexOf("C")+1;
			}
		}

		mv.addObject("wayfull", way_count[0]);
		mv.addObject("waysplit", way_count[1]);
		mv.addObject("p", p);
		mv.addObject("b", b);
		mv.addObject("c", c);
		mv.addObject("r", r);
		mv.setViewName("/manager/manager_investmn.jsp");
		return mv;
	}


}
