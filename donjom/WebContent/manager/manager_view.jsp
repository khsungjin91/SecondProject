<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>managerview save</title>

<script>
$(document).ready(function(){
	$("#invest").click(function(){ // id�� invest�ΰ��� ������ �� �Լ�����
		callAjax();
	});
});

function callAjax(){
	$.ajax({
		type: "post",
		url	: "/donjom/manager_borrow.dj",
		data: {
			no : $('#no').val(), // no���� no��� �̸����� bean�� �Ѱ��� 
		},
		success: test,
		error:whenError
	});
}
	
	
	
	
}





</script>










</head>
<body>
<table border=1>
	<tr>����</tr>
	<tr>
	<td>��ǰ�̸�</td>
	<td>��������</td>
	<td>���ڱⰣ</td>
	<td>���ھ� </td>
	</tr>
	<c:forEach var="list" items="${list}">
	<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	</tr>
	</c:forEach>
	<tr>�� ���ھ� : </tr>	
</table>
<table border=1> 



</table>

</body>
</html>