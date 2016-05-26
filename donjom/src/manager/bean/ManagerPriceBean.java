package manager.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.bean.InvestDto;

@Controller
public class ManagerPriceBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/manager_remittance.dj")
	public ModelAndView Remittance(InvestDto dto){
		
		List investlist = sqlMap.queryForList("result.manager_p", null);
		
		
		mv.addObject("list", investlist);
		mv.setViewName("/managerprice/manager_remittance.jsp");
		return mv;
	}
	
}
