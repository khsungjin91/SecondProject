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
<td>ȸ��</td><td>��ȯ��</td><td>���Կ���</td><td>����</td><td>������</td><td>����</td><td>�Ѿ�</td>
</tr>
<c:forEach var="refunds" items="${refunds}">
<tr>
<td></td>
<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${refunds}" />��</td>
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