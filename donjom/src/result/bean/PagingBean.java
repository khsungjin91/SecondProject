package result.bean;

import org.springframework.stereotype.Controller;

import setting.bean.PagingAction;

@Controller
public class PagingBean {
	
	public String getPage(int currentPage,int totalCount,int blockCount,int blockPage){
		
		System.out.println(totalCount);
		PagingAction page;
		String pagingHtml = null;
		
		try{
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		}catch(Exception e){ e.printStackTrace();}
		
		return pagingHtml;
	}

}
