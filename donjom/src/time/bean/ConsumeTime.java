package time.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;

import product.bean.RegisterDto;

@Controller
public class ConsumeTime {
	
	public String consumetime(RegisterDto dto){
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String end = format.format(now);
		String start = dto.getP_date();
		
		String [] endsplit = end.split("");
		String [] startsplit = start.split("");
		
		String e_day = endsplit[8]+endsplit[9];
		String e_hour = endsplit[11]+endsplit[12];
		String e_minete = endsplit[14]+endsplit[15];
		String e_seconds = endsplit[17]+endsplit[18];
		
		String s_day = startsplit[8]+startsplit[9];
		String s_hour = startsplit[11]+startsplit[12];
		String s_minete = startsplit[14]+startsplit[15];
		String s_seconds = startsplit[17]+startsplit[18];
		
		long eseconds_no = Long.parseLong(e_seconds)*1000;
		long eminete_no = Long.parseLong(e_minete)*1000*60;
		long ehour_no = Long.parseLong(e_hour)*1000*60*60;
		long eday_no = Long.parseLong(e_day)*1000*60*60*24;
		
		long seconds_no = Long.parseLong(s_seconds)*1000;
		long sminete_no = Long.parseLong(s_minete)*1000*60;
		long shour_no = Long.parseLong(s_hour)*1000*60*60;
		long sday_no = Long.parseLong(s_day)*1000*60*60*24;
		
		long end_no = eseconds_no+eminete_no+ehour_no+eday_no;
		long start_no = seconds_no+sminete_no+shour_no+sday_no;
		long time = end_no - start_no;
		
		long hour   = time/1000/60/60;
		long gabige = time%3600000;
		long minete = gabige/1000/60;
		
		String soyotime = hour+"시간"+minete+"분 소요";

		return soyotime;
	}
	
}
