<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ��� ������ ������ </title>
</head>
<body>
<h2> ��� </h2>
	<form action="news_write.dj">
	<table border="1">
		<tr>
			<td> ${list.image} </td>
		</tr>
		<tr>
			<td> ${list.sitename} </td>
		</tr>
		<tr> 
			<td> ${list.title} </td>
		</tr>
		<tr>
			<td> ${list.content} </td>
		</tr>
		<tr>
			<td> ${list.site} </td>
		</tr>
	</table>
	<input type="submit" value="���� �ø���">
	<input type="button" value="���� �����ϱ�" onclick="javascript:location.href='/news_writePro.dj'">
	<input type="button" value="���� ����" onclick="javascrip:location.href='/news_deletePro.dj'">
	</form>

</body>
</html>