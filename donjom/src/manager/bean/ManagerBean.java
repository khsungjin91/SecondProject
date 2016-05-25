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
		System.out.println(list.size()+"save");
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
			sum=(Integer)sqlMap.queryForObject("invest_sum", no);		
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
				sum=(Integer)sqlMap.queryForObject("borrow_sum", no);			
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
	public ModelAndView managerborrowmn(Bar_ChartDto chardto){
		String [] ctg={"p","b","c","m"};
		List list = sqlMap.queryForList("borrowmn", null);
		
		int []count=new int[ctg.length];
		
		for(int i =0; i<ctg.length;i++){
			count[i] = (int)sqlMap.queryForObject("count_category", ctg[i]);		
		}
		List l_gender = sqlMap.queryForList("gender",null);
		List l_birth = sqlMap.queryForList("birth",null);
		
		SimpleDateFormat spf= new SimpleDateFormat("yyyy");
		Date date =new Date();
		System.out.println(date);
		String now = spf.format(date);
		int noadult=0;
		int twenty=0;
		int thirty=0;
		int forty=0;
		int fifty=0;
		int sixty=0;
		int eighty=0;
		
		for(int i =0;i<list.size();i++){
			String[] birth=((String) l_birth.get(i)).split("");
			String year=birth[0]+birth[1]+birth[2]+birth[3];
			int age= Integer.parseInt(now)-Integer.parseInt(year) +1; 
		
			if(l_gender.get(i).equals("men")){			
			if(age>=0 && age<20){noadult +=1; }
			else if(age>=20 && age<30){twenty +=1;}
			else if(age>=30 && age<40){thirty +=1;}
			else if(age>=40 && age<50){forty +=1;}
			else if(age>=50 && age<60){fifty +=1;}
			else if(age>=60 && age<80){sixty +=1;}
			else if(age>=80){eighty +=1;}
			}		
			
			
			
			
		}
		
		
		
		
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
