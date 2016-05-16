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

<c:if test="${sessionScope.memId == null}">
<script>
alert("로그인 후 사용가능합니다.");
window.location="signIn.dj";
</script>
</c:if>

<h2>알림메세지</h2>

<table>
<tr>
<td>메세지</td><td>시간</td>
</tr>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.m_content}</td>
<td>${list.m_time}</td>
</tr>
</c:forEach>
</table>



</body>
</html>