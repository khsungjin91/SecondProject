<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> category page</title>
</head>
<body>
	<form method="post" action="manager_categoryModifyPro.dj">
	ī�װ� �ڵ� : <input type="text" name="c_code" value="${category.c_code}"/> <br />
	ī�װ� �̸� : <input type="text" name="c_name" value="${category.c_name}"/> <br /><br />
	<input type="submit" value="����">
	<input type="button" value="ī�װ� ����" onclick="javascript:location.href='manager_categoryDel.dj'" >
	</form>
</body>
</html>