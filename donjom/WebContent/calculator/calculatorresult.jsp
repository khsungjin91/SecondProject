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
<td>ȸ��</td><td>��ȯ��</td><td>���Կ���</td><td>����</td><td>������</td><td>����</td><td>�Ǽ��ɾ�</td>
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
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${refunds}" />��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="p_price" items="${p_price}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${p_price}" />��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="interested" items="${interested}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${interested}" />��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="taxed" items="${taxed}">
<tr>
<td>0��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="taxed" items="${taxed}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${taxed}" />��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="realtotaled" items="${realtotaled}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${realtotaled}" />��</td>
</tr>
</c:forEach>
</table>
</td>
</tr>
<tr>
<td>�հ�</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totaltotal}" />��</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${borrowmoney}" />��</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${interesttotal}" />��</td>
<td>0��</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${taxtotal}" />��</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${supertotal}" />��</td>
</tr>
</table>

</div>
</body>
</html>