<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>���� ����Ʈ</h2>

<table>
<tr>
<td>ȸ����ȣ</td><td>�������</td><td>����������</td>
</tr>

<c:forEach var="list" items="${list}">
<tr>
<td>${list.memno}</td>
<td><a href="product_register.dj?no=${list.no}&br_object=${list.br_object}">${list.br_object}</a></td>
<td>${list.br_date}</td>
</tr>
</c:forEach>

</table>
</body>
</html>