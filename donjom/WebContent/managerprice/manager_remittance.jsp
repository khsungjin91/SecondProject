<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
function Refunds(){
	$.ajax({
		type : "post",
		url : "/donjom/manager_refunds.dj",
		success : test,
		error : whenerror
	});
	
	
}

function test(a){
	$("#callback").html(a);	
}

function whenerror(){
	alert("Error");
}






</script>
</head>
<body>
<div id="callback">
<div>
	<ul>
		<li><input type="button" value="�۱ݰ���"></li>
		<li><input type="button" value="ȯ�ް���" onclick="Refunds()"></li>
	</ul>
</div>

<div>�۱ݻ�ǰ</div>

<table>
<tr>
<td>��ǰ�ڵ�</td><td>��ǰ����</td><td>���ڵȱݾ�</td><td>�������ο�</td><td>�������̸�</td><td>����������</td><td>��������</td><td>�۱�</td>
</tr>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.p_code}</td>
<td><a href="fundView.dj?p_code=${list.p_code}">${list.p_name}</a></td>
<td>${list.p_invest}����/${list.p_price}����</td>
<td>${list.p_people}��</td>
<td>${list.name}</td>
<td><a href="confirm_search.dj?confirm=i.no&search=${list.p_memeno}">������</a></td>
<td>${list.p_success}</td>
<td>
<c:if test="${list.p_success eq 'success'}">
<input type="button" value="�۱ݹ̸�����" onclick="javascript:window.location='Money_check.dj?p_code=${list.p_code}'">
</c:if>
<c:if test="${list.p_success eq 'fail' || list.p_success eq 'doing'}">
�۱ݺҰ�
</c:if>
</td>
</tr>
</c:forEach>
</table>

<div style="margin-top: 100px">�۱��� ����</div>

<table>
<tr>
<td>��ǰ�ڵ�</td><td>��ǰ����</td><td>���ڵȱݾ�</td><td>�������ο�</td><td>�������̸�</td><td>����������</td>
</tr>
<c:forEach var="listrt" items="${listrt}">
<tr>
<td>${listrt.p_code}</td>
<td><a href="fundView.dj?p_code=${listrt.p_code}">${listrt.p_name}</a></td>
<td>${listrt.p_price}����</td>
<td>${listrt.p_people}��</td>
<td>${listrt.name}</td>
<td><a href="confirm_search.dj?confirm=i.no&search=${listrt.p_memeno}">������</a></td>
</c:forEach>
</table>

</div>
</body>
</html>