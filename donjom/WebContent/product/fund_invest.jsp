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

<table border="1">
<tr>
<td>회차</td><td>상환금</td><td>납입원금</td><td>이자</td><td>수수료</td><td>세금</td><td>총액</td>
</tr>
<c:forEach var="refunds" items="${refunds}">
<tr>
<td></td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${refunds}" />원</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</c:forEach>

</table>


</body>
</html>