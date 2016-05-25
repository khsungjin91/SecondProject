package result.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		//나이계산용
		SimpleDateFormat format =  new SimpleDateFormat("yyyy");
		//투자 전체 count
		int count  = (Integer)sqlMap.queryForObject("result.investcount", null);	
		String [] category = new String[count];
		//투자 방법 0,1로 구분 
		String [] way ={"0","1"};
		//투자 방법 배열 2개 생성
		int [] way_count = new int[way.length];
		
		int p = 0;	int c = 0;	int b = 0;	int r = 0;
		String p_code = "";
	
		List code_list = sqlMap.queryForList("result.investpcode", null);
		List age_list = sqlMap.queryForList("result.investage", null);
		List gender_list = sqlMap.queryForList("result.investgender", null);
		
		String [] birth = new String[age_list.size()];
		String [] gender = new String[gender_list.size()];
		String [] genderation = new String[gender_list.size()]; 
		int [] age = new int[age_list.size()];
		int noadult = 0;
		int twenty = 0;
		int thirty = 0;
		int forty = 0;
		int fifty = 0;
		int sixty = 0;
		int eighty = 0;
		Date now = new Date();
		String year = format.format(now);
	
		//age
		for(int i = 0; i<age_list.size(); i++){
			birth[i] = (String) age_list.get(i);
			String [] y = birth[i].split("");
			String sum = y[0]+y[1]+y[2]+y[3];
			age[i] = Integer.parseInt(year) - Integer.parseInt(sum)+1;
			
			
			if(age[i] >= 0 && age[i] < 20){ noadult += 1 ;}
			else if(age[i] >= 20 && age[i] < 30){ twenty += 1 ;}
			else if(age[i] >= 30 && age[i] < 40){thirty += 1;}
			else if(age[i] >= 40 && age[i] < 50){forty += 1;}
			else if(age[i] >= 50 && age[i] < 60){fifty += 1;}
			else if(age[i] >= 60 && age[i] < 70){sixty += 1;}
			else if(age[i] >= 70){eighty += age[i];}
		}
		
		//way
		for(int i = 0; i<way.length ; i++){
		dto.setI_way(way[i]);
		// 0 과 1 번 각각의 투자 방법의 count를 가져온다.
		way_count[i] = (int) sqlMap.queryForObject("result.investway", dto.getI_way());
		}
		
		//category
		for(int i = 0; i<count ; i++){
			p_code = (String) code_list.get(i);
			String [] x = p_code.split("-");
			category[i] = x[1];
			if(category[i].equals("B"))	{b += category[i].indexOf("B")+1;}
			if(category[i].equals("R"))	{r += category[i].indexOf("R")+1;}
			if(category[i].equals("P"))	{p += category[i].indexOf("P")+1;}
			if(category[i].equals("C"))	{c += category[i].indexOf("C")+1;}
		}
		
		mv.addObject("count", count);
		mv.addObject("noadult",noadult);
		mv.addObject("twenty",twenty);
		mv.addObject("thirty",thirty);
		mv.addObject("forty",forty);
		mv.addObject("fifty",fifty);
		mv.addObject("sixty",sixty);
		mv.addObject("seventy",eighty);
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
