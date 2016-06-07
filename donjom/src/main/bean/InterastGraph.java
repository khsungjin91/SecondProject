package main.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class InterastGraph {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	public Map interast(SqlMapClientTemplate sqlMap){
		Map map = new HashMap();
		double interast = 0.0;
		int first = 0;
		int second = 0;
		int thirth = 0;
		int forth = 0;
		int fifth = 0;
		int sixth = 0;
		
		List list = sqlMap.queryForList("graph.interast_graph", null);
		
		for(int i = 0 ; i < list.size() ; i++){
			interast = Double.parseDouble((String) list.get(i));
			
			if(interast < 7){ first += 1;}
			else if(interast >= 7 && interast < 9){ second += 1;}
			else if(interast >= 9 && interast < 11){ thirth += 1;}
			else if(interast >= 11 && interast < 13){ forth += 1;}
			else if(interast >= 13 && interast < 15){ fifth += 1;}
			else if(interast >= 15){ sixth += 1;}
		}
		
		map.put("first",first);
		map.put("second", second);
		map.put("thirth", thirth);
		map.put("forth", forth);
		map.put("fifth", fifth);
		map.put("sixth", sixth);
	
		return map;
	}
	
	

}
