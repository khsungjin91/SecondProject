package manager.bean;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import product.bean.BorrowDto;

@Controller
public class EvaluationBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	//대출완료list (심사하는곳)
	@RequestMapping("/manager_evaluation.dj")
	public ModelAndView managerevaluation(){
		List list= sqlMap.queryForList("evaluation", null);
		int count = list.size();
		int setting=1;
		
		mv.addObject("setting",setting);
		mv.addObject("count",count);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_evaluation.jsp");

		return mv;
	}
	
	
	//심사평작성
	@RequestMapping("/manager_evaluation_write.dj")
	public ModelAndView managerevaluationwrite(BorrowDto dto){
		dto=(BorrowDto)sqlMap.queryForObject("borrow", dto.getNo());
	
		mv.addObject("dto",dto);
		mv.setViewName("/manager/manager_evaluation_write.jsp");
		return mv;
	}
	
	//심사평 insert
		@RequestMapping("/manager_evaluation_writeinsert.dj")
		public ModelAndView managerevaluationwriteinsert(evaluationDto dto,BorrowDto dto2, MultipartHttpServletRequest request)throws Exception{

			
			MultipartFile cpmf=request.getFile("cpfile");
			MultipartFile docmf=request.getFile("document");
			
			String cpOrgName = cpmf.getOriginalFilename();
			String docOrgName = docmf.getOriginalFilename();
			
			String path= request.getServletContext().getRealPath("")+"\\file\\";
	
			if(cpOrgName.equals("")){
				// cporgName이 없을경우
			}else{
				dto.setE_cpfile(cpOrgName);
							
				File copy = new File(path+dto.getE_cpfile());
							
				cpmf.transferTo(copy);
			}
		
			if(docOrgName.equals("")){
				// docorgName이 없을경우
			}else{
				dto.setE_document(docOrgName);
				
				File copy2 = new File(path+dto.getE_document());

				docmf.transferTo(copy2);
			}
			dto2.setSuccess(dto.getE_result());
			sqlMap.insert("evaluation_writeinsert",dto);
			sqlMap.update("borrowup",dto2);
			
			mv.setViewName("/manager/manager_evaluation_writesc.jsp");
			return mv;
		}
	
	//심사-찾기 
	@RequestMapping("/manager_evaluation_search.dj")
	public ModelAndView managerevaluationsearch(String evaluation,String search){

		int setting=2;
		Map map=new HashMap();
		map.put("evaluation",evaluation);
		map.put("search", search);
		List list = sqlMap.queryForList("evaluation_search", map);
		
		mv.addObject("setting",setting);
		mv.addObject("list",list);
		mv.setViewName("/manager/manager_evaluation.jsp");
		return mv;
	}
	
}
