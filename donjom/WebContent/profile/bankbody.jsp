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
�����	<input type="text" name="bankcode" value="${dto.bankcode}" disabled="disabled">			<br/>
���¹�ȣ	<input type="text" name="bankaccnum" value="${dto.bankaccnum}" disabled="disabled">		<br/>
<input type="button" value="���� �� ���� ����" onclick="changeAcc()">											<br/>
</div>

</body>
</html>