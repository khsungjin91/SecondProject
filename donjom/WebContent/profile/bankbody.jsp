<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="changehere">
은행명	<input type="text" name="bankcode" value="${dto.bankcode}" disabled="disabled">			<br/>
계좌번호	<input type="text" name="bankaccnum" value="${dto.bankaccnum}" disabled="disabled">		<br/>
<input type="button" value="은행 및 계좌 변경" onclick="changeAcc()">											<br/>
</div>

</body>
</html>