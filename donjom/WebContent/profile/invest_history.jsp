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



<c:forEach var="list" items="${list}">
<div style="width: 800px; height: 200px">
<div>
<div>��ǰ�ڵ� : ${list.i_pcode}</div>
<div style="float: right;">��ȯ�Ⱓ : ����� ������</div>
</div>

<div>
<div>${list.i_pname}</div>
<div></div>
</div>

<table>
<tr>
<td>��ȯ������</td><td>ȸ��</td><td>���ͷ�(��)</td><td>���ڱݾ�</td><td rowspan="1">�ݵ�������</td>
</tr>
<tr>
<td>day</td><td>${list.i_times}</td><td>${list.i_profit}</td><td>${list.i_invest}</td><td></td>
</tr>
</table>

<ul>
	<li><a href="">���÷�����</a></li>
	<li><a href="">��ȯ��������</a></li>
</ul>
</div>
</c:forEach>

</body>
</html>