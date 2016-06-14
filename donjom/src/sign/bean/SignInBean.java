package sign.bean;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import sign.bean.memberDto;


@Controller
public class SignInBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	@Autowired
	private ModelAndView mv;


	@RequestMapping("/signIn.dj")
	public ModelAndView signIn(){
		
		mv.setViewName("/user/signIn.jsp");
		return mv;
	}
	
	@RequestMapping("/signPro.dj")
	public ModelAndView signPro(memberDto dto,sessionDto sedto,HttpSession session,HttpServletRequest request)
			throws SAXException, IOException, ParserConfigurationException {
	
		
		String ip  = request.getHeader("X-FORWARDED-FOR");
		if(ip == null)
		{
			ip = request.getRemoteAddr();
			//settingDto �� �ش� ip�� �ִ´�.
			sedto.setIp(ip);
		}
		
		DocumentBuilderFactory fatory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = fatory.newDocumentBuilder();
		
		Document doc = builder.parse("http://whois.kisa.or.kr/openapi/ipascc.jsp?query=121.66.252.156&key=2016050209282077963511&answer=xml");
		NodeList list = doc.getElementsByTagName("countryCode");
		
		int i = 0;
		Element element;
		String country = null;
		
		while(list.item(i) != null){
			element = (Element) list.item(i);
			country = element.getTextContent();
			i++;
		}
		//settingDto �� ���� �ڵ带 �ִ´�.
		sedto.setPlace(country);
	
		String email = dto.getEmail();
		
		int idcheck = (Integer)sqlMap.queryForObject("idcheck", email);
		
		if(idcheck == 1){
		//email�� �ش��ϴ� ������ȣ ��������
		int no = (Integer)sqlMap.queryForObject("getno", email);
		sedto.setNo(no);
		
		int check = (Integer)sqlMap.queryForObject("signcheck", dto);

				if(check == 1){
					sedto.setMove("�α���(����)");
					session.setAttribute("memId", dto.getEmail());
					sqlMap.insert("sessioninput", sedto);
					mv.setViewName("/user/signPro.jsp");
				}else{
					sedto.setMove("�α���(����)");
					sqlMap.insert("sessioninput", sedto);
				
					mv.setViewName("/user/signError.jsp");
				}
				
			}else{
			
				mv.setViewName("/user/signError.jsp");
			}
		
		return mv;
	}
	
	@RequestMapping("/logout.dj")
	public ModelAndView logout(HttpSession session){
		
		session.invalidate();
		
		mv.setViewName("/user/logout.jsp");
		return mv;
		
	}
	
}
