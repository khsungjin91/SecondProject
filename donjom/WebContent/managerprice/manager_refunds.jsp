<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
function Remittance(){
	$.ajax({
		type : "post",
		url : "/donjom/manager_remittance.dj",
		success : test,
		error : whenerror
	});
}

function test(a){
	$("#callback").html(a);
}

function whenerror(){
	alert("error");
}

</script>
</head>
<body>
<div id="callback">
<div>
	<ul>
		<li><input type="button" value="�۱ݰ���" onclick="Remittance()"></li>
		<li><input type="button" value="ȯ�ް���"></li>
	</ul>
</div>

<div>ȯ�޻�ǰ</div>
<table style="float: left">
<tr>
<td>��ǰ�ڵ�</td><td>��ǰ����</td><td>�����ѱݾ�</td><td>��������</td><td>����ȸ��</td><td>��ȯ��</td><td>�������ο�</td><td>�������̸�</td><td>����������</td><td>����ȯ��</td>
</tr>
<c:forEach var="listrt" items="${listrt}" varStatus="z">
<tr>
<td>${listrt.p_code}</td>
<td><a href="fundView.dj?p_code=${listrt.p_code}">${listrt.p_name}</a></td>
<td>${listrt.p_price}����</td>
<td>${listrt.p_rate}%</td>
<td>${listrt.p_term}ȸ</td>
<td>${listrt.p_repayday}��</td>
<td>${listrt.p_people}��</td>
<td>${listrt.name}</td>
<td><a href="confirm_search.dj?confirm=i.no&search=${listrt.p_memeno}">������</a></td>
<td><input type="button" value="����ȯ��" onclick="javascript:window.location='Money_check_f.dj?p_code=${listrt.p_code}'"></td>
</c:forEach>
</table>
<table>
<tr>
<td>ȯ���ϴ� ��</td>
</tr>
<c:forEach var="possible" items="${possible}">
<tr>
<td>
<c:if test="${possible == 1}"><span style="color:green; ">ȯ����!</span></c:if>
<c:if test="${possible == 0}"><span style="color:red; ">������!</span></c:if>
</td>
</tr>
</c:forEach>
</table>

<div><hr color="black"></div>
<div>ȯ�޿Ϸ��ǰ</div>



</div>
</body>
</html>