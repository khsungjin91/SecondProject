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

	<form action="news_search.dj" method="post">
	<input type="text" name="serch">
	<input type="button" value="�˻�">
	</form>
	
	<form action="" method="post">
	<table border="1">
	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.num}</td>
		</tr>
		<tr>
			<td><img src="/donjom/newssave/${list.image}"/> </td> 
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
		<c:if test="list.size() <= 0">
			<tr>
				<td> ��ϵ� �Խù��� �����ϴ�.</td>
		</c:if>
		</c:forEach>
		
	</table>
	<input type="submit" value="���� �ø���" onclick="javascript:location.href='news_write.dj'">
	<input type="button" value="���� ����" onclick="javascript:location.href='news_modify.dj?no=${news.num}'">
	<input type="button" value="���� ����" onclick="javascrip:location.href='news_delete.dj?no=${news.num}'">
	
	</form>


</body>
</html>