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
	
	<form action="news_write.dj" method="post">
	<table border="1">
	<c:forEach var="list" items="${list}">
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
	<input type="submit" value="���� �ø���">
	<input type="button" value="���� ����" onclick="javascrip:location.href='news_deletePro.dj'">
	
	</form>


</body>
</html>