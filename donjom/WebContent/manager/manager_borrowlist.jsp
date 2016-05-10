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

<h2>대출 리스트</h2>

<table>
<tr>
<td>회원번호</td><td>대출목적</td><td>대출등록일자</td>
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