package chart.bean;

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

import manager.bean.Bar_ChartDto;
import product.bean.BorrowDto;
import sign.bean.memberDto;

@Controller
public class BrChartBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	//대출신청list,차트 
		@RequestMapping("/manager_borrowmn.dj")
		public ModelAndView managerborrowmn(Bar_ChartDto chartdto){
			//pie 차트
			String [] ctg={"b","r","p","c"};
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
			System.out.println(now);
			
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
				System.out.println("age"+age);
			
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
			//line 차트(총 월별평균대출액)
			
			String yy=now.substring(2,4);
			
			List p_list= sqlMap.queryForList("borrow_priceYear", yy);
			List m_list= sqlMap.queryForList("borrow_dateYear", yy);
			
			int all_sum=0;	int all_count=0;	float all_avg[] ={0,0,0,0,0,0,0,0,0,0,0,0}; 
			
			
			
			for(int i=0;i<p_list.size();i++){
				m_list.get(i);
				p_list.get(i);
				
				if(m_list.get(i).equals("01")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[0] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("02")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[1] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("03")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[2] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("04")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[3] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("05")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[4] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("06")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[5] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("07")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[6] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("08")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[7] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("09")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[8] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("10")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[9] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("11")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[10] = (float)all_sum/(float)all_count;
				}else if(m_list.get(i).equals("12")){
					p_list.get(i);
					all_count +=1;
					all_sum +=(Integer)p_list.get(i);
					all_avg[11] = (float)all_sum/(float)all_count;
				}
				
				System.out.println(all_avg[i]);
			}
			
			//line 차트(성공한 월별평균대출액)
			List psc_list=sqlMap.queryForList("borrow_priceYearSc", yy);
			List msc_list=sqlMap.queryForList("borrow_dateYearSc", yy);
			
			int sc_sum=0; 	int sc_count=0;		float sc_avg[] ={0,0,0,0,0,0,0,0,0,0,0,0}; 
			
			
			for(int i=0;i<psc_list.size();i++){
				msc_list.get(i);
				psc_list.get(i);
				
				if(msc_list.get(i).equals("01")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[0] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("02")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[1] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("03")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[2] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("04")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[3] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("05")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[4] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("06")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[5] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("07")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[6] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("08")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[7] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("09")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[8] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("10")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[9] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("11")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[10] = (float)sc_sum/(float)sc_count;
				}else if(msc_list.get(i).equals("12")){
					psc_list.get(i);
					sc_count +=1;
					sc_sum +=(Integer)psc_list.get(i);
					sc_avg[11] = (float)sc_sum/(float)sc_count;
				}
				System.out.println(all_avg[i]);
			}
			
			
			
			for(int i =0;i<12;i++){
				mv.addObject("all_avg"+(i+1),all_avg[i]);}
			for(int i =0;i<12;i++){
				mv.addObject("sc_avg"+(i+1),sc_avg[i]);	}
			
			mv.addObject("now",now);
			mv.addObject("dto",chartdto);
			mv.addObject("b",count[0]);
			mv.addObject("r",count[1]);
			mv.addObject("p",count[2]);
			mv.addObject("c",count[3]);
			mv.addObject("list",list);
			mv.setViewName("/manager/manager_borrowmn.jsp");
			return mv;
		}
	
}
	