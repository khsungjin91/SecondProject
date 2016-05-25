package result.bean;

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
	public ModelAndView managerinvestmn(InvestDto dto,Bar_ChartDto chartDto){
		//나이계산용
		SimpleDateFormat format =  new SimpleDateFormat("yyyy");
		//투자 전체 count
		int count  = (Integer)sqlMap.queryForObject("result.investcount", null);	
		String [] category = new String[count];
		//투자 방법 0,1로 구분 
		String [] way ={"0","1"};
		//투자 방법 배열 2개 생성
		int [] way_count = new int[2];
		int [] gender_count = new int[2];
		
		int p = 0;	int c = 0;	int b = 0;	int r = 0;
		String p_code = "";
	
		List code_list = sqlMap.queryForList("result.investpcode", null);
		List age_list = sqlMap.queryForList("result.investage", null);
		List gender_list = sqlMap.queryForList("result.investgender", null);
		
		String [] birth = new String[age_list.size()];
		String [] gender = new String[gender_list.size()];
		int [] age = new int[age_list.size()];
		int mnoadult=0; int wnoadult = 0;
		int mtwenty = 0; int wtwenty = 0;
		int mthirty = 0; int wthirty = 0;
		int mforty = 0; int wforty = 0;
		int mfifty = 0; int wfifty = 0;
		int msixty = 0; int wsixty = 0;
		int meighty = 0; int weighty = 0;
		Date now = new Date();
		String year = format.format(now);
		//age

	for(int i = 0; i<age_list.size(); i++){
			birth[i] = (String) age_list.get(i);
			String [] y = birth[i].split("");
			String sum = y[0]+y[1]+y[2]+y[3];
			age[i] = Integer.parseInt(year) - Integer.parseInt(sum)+1;

		if(gender_list.get(i).equals("men")){
			gender_count[0] += 1;
			if(age[i] >= 0 && age[i] < 20){mnoadult += 1;  chartDto.setM_noadult(mnoadult) ;}
			else if(age[i] >= 20 && age[i] < 30){mtwenty += 1; chartDto.setM_twenty(mtwenty) ;}
			else if(age[i] >= 30 && age[i] < 40){mthirty += 1; chartDto.setM_thirty(mthirty);}
			else if(age[i] >= 40 && age[i] < 50){mforty += 1; chartDto.setM_forty(mforty);}
			else if(age[i] >= 50 && age[i] < 60){mfifty += 1; chartDto.setM_fifty(mfifty);}
			else if(age[i] >= 60 && age[i] < 70){msixty += 1; chartDto.setM_sixty(msixty);}
			else if(age[i] >= 70){meighty += age[i]; chartDto.setM_eighty(meighty);}
	
		}else{
			gender_count[1] += 1;
			if(age[i] >= 0 && age[i] < 20){ wnoadult += 1 ; chartDto.setW_noadult(wnoadult);}
			else if(age[i] >= 20 && age[i] < 30){ wtwenty += 1 ; chartDto.setW_twenty(wtwenty);}
			else if(age[i] >= 30 && age[i] < 40){wthirty += 1; chartDto.setW_thirty(wthirty);}
			else if(age[i] >= 40 && age[i] < 50){wforty += 1; chartDto.setW_forty(wforty);}
			else if(age[i] >= 50 && age[i] < 60){wfifty += 1; chartDto.setW_fifty(wfifty);}
			else if(age[i] >= 60 && age[i] < 70){wsixty += 1; chartDto.setW_sixty(wsixty);}
			else if(age[i] >= 70){weighty += age[i]; chartDto.setW_eighty(weighty);}
		}
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
		mv.addObject("dto", chartDto);
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
