package result.bean;

import java.util.List;

import org.springframework.stereotype.Controller;

import setting.bean.pagingAction;


@Controller
public class PagingBean {
	
	public String getPage(int currentPage,int totalCount,int blockCount,
			int blockPage,pagingAction input,int paging){
		
		String pagingHtml = null;
	
		input = new pagingAction(currentPage, totalCount, blockCount, blockPage,paging);
		
		pagingHtml = input.getPagingHtml().toString();
	
		return pagingHtml;
	}
	
	public List getList(int currentPage,int totalCount,int blockCount,
			int blockPage,pagingAction input,List list, int paging){
		
		System.out.println("??"+paging);
		input = new pagingAction(currentPage, totalCount, blockCount, blockPage, paging);
		
		int lastCount = totalCount;
		
		if (input.getEndCount() < totalCount)
			lastCount = input.getEndCount() + 1;
		
		 list = list.subList(input.getStartCount(), lastCount);
		
		return list;
	}
	

}
