<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="signup_checkPwPro.dj" method="post">

<input type="hidden" value="${email}" name="email">
<input type="hidden" value="${memno}" name="memno">
��й�ȣ : <input type="password" name="pw"> <br/>
<input type="submit" value="Ȯ��">

</form>

</body>
</html>