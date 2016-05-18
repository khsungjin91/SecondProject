<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
<table border="1">
<tr>
<td>회차</td><td>상환금</td><td>납입원금</td><td>이자</td><td>수수료</td><td>세금</td><td>실수령액</td>
</tr>
<tr>
<td>
<table>
<c:forEach var="count" items="${count}">
<tr>
<td>${count}</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="refunds" items="${refunds}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${refunds}" />원</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="p_price" items="${p_price}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${p_price}" />원</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="interested" items="${interested}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${interested}" />원</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="taxed" items="${taxed}">
<tr>
<td>0원</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="taxed" items="${taxed}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${taxed}" />원</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="realtotaled" items="${realtotaled}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${realtotaled}" />원</td>
</tr>
</c:forEach>
</table>
</td>
</tr>
<tr>
<td>합계</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totaltotal}" />원</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${borrowmoney}" />원</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${interesttotal}" />원</td>
<td>0원</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${taxtotal}" />원</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${supertotal}" />원</td>
</tr>
</table>

</div>
</body>
</html>