<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
</head>
<body>
	<h2> ���� </h2>
	<form action="notice_modifyPro.dj?no=${news.num}" method="post">
		<table border="1">
		<tr>
			<td> �����̹��� </td>
			<td> <input type="file" name="image" value="${news.image}"> </td>

		</tr>
		<tr>
			<td> ��������Ʈ�� </td>
			<td> <input type="text" name="sitename" value="${news.sitename}"> </td>
		</tr>
		<tr> 
			<td> �������� </td>
			<td> <input type="text" name="title" value="${news.title}"> </td>
		</tr>
		<tr>
			<td> ���������� </td>
			<td> <textarea name="content"> ${news.content} </textarea> </td>
		</tr>
		<tr>
			<td> �ڼ��� ���� </td>
			<td> <input type="text" name="site" value="${news.site}"> </td>
		</tr>
	</table>
		<input type="submit" value="����">
		<input type="button" value="���" onclick="javascript:location.href='news_manager.dj'">
	</form>
</body>
</html>