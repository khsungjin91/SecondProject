<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div>

<div style="float: left; margin-left: 20px">
<div>회차</div>
<c:forEach var="refunds" items="${refunds}">
<div>1</div>
</c:forEach>
</div>

<div style="float: left; margin-left: 20px">
<div>상환금</div>
<c:forEach var="refunds" items="${refunds}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${refunds}" />원</div>
</c:forEach>
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${totaltotal}" />원</div>
</div>

<div style="float: left; margin-left: 20px">
<div>납입원금</div>
<c:forEach var="p_price" items="${p_price}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${p_price}" />원</div>
</c:forEach>
</div>

<div style="float: left; margin-left: 20px">
<div>이자</div>
<c:forEach var="interested" items="${interested}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${interested}" />원</div>
</c:forEach>
</div>

<div style="float: left; margin-left: 20px">
<div>수수료</div>
<c:forEach var="refunds" items="${refunds}">
<div>0원</div>
</c:forEach>
</div>

<div style="float: left; margin-left: 20px">
<div>세금</div>
<c:forEach var="taxed" items="${taxed}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${taxed}" />원</div>
</c:forEach>
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${taxtotal}" />원</div>
</div>

<div style="float: left; margin-left: 20px">
<div>실수령액</div>
<c:forEach var="realtotaled" items="${realtotaled}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${realtotaled}" />원</div>
</c:forEach>
</div>

</div>


</body>
</html>