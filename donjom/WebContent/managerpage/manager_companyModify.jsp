<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="manager_companyModify.dj" method="post">
	회사 명  :<input type="text" name="company" value="${company.getCompany}"> <br />
	대표이사 : <input type="text" name="ceo" value="${company.ceo}"> <br />
	사업자등록번호 : <input type="text" name="licensee" value="${company.licensee}"> <br />
	주소 :<input type="text" name="address" value="${company.address}"> <br />
	회사대표번호 : <input type="text" name="companynum" value="${company.companynum}"> <br />
	팩스 번호 :<input type="text" name="fax" value=" ${company.fax}"> <br />
	이메일 : <input type="text" name="email" value="${company.email}"> <br />
	<br/>
	대출 금리 : 최고 <input type="text" name="max" value="${company.max}"> 
		(연체금리 최고  <input type="text" name="overdue" value="${company.overdue}">) 
		과도한 빚, 개고생의 시작입니다.
		이자 외 별도로 중계수수료를 수취하는 것은 불법입니다.
		취급수수료등 기타 부대비용 없습니다.
	<br /><br />
	2016 DonJom Inc.
	<br />
	<input type="submit" value="수정완료">
	</form>
	
	

</body>
</html>