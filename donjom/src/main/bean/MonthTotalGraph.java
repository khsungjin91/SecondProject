package main.bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;

import product.bean.RegisterDto;

@Controller
public class MonthTotalGraph {

	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	public Map monthtotal(SqlMapClientTemplate sqlMap)throws Exception{
		Map map = new HashMap();
		List<RegisterDto> loanlist = new ArrayList<RegisterDto>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		Calendar cal = Calendar.getInstance();
		Date newd = new Date();
		Date today = new Date();
		String [] frame = new String[12];
		String [] frame_b = new String[12];
		List datelist = sqlMap.queryForList("graph.line_graph", null);
		loanlist = sqlMap.queryForList("graph.line_graph2", null);
		String y [] = new String[datelist.size()];
		int money [] = {0,0,0,0,0,0,0,0,0,0,0,0};
		int personal [] = {0,0,0,0,0,0,0,0,0,0,0,0};
		int replace [] = {0,0,0,0,0,0,0,0,0,0,0,0};
		int cardloan [] = {0,0,0,0,0,0,0,0,0,0,0,0};
		int bussines [] = {0,0,0,0,0,0,0,0,0,0,0,0};
		
		
		
		//현재 월에서 12월 전까지 범위 표현
		for(int i = 0; i <12 ; i++){
			frame_b[i] = cal.get(cal.YEAR)+"-"+(cal.get(cal.MONDAY)-i+1);
			today = format.parse(frame_b[i]);
			frame[i] = new java.text.SimpleDateFormat("yyyy-MM").format(today);
		
		}
		
		//위의 표현범위와 DB의 날짜가 같을때 수가 들어간다.
		for(int i = 0; i <datelist.size(); i++){
		RegisterDto dto = new RegisterDto();
		//대출금 가져오기
		dto=(RegisterDto)loanlist.get(i);	
		int loan = Integer.parseInt(dto.getP_price());
		//DB에서 product 날짜 가져오기
		String x = dto.getP_date();
		newd = format.parse(x);
		y[i] = new java.text.SimpleDateFormat ("yyyy-MM").format(newd);

		if(frame[0].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[0] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[0] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[0] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[0] += loan;
			}
		}
		if(frame[1].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[1] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[1] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[1] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[1] += loan;
			}
		}
		if(frame[2].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[2] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[2] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[2] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[2] += loan;
			}
		}
		if(frame[3].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[3] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[3] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[3] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[3] += loan;
			}
		}
		if(frame[4].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[4] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[4] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[4] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[4] += loan;
			}
		}
		if(frame[5].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[5] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[5] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[5] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[5] += loan;
			}
		}
		if(frame[6].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[6] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[6] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[6] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[6] += loan;
			}
		}
		if(frame[7].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[7] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[7] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[7] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[7] += loan;
			}
		}
		if(frame[8].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[8] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[8] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[8] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[8] += loan;
			}
		}
		if(frame[9].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[9] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[9] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[9] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[9] += loan;
			}
		}
		if(frame[10].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[10] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[10] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[10] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[10] += loan;
			}
		}
		if(frame[11].equals(y[i])){
			if(dto.getP_category().equals("p")){
				personal[11] += loan;
			}else if(dto.getP_category().equals("c")){
				cardloan[11] += loan;
			}else if(dto.getP_category().equals("b")){
				bussines[11] += loan;
			}else if(dto.getP_category().equals("r")){
				replace[11] += loan;
			}
		}
	
		}

		map.put("p_one", personal[0]);
		map.put("p_two", personal[1]);
		map.put("p_three", personal[2]);
		map.put("p_four", personal[3]);
		map.put("p_five", personal[4]);
		map.put("p_six", personal[5]);
		map.put("p_seven", personal[6]);
		map.put("p_eghit", personal[7]);
		map.put("p_nine", personal[8]);
		map.put("p_ten", personal[9]);
		map.put("p_eleven", personal[10]);
		map.put("p_twelve", personal[11]);
		
		map.put("c_one", cardloan[0]);
		map.put("c_two", cardloan[1]);
		map.put("c_three", cardloan[2]);
		map.put("c_four", cardloan[3]);
		map.put("c_five", cardloan[4]);
		map.put("c_six", cardloan[5]);
		map.put("c_seven", cardloan[6]);
		map.put("c_eghit", cardloan[7]);
		map.put("c_nine", cardloan[8]);
		map.put("c_ten", cardloan[9]);
		map.put("c_eleven", cardloan[10]);
		map.put("c_twelve", cardloan[11]);
		
		map.put("b_one", bussines[0]);
		map.put("b_two", bussines[1]);
		map.put("b_three", bussines[2]);
		map.put("b_four", bussines[3]);
		map.put("b_five", bussines[4]);
		map.put("b_six", bussines[5]);
		map.put("b_seven", bussines[6]);
		map.put("b_eghit", bussines[7]);
		map.put("b_nine", bussines[8]);
		map.put("b_ten", bussines[9]);
		map.put("b_eleven", bussines[10]);
		map.put("b_twelve", bussines[11]);
		
		map.put("r_one", replace[0]);
		map.put("r_two", replace[1]);
		map.put("r_three", replace[2]);
		map.put("r_four", replace[3]);
		map.put("r_five", replace[4]);
		map.put("r_six", replace[5]);
		map.put("r_seven", replace[6]);
		map.put("r_eghit", replace[7]);
		map.put("r_nine", replace[8]);
		map.put("r_ten", replace[9]);
		map.put("r_eleven", replace[10]);
		map.put("r_twelve", replace[11]);
		
		map.put("m1", frame[0]);
		map.put("m2", frame[1]);
		map.put("m3", frame[2]);
		map.put("m4", frame[3]);
		map.put("m5", frame[4]);
		map.put("m6", frame[5]);
		map.put("m7", frame[6]);
		map.put("m8", frame[7]);
		map.put("m9", frame[8]);
		map.put("m10", frame[9]);
		map.put("m11", frame[10]);
		map.put("m12", frame[11]);
		
		return map;
	}
	
}
