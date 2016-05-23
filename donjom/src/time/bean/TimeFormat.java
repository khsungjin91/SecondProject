package time.bean;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TimeFormat {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	public Map Time(){
		Map map = new HashMap();
		int When = 0;
		int WhenTUS = 0;
		Calendar today = Calendar.getInstance();

	
	if(today.get(Calendar.DAY_OF_WEEK) >= 1  && today.get(Calendar.HOUR_OF_DAY) >= 0){
		System.out.println("1");
		if(today.get(Calendar.DAY_OF_WEEK) >= 1 && today.get(Calendar.HOUR_OF_DAY) <= 23 ){
			System.out.println("2");
			if(today.get(Calendar.DAY_OF_WEEK) <= 2 && today.get(Calendar.HOUR_OF_DAY) > 0){
				System.out.println("3");
			WhenTUS = 2;
			if(today.get(Calendar.DAY_OF_WEEK) == 2 && today.get(Calendar.HOUR_OF_DAY) > 13){
				System.out.println("4");
				WhenTUS = 0;
				When = 1;
			}
			}
		}
	}
	
	System.out.println(WhenTUS);
	System.out.println(When);
	
	
	map.put("When", When);
	map.put("WhenTUS", WhenTUS);
		return map;
	}
	
	
	
	@RequestMapping("/timemelee.dj")
	public ModelAndView Timeformat(String p_code)throws Exception{
		Calendar today = Calendar.getInstance();
		int H = 0,M = 0,S = 0;
		
		
		SimpleDateFormat sf = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		
		String format = sf.format(now);
		
		String [] split = format.split(":");
		
		if(today.get(Calendar.DAY_OF_WEEK) == 1  && today.get(Calendar.HOUR_OF_DAY) >= 13){
		H = (36-Integer.parseInt(split[0]));
		M = (59-Integer.parseInt(split[1]));
		S = (59-Integer.parseInt(split[2]));
		}
	
		if(today.get(Calendar.DAY_OF_WEEK) == 2 && today.get(Calendar.HOUR_OF_DAY) >= 0){
	    H = (13-Integer.parseInt(split[0]));
	    M = (59-Integer.parseInt(split[1]));
	    S = (59-Integer.parseInt(split[2]));
		}
	    
	    String time = H +":"+ M + ":" + S ;

		mv.addObject("p_code", p_code);
		mv.addObject("time", time);
		mv.setViewName("/timeless/timestart.jsp");
		return mv;
	}

}
