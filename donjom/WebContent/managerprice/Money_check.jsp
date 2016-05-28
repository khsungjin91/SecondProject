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

<div>${dto.p_name}(${dto.p_code}) 투자한 인원 (${dto.p_people} 명)</div>

<div>투자자 정보</div>
<table border="1">
<tr>
<td>이메일</td><td>성함</td><td>투자 금액</td><td>투자 시간</td>
</tr>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.email}</td><td>${list.i_memname}</td><td>${list.i_invest}만원</td><td>${list.i_date}</td>
</tr> 
</c:forEach>
</table>

<input type="button" value="송금하기" onclick="javascript:window.location='send_loanmoney.dj?p_code=${dto.p_code}'">

</body>
</html>