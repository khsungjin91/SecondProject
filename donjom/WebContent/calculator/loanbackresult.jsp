<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${count == 0}">
�̸������ ��ǰ�� �ö� �ڿ� �����մϴ�.
</c:if>


<c:if test="${count == 1}">
<div>��ǰ�ڵ� : ${dto.code}</div>
<div>����Ⱓ : ${dto.term}����</div>
<div>
������ : 
<c:if test="${dto.way == 0}">
������ �յ��ȯ
</c:if>
<c:if test="${dto.way == 1}">
���ݸ��� �Ͻû�ȯ
</c:if>
</div>
<div>�������� : �� ${dto.rate}%</div>
<table border="1">
<tr>
<td>ȸ��</td><td>��ȯ����</td><td>��ȯ��</td><td>����</td><td>����</td><td>����</td><td>�ǳ��Ա�</td><td>��ȯ�Ϸ����</td>
</tr>
<c:if test="${dto.back == 3}">
<tr>
<td colspan="8" align="center">���⿡ ���� �ϼ̽��ϴ�.</td>
</tr>
</c:if>
<c:if test="${dto.back == 1 && dto.back == 0}">
<c:forEach var="list" items="${list}" >
	<tr>
	<td>${list.no}</td>
	<td>${list.repayday}</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.refunds}"/>��</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}"/>��</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.interest}"/>��</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.tax}"/>��</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.total}"/>��</td>
	<td>
	
	<c:if test="${list.back == 0}">
	��ȯ�ȵ�
	</c:if>
	<c:if test="${list.back == 1}">
	��ȯ��
	</c:if>
	
	</td>
	</tr>
</c:forEach>
</c:if>
</table>
</c:if>

</body>
</html>