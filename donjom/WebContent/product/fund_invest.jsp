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
<div>ȸ��</div>
<c:forEach var="refunds" items="${refunds}">
<div>1</div>
</c:forEach>
</div>

<div style="float: left; margin-left: 20px">
<div>��ȯ��</div>
<c:forEach var="refunds" items="${refunds}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${refunds}" />��</div>
</c:forEach>
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${totaltotal}" />��</div>
</div>

<div style="float: left; margin-left: 20px">
<div>���Կ���</div>
<c:forEach var="p_price" items="${p_price}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${p_price}" />��</div>
</c:forEach>
</div>

<div style="float: left; margin-left: 20px">
<div>����</div>
<c:forEach var="interested" items="${interested}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${interested}" />��</div>
</c:forEach>
</div>

<div style="float: left; margin-left: 20px">
<div>������</div>
<c:forEach var="refunds" items="${refunds}">
<div>0��</div>
</c:forEach>
</div>

<div style="float: left; margin-left: 20px">
<div>����</div>
<c:forEach var="taxed" items="${taxed}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${taxed}" />��</div>
</c:forEach>
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${taxtotal}" />��</div>
</div>

<div style="float: left; margin-left: 20px">
<div>�Ǽ��ɾ�</div>
<c:forEach var="realtotaled" items="${realtotaled}">
<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${realtotaled}" />��</div>
</c:forEach>
</div>

</div>


</body>
</html>