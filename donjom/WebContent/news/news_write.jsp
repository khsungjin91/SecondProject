<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ��� ������ ������ </title>
</head>
<body>
<h2> ��� </h2>
	
	<input type="text" name="serch">
	<input type="button" value="�˻�">
	
	<form action="news_write.dj" method="post" enctype="multipatr/form-data">
		
	<table border="1">
		<tr>
			<td> �����̹��� </td>
			<td> <input type="file" name="image"> </td>

		</tr>
		<tr>
			<td> ��������Ʈ�� </td>
			<td> <input type="text" name="sitename"> </td>
		</tr>
		<tr> 
			<td> �������� </td>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<td> ���������� </td>
			<td> <input type="text" name="content"> </td>
		</tr>
		<tr>
			<td> �ڼ��� ���� </td>
			<td> <input type="text" name="site"> </td>
		</tr>
	</table>
	<input type="submit" value="���� �����ϱ�">
	<input type="button" value="���� �����ϱ�" onclick="javascript:location.href='news_writePro.dj'">
	<input type="button" value="�������" onclick="javascript:location.href='news_manager.dj'">
	</form>

</body>
</html>