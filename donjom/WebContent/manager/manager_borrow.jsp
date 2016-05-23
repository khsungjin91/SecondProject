<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>managerborrow</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
	//���ڹ�ư
	$(document).ready(function() {
		$("#invest_button").click(function() {
			callAjax();
		});
	});
	function callAjax() {

		$.ajax({
			type : "post",
			url : "/donjom/manager_view.dj",
			data : {
				email : $("#email").val()
			},
			success : test,
			error : whenError
		});
	}
	function test(aaa) {
		$("#borrow").html(aaa);
		console.log(resdata);
	}
	function whenError() {
		alert("Error2");
	}
</script>

</head>
<body>
	<c:if test="${count !=0}">
		<input type="hidden" id="email" value="${email}" />

		<div id="borrow">
			<input type="button" value="����" id="invest_button" /> <input
				type="button" value="����" id="borrow_button" />
			<table border="1">
				<tr>
					<td>ī�װ�</td>
					<td>�����</td>
					<td>�������</td>
					<td>����Ⱓ</td>
					<td>��ȯ��</td>
					<td>��ȯ���</td>
					<td>����</td>
					<td>����</td>
					<td>�������</td>
					<td>������</td>
					<td>����</td>
					<td>��������</td>
					<td>��������</td>
					<td>�����û��</td>
					<td>��������</td>

				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.br_category}</td>
						<td>${list.br_sum}����</td>
						<td>${list.br_object}</td>
						<td>${list.br_term}����</td>
						<td>${list.br_hopeday}��</td>
						<td>${list.br_way}</td>
						<td>${list.br_work}</td>
						<td>${list.br_job}</td>
						<td>${list.br_employ}</td>
						<td>${list.br_ycomein}����</td>
						<td>${list.br_mavg}����</td>
						<td>${list.br_mrepay}����</td>
						<td>${list.br_mlockpay}����</td>
						<td>${list.br_date}</td>
						<td>${list.success}</td>

					</tr>
				</c:forEach>
				<tr>�� ����� :${sum}����
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${count ==0}">
		<input type="hidden" id="email" value="${email}" />

		<div id="borrow">
			<input type="button" value="����" id="invest_button" /> <input
				type="button" value="����" id="borrow_button" />
			<h2>���� ������� �����ϴ�.</h2>
	</c:if>
</body>
</html>