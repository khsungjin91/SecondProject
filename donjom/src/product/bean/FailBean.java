package product.bean;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class FailBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	public void faillaon(SqlMapClientTemplate sqlMap, RegisterDto dto){
		
		String str = dto.getP_code().substring(5, 10);
		
			sqlMap.update("result.failtable",str);
			sqlMap.update("result.fail", dto.getNo());
			sqlMap.update("result.failinvest", dto.getP_code());
			

	}

}
