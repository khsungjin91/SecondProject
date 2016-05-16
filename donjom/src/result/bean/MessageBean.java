package result.bean;


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
	
	public void investMessageGo(InvestDto indto,MessageDto dto,SqlMapClientTemplate sqlMap){

		dto.setM_pcode(indto.getI_pcode());
		dto.setM_content("["+indto.getI_pname()+"/"+indto.getI_pcode()+"]��"+
					indto.getI_invest()+"0000���� ���ڿϷ� �Ǿ����ϴ�.");
		dto.setM_memno(indto.getI_memno());
		dto.setM_where("����");
		dto.setM_check(1);

	
		sqlMap.insert("messageIn", dto);
	}
	

}
