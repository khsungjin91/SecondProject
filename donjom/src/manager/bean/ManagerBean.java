package manager.bean;

import java.io.File;
import java.util.ArrayList;
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
	
	//ȸ������
	@RequestMapping("/manager_member.dj")
	public String managermember(){
		return "/manager/manager_member.jsp";
	}
	
	
	//����ȸ��
	@RequestMapping("/manager_confirm.dj")
	public ModelAndView managerconfirm(){
		int setting=1;
		List list = sqlMap.queryForList("m_memberInfo",null);
		mv.addObject("setting",setting);
		mv.addObject("list", list);
		mv.setViewName("/manager/manager_confirm.jsp");
		return mv;
	}
	

	//����ȸ�� �˻�
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
	
	// ����ȸ�� ��������- ����
	@RequestMapping("/manager_view.dj")
	public ModelAndView managerview(String email){
		
		System.out.println(email);
		int no=(Integer)sqlMap.queryForObject("getno",email);
		int sum=(Integer)sqlMap.queryForObject("invest_sum", no);		
		List list=sqlMap.queryForList("invest_email",no);
		
		mv.addObject("sum",sum);
		mv.addObject("list",list);
		mv.addObject("email",email);
		mv.setViewName("/manager/manager_view.jsp");
		return mv;
	}
	
	
	// ����ȸ�� �������� - ���� 
		@RequestMapping("/manager_borrow.dj")
		public ModelAndView managerborrow(String email){
		
			int no=(Integer)sqlMap.queryForObject("getno", email);
			int sum=(Integer)sqlMap.queryForObject("borrow_sum", no);			
			List list=sqlMap.queryForList("borrow_email",no);
		
			mv.addObject("sum",sum);
			mv.addObject("list",list);
			mv.addObject("email",email);
			mv.setViewName("/manager/manager_borrow.jsp");
			return mv;
		}
		
	//�Ϲ�ȸ��
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
		//noconfirm��  �޾Ƽ� noconfirm�̸����� map�� ����
		map.put("search", search);
		List list = sqlMap.queryForList("noconfirm_search", map);
		//map�� ������ sql����  �����Ͽ� ���°���� list�� ����  
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_noconfirm.jsp");
		return mv;
	}
	
	//������list,��Ʈ (�����̰� �Ұ�)
	@RequestMapping("/manager_investmn.dj")
	public ModelAndView managerinvestmn(){
		mv.setViewName("/manager/manager_investmn.jsp");
		
		return mv;
	}
	
	//�����ûlist,��Ʈ 
	@RequestMapping("/manager_borrowmn.dj")
	public ModelAndView managerborrowmn(){
		String [] ctg={"p","b","c","m"};
		List list = sqlMap.queryForList("borrowmn", null);
		
		int []count=new int[ctg.length];
		
		for(int i =0; i<ctg.length;i++){
			count[i] = (int)sqlMap.queryForObject("count_category", ctg[i]);		
		}
		
		mv.addObject("p",count[0]);
		mv.addObject("b",count[1]);
		mv.addObject("c",count[2]);
		mv.addObject("m",count[3]);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_borrowmn.jsp");
		return mv;
	}
	
	//�����̰� �Ѱ��Դϴ�. ���� ����Ʈ
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
