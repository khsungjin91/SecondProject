package manager.bean;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.views.xslt.ArrayAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import product.bean.BorrowDto;
import sign.bean.memberDto;

@Controller
public class ManagerBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	@RequestMapping("/manager_main.dj")
	public ModelAndView managermain(){
		
		mv.setViewName("/manager/manager_main.jsp");
		return mv;
	}
	
	//회원관리
	@RequestMapping("/manager_member.dj")
	public String managermember(){
		return "/manager/manager_member.jsp";
	}
	
	
	//인증회원
	@RequestMapping("/manager_confirm.dj")
	public ModelAndView managerconfirm(){
		int setting=1;
		List list = sqlMap.queryForList("m_memberInfo",null);
		mv.addObject("setting",setting);
		mv.addObject("list", list);
		mv.setViewName("/manager/manager_confirm.jsp");
		return mv;
	}
	

	//인증회원 검색
	@RequestMapping("/confirm_search.dj")
	public ModelAndView confirm_search(String confirm,String search){
		
		int setting=2;
		Map map = new HashMap();
		map.put("confirm", confirm);
		map.put("search", search);
		List list=sqlMap.queryForList("confirm_search",map);

		int x=list.size();
		mv.addObject("x" ,x);
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_confirm.jsp");
		return mv;
	}
	
	// 인증회원 상세페이지- 투자
	@RequestMapping("/manager_view.dj")
	public ModelAndView managerview(String email){

		int no=(Integer)sqlMap.queryForObject("getno",email);
		List list=sqlMap.queryForList("invest_email",no);
		int count=(Integer)sqlMap.queryForObject("invest_count", no);
		int sum=0;
		if(count!=0){
			sum=(Integer)sqlMap.queryForObject("invest_sum_no", no);		
		}else{
			sum=0;
		}
		mv.addObject("count",count);
		mv.addObject("sum",sum);
		mv.addObject("list",list);
		mv.addObject("email",email);
		mv.setViewName("/manager/manager_view.jsp");
		return mv;
	}
	
	
	// 인증회원 상세페이지 - 대출 
		@RequestMapping("/manager_borrow.dj")
		public ModelAndView managerborrow(String email){
		
			int no=(Integer)sqlMap.queryForObject("getno", email);
			List list=sqlMap.queryForList("borrow_email",no);
			int count=(Integer)sqlMap.queryForObject("borrow_count", no);
			int sum=0;
			if(count!=0){
				sum=(Integer)sqlMap.queryForObject("borrow_sum_no", no);			
			}else{
				sum=0;
			}	
			
			mv.addObject("count",count);
			mv.addObject("sum",sum);
			mv.addObject("list",list);
			mv.addObject("email",email);
			mv.setViewName("/manager/manager_borrow.jsp");
			return mv;
		}
		
	//일반회원
	@RequestMapping("/manager_noconfirm.dj")
	public ModelAndView managernoconfirm(){
		int setting = 1;
		List list = sqlMap.queryForList("m_member", null);
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_noconfirm.jsp");
		return mv;
	}
	
	
	@RequestMapping("/noconfirm_search.dj")
	public ModelAndView noconfirm_search(String noconfirm,String search){
		int setting = 2;
		Map map = new HashMap();
		map.put("noconfirm", noconfirm);
		//noconfirm을  받아서 noconfirm이름으로 map에 저장
		map.put("search", search);
		List list = sqlMap.queryForList("noconfirm_search", map);
		//map을 가지고 sql문을  수행하여 나온결과를 list에 저장  
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_noconfirm.jsp");
		return mv;
	}
	
	//투자자list,차트 (성진이가 할것)
	@RequestMapping("/manager_investmn.dj")
	public ModelAndView managerinvestmn(){
		mv.setViewName("/manager/manager_investmn.jsp");
		
		return mv;
	}
	
	//대출신청list,차트 
	@RequestMapping("/manager_borrowmn.dj")
	public ModelAndView managerborrowmn(Bar_ChartDto chartdto){
		//pie 차트
		String [] ctg={"p","b","c","m"};
		List list = sqlMap.queryForList("borrowmn", null);
		
		int []count=new int[ctg.length];
		
		for(int i =0; i<ctg.length;i++){
			count[i] = (int)sqlMap.queryForObject("count_category", ctg[i]);		
		}
		//bar 차트
		List l_gender = sqlMap.queryForList("gender",null);
		List l_birth = sqlMap.queryForList("birth",null);
		
		SimpleDateFormat spf= new SimpleDateFormat("yyyy");
		Date date =new Date();
		System.out.println(date);
		String now = spf.format(date);
		
		int m_noadult=0; 
		int m_twenty=0;
		int m_thirty=0;
		int m_forty=0;
		int m_fifty=0;
		int m_sixty=0;
		int m_eighty=0;
		int w_noadult=0; 
		int w_twenty=0;
		int w_thirty=0;
		int w_forty=0;
		int w_fifty=0;
		int w_sixty=0;
		int w_eighty=0;
		
		for(int i =0;i<l_birth.size();i++){
			String[] birth=((String) l_birth.get(i)).split("");
			String year=birth[0]+birth[1]+birth[2]+birth[3];
			int age= Integer.parseInt(now) - Integer.parseInt(year) +1; 
		
			if(l_gender.get(i).equals("men")){	
				if(age>=0 && age<20){m_noadult +=1; chartdto.setM_noadult(m_noadult);}
				else if(age>=20 && age<30){m_twenty +=1; chartdto.setM_twenty(m_twenty);}
				else if(age>=30 && age<40){m_thirty +=1; chartdto.setM_thirty(m_thirty);}
				else if(age>=40 && age<50){m_forty +=1; chartdto.setM_forty(m_forty);}
				else if(age>=50 && age<60){m_fifty +=1; chartdto.setM_fifty(m_fifty);}
				else if(age>=60 && age<80){m_sixty +=1; chartdto.setM_sixty(m_sixty);}
				else if(age>=80){m_eighty +=1; chartdto.setM_eighty(m_eighty);}
			}else{
				if(age>=0 && age<20){w_noadult +=1; chartdto.setW_noadult(w_noadult);}
				else if(age>=20 && age<30){w_twenty +=1; chartdto.setW_twenty(w_twenty);}
				else if(age>=30 && age<40){w_thirty +=1; chartdto.setW_thirty(w_thirty);}
				else if(age>=40 && age<50){w_forty +=1; chartdto.setW_forty(w_forty);}
				else if(age>=50 && age<60){w_fifty +=1; chartdto.setW_fifty(w_fifty);}
				else if(age>=60 && age<80){w_sixty +=1; chartdto.setW_sixty(w_sixty);}
				else if(age>=80){w_eighty +=1; chartdto.setW_eighty(w_eighty);}			
			}
		}
		
		//line 차트
		int all_sum=0;	int all_count=0;	float all_avg=1; 
		int sc_sum=0;	int sc_count=0;		float sc_avg=1; 
		
		
		all_sum = (Integer)sqlMap.queryForObject("borrow_sumA", null);
		all_count = (Integer)sqlMap.queryForObject("borrow_countA", null);
		sc_sum = (Integer)sqlMap.queryForObject("borrow_sum_sc", null);
		sc_count = (Integer)sqlMap.queryForObject("borrow_sum_sc", null);
		
		all_avg = (float)all_sum/(float)all_count;
		sc_avg = (float)sc_sum/(float)sc_count;
		System.out.println(all_avg);
		System.out.println(sc_avg);
		
		
		mv.addObject("all_avg",all_avg);
		mv.addObject("sc_avg",sc_avg);
		mv.addObject("now",now);
		mv.addObject("dto",chartdto);
		mv.addObject("p",count[0]);
		mv.addObject("b",count[1]);
		mv.addObject("c",count[2]);
		mv.addObject("m",count[3]);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_borrowmn.jsp");
		return mv;
	}
	
	//성진이가 한것입니다. 대출 리스트
	@RequestMapping("/manager_borrowlist.dj")
	public ModelAndView managerborrowlist(){
		List list = sqlMap.queryForList("borrowlist", null);
		int count = list.size();
		
		System.out.println(count);
		
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.setViewName("/manager/manager_borrowlist.jsp");
		return mv;
	}
		
}
