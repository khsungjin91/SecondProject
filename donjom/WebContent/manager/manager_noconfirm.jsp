<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>manager page</title>
</head>
<body>

<form action="noconfirm_search.dj" method="post">

	<select name="noconfirm">
		<option value="nickname">�г���</option>
		<option value="email">�̸���</option>
	</select>
	
	<input type="text" align="right" name="search">
	<input type="submit" align="right" value="�˻�">	
</form>



	<table border=1>
		<tr>
			<td>�г���</td>
			<td>�̸���</td>
			<td>���Գ�¥</td>
		</tr>
	<c:if test="${setting == 1}">
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.nickname}</td>
				<td>${list.email}</td>
				<td>${list.join}</td>
			</tr>
		</c:forEach>
	</c:if>
	
	
	<c:if test="${setting == 2}">
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.nickname}</td>
				<td>${list.email}</td>
				<td>${list.join}</td>
			</tr>
		</c:forEach>
	</c:if>
	
	</table>

</body>
</html>