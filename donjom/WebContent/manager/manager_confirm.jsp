<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>confirm member page</title>
<script>
	function copen(){
		var con = form.confirm.value;
		var sear = form.search.value;
		
		var url ="confirm_search.dj?confirm="+con+"&search="+sear;
		window.open(url, "open", "width=1500, height=400")
	}
	$("#search").keypress(function(event){
		if(event.keyCode == 13){
			$('#lookup').focus().click();
			return false;
		}
	});
</script>
</head>
<body>
<form name="form" method="post" >
	<select name="confirm"> 
		<option value="name">ȸ���̸�</option>
		<option value="mobilenum">�ڵ�����ȣ</option>
		<option value="bankaccnum">���¹�ȣ</option>
		<option value="virtualacc">�������</option>
	</select>
	<input type="text" align="right" name="search" id="search"/>
	<input type="button" value="�˻�" onclick="copen()" id="lookup"/>
</form>
	<table class="table table-condensed">
		<tr>
			<td>ȸ���̸� </td>
			<td>�������</td>
			<td>�� ��</td>
			<td>�ڵ�����ȣ</td>
			<td>�� ��</td>
			<td>�������</td>
			<td>�ŷ�����</td>
			<td>���¹�ȣ</td>
			<td>�̸���</td>
			<td>���Գ�¥</td>
			<td>�����Ȳ</td>
			
		</tr>
	<c:if test="${setting == 1}">
	<c:forEach var="list" items="${list}">
		<tr>
		<td>${list.name}</td>
		<td>${list.birth}</td>
		<td>${list.gender}</td>
		<td>${list.mobilenum}</td>
		<td>${list.address}</td>
		<td>${list.randomacc}</td>
		<td>${list.bankcode}</td>
		<td>${list.bankaccnum}</td>
		<td>${list.email}</td>
		<td>${list.join}</td>
		<td>
		<input type="button" class="btn btn-block btn-success btn-xs" value="�󼼺���" onclick="javascript:location.href='manager_view.dj?email=${list.email}'"/>		
		</td>
		</tr>
	</c:forEach>
	</c:if>

	<c:if test="${setting == 2 }">
	<c:forEach var="list2" items ="${list}">
		<tr>
		<td>${list2.name}</td>
		<td>${list2.birth}</td>
		<td>${list2.gender}</td>
		<td>${list2.mobilenum}</td>
		<td>${list2.address}</td>
		<td>${list2.randomacc}</td>
		<td>${list2.bankcode}</td>
		<td>${list2.bankaccnum}</td>
		<td>${list2.email}</td>
		<td>${list2.join}</td>
		<td>
		<input type ="button" class="btn btn-block btn-success btn-xs" value="�󼼺���" onclick="javascript:location.href='manager_view.dj?email=${list2.email}'"/>
		</td>
	</c:forEach>	
	</c:if>
	</table>
</body>
</html>