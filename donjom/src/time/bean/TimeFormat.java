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
		int a=0;
		Calendar today = Calendar.getInstance();

		
		
	if(today.get(Calendar.DAY_OF_WEEK) >= 5  && today.get(Calendar.HOUR_OF_DAY) >= 13){
		System.out.println("1");
		if(today.get(Calendar.DAY_OF_WEEK) >= 5 && today.get(Calendar.HOUR_OF_DAY) < 23 ){
			System.out.println("2");
			if(today.get(Calendar.DAY_OF_WEEK) <= 6 && today.get(Calendar.HOUR_OF_DAY) > 0){
				System.out.println("3");
			WhenTUS = 2;
			}
		}
	}
	
	if(today.get(Calendar.DAY_OF_WEEK) == 6 && today.get(Calendar.HOUR_OF_DAY) == 13){
		System.out.println("4");
		When = 1;
	}
	
	map.put("When", When);
	map.put("WhenTUS", WhenTUS);
	System.out.println(When);
	System.out.println(WhenTUS);
	
	
		return map;
	}
	
	@RequestMapping("/timemelee.dj")
	public ModelAndView Timeformat()throws Exception{
		
		SimpleDateFormat sf = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		
		String format = sf.format(now);
		
		String [] split = format.split(":");
		
	    int H = (36-Integer.parseInt(split[0]));
	    int M = (59-Integer.parseInt(split[1]));
	    int S = (59-Integer.parseInt(split[2]));
	    
	    String time = H +":"+ M + ":" + S ;
		
		mv.addObject("time", time);
		mv.setViewName("/timeless/timestart.jsp");
		return mv;
	}

}
