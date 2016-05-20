<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>

	회사 명  : ${company.company} <br />
	대표이사 : ${company.ceo} <br />
	사업자등록번호 : ${company.licensee} <br />
	주소 :	${company.address} <br />
	회사대표번호 : ${company.companynum} <br />
	팩스 번호 : ${company.fax} <br />
	이메일 : 	${company.email} <br />
	<br/>
	대출 금리 : 최고 ${company.max} (연체금리 최고  ${company.overdue}) 
		과도한 빚, 개고생의 시작입니다.
		이자 외 별도로 중계수수료를 수취하는 것은 불법입니다.
		취급수수료등 기타 부대비용 없습니다.
	<br /><br />
	2016 DonJom Inc.
	<br />
	
	<input type="reset" value="회사정보" onclick="javascript:location.href='manager_companyinfo.dj'"> 


</body>
</html>