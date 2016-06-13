package result.bean;


import java.text.DecimalFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.bean.InvestDto;
import result.bean.MessageDto;

@Controller
public class MessageBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;
	
	public void investMessageGo(InvestDto indto,SqlMapClientTemplate sqlMap, int sns){
		MessageDto dto = new MessageDto();
		DecimalFormat df = new DecimalFormat("#,##0");
		long invest = Long.parseLong(indto.getI_invest());
		String i_invest = df.format(invest);
		
		if(sns == 1){
			
		dto.setM_pcode(indto.getI_pcode());
		dto.setM_content("["+indto.getI_pname()+"/"+indto.getI_pcode()+"]��"+
								i_invest+"0000���� ���ڿϷ� �Ǿ����ϴ�.");
		dto.setM_memno(indto.getI_memno());
		dto.setM_where("����");
		dto.setM_check(1);
		
		}else if(sns == 2){
			
		dto.setM_pcode(indto.getI_pcode());
		dto.setM_content("["+indto.getI_pname()+"/"+indto.getI_pcode()+"]�� ���ڸ� ��� �ϼ̽��ϴ�.");
		dto.setM_memno(indto.getI_memno());
		dto.setM_where("�������");
		dto.setM_check(1);
			
		}
	
		sqlMap.insert("messageIn", dto);
	}
	

}
