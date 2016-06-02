package chart.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import manager.bean.Bar_ChartDto;
import product.bean.InvestDto;

@Controller
public class TestBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/manager_investmn2.dj")
	public ModelAndView managerinvestmn(InvestDto dto,Bar_ChartDto chartdto){

		//투자 전체 count
		int count  = (Integer)sqlMap.queryForObject("investcount", null);	
		String [] category = new String[count];
		//투자 방법 0,1로 구분 
		String [] way ={"0","1"};
		//투자 방법 배열 2개 생성
		int [] way_count = new int[2];
		int [] gender_count = new int[2];
		
		int p = 0;	int c = 0;	int b = 0;	int r = 0;
		String p_code = "";
	  
		List code_list = sqlMap.queryForList("investpcode", null);
		List l_birth = sqlMap.queryForList("investage", null);
		List l_gender = sqlMap.queryForList("investgender", null);
		
		SimpleDateFormat spf= new SimpleDateFormat("yyyy");
		Date date =new Date();
		System.out.println(date);
		String now = spf.format(date);
		System.out.println(now);
		
		String [] gender = new String[l_gender.size()];
		int m_noadult=0;	int m_twenty=0;
		int m_thirty=0;		int m_forty=0;
		int m_fifty=0;		int m_sixty=0;
		int m_eighty=0;	
		int w_noadult=0;	int w_twenty=0;
		int w_thirty=0;		int w_forty=0;
		int w_fifty=0;		int w_sixty=0;
		int w_eighty=0;
	
		//age

		for(int i =0;i<l_birth.size();i++){
			String[] birth=((String) l_birth.get(i)).split("");
			String year=birth[0]+birth[1]+birth[2]+birth[3];
			int age= Integer.parseInt(now) - Integer.parseInt(year) +1; 
			System.out.println("age"+age);
		
			if(l_gender.get(i).equals("men")){	
				gender_count[0] += 1;
				if(age>=0 && age<20){m_noadult +=1; chartdto.setM_noadult(m_noadult);}
				else if(age>=20 && age<30){m_twenty +=1; chartdto.setM_twenty(m_twenty);}
				else if(age>=30 && age<40){m_thirty +=1; chartdto.setM_thirty(m_thirty);}
				else if(age>=40 && age<50){m_forty +=1; chartdto.setM_forty(m_forty);}
				else if(age>=50 && age<60){m_fifty +=1; chartdto.setM_fifty(m_fifty);}
				else if(age>=60 && age<80){m_sixty +=1; chartdto.setM_sixty(m_sixty);}
				else if(age>=80){m_eighty +=1; chartdto.setM_eighty(m_eighty);}
			}else{
				gender_count[1] += 1;
				if(age>=0 && age<20){w_noadult +=1; chartdto.setW_noadult(w_noadult);}
				else if(age>=20 && age<30){w_twenty +=1; chartdto.setW_twenty(w_twenty);}
				else if(age>=30 && age<40){w_thirty +=1; chartdto.setW_thirty(w_thirty);}
				else if(age>=40 && age<50){w_forty +=1; chartdto.setW_forty(w_forty);}
				else if(age>=50 && age<60){w_fifty +=1; chartdto.setW_fifty(w_fifty);}
				else if(age>=60 && age<80){w_sixty +=1; chartdto.setW_sixty(w_sixty);}
				else if(age>=80){w_eighty +=1; chartdto.setW_eighty(w_eighty);}			
			}
			
		}
		//way
		for(int i = 0; i<way.length ; i++){
		dto.setI_way(way[i]);
		// 0 과 1 번 각각의 투자 방법의 count를 가져온다.
		way_count[i] = (int) sqlMap.queryForObject("investway", dto.getI_way());
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
		
		//투자상태
		int i_doing=(Integer)sqlMap.queryForObject("investdoing", null);
		int i_overend=(Integer)sqlMap.queryForObject("investoverend", null);
		int i_refunds=(Integer)sqlMap.queryForObject("investrefunds", null);
		
		
		mv.addObject("i_doing",i_doing);
		mv.addObject("i_overend",i_overend);
		mv.addObject("i_refunds",i_refunds);
		mv.addObject("count", count);
		mv.addObject("dto", chartdto);
		mv.addObject("wayfull", way_count[0]);
		mv.addObject("waysplit", way_count[1]);
		mv.addObject("gender_m", gender_count[0]);
		mv.addObject("gender_w", gender_count[1]);
		mv.addObject("p", p);
		mv.addObject("b", b);
		mv.addObject("c", c);
		mv.addObject("r", r);
		mv.setViewName("/manager/manager_investmn.jsp");
		return mv;
	}


}
