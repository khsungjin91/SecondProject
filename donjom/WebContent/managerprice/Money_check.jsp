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

<div>${dto.p_name}(${dto.p_code}) ������ �ο� (${dto.p_people} ��)</div>

<div>������ ����</div>
<table border="1">
<tr>
<td>�̸���</td><td>����</td><td>���� �ݾ�</td><td>���� �ð�</td>
</tr>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.email}</td><td>${list.i_memname}</td><td>${list.i_invest}����</td><td>${list.i_date}</td>
</tr> 
</c:forEach>
</table>

<input type="button" value="�۱��ϱ�" onclick="javascript:window.location='send_loanmoney.dj?p_code=${dto.p_code}'">

</body>
</html>