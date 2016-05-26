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
<c:forEach var="count" items="${map.count}">
<tr>
<td>${count}</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="refunds" items="${map.refunds}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${refunds}" />��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="p_price" items="${map.p_price}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${p_price}" />��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="interested" items="${map.interested}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${interested}" />��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="taxed" items="${map.taxed}">
<tr>
<td>0��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="taxed" items="${map.taxed}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${taxed}" />��</td>
</tr>
</c:forEach>
</table>
</td>
<td>
<table>
<c:forEach var="realtotaled" items="${map.realtotaled}">
<tr>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${realtotaled}" />��</td>
</tr>
</c:forEach>
</table>
</td>
</tr>
<tr>
<td>�հ�</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.totaltotal}" />��</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.orgprice}" />��</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.interesttotal}" />��</td>
<td>0��</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.taxtotal}" />��</td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.supertotal}" />��</td>
</tr>
</table>
</div>
</body>
</html>