<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 언론 목록 </title>
</head>
<body>
<table border="1">
	
	<c:forEach var="list" items="${list}">
	
		<tr>
			<td><img src="/donjom/newssave/${list.image}"/></td>
		</tr>
		<tr>
			<td> ${list.sitename}</td>
		</tr>
		<tr>
			<td> ${list.title}</td>
		</tr>
		<tr>
			<td> ${list.content}</td>
		</tr>
		<tr>
			<td> ${list.site} </td>
		</tr>
	</c:forEach>
	<tr>
		<td align="center">${pagingHtml} </td>
	</tr>

</table>
</body>
</html>