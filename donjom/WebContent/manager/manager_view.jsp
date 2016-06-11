<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>managerview</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
	//�����ư
	$(document).ready(function() {
		$("#borrow_button").click(function() {
			callAjax();
		});
	});
	function callAjax() {
		$.ajax({
			type : "post",
			url : "/donjom/manager_borrow.dj",
			data : {
				email : $("#email").val()
			},
			success : test,
			error : whenError
		});
	}

	function test(aaa) {
		$("#invest").html(aaa);
		console.log(resdata);
	}
	function whenError() {
		alert("Error1");
	}
</script>
</head>
<body>

	<c:if test="${count !=0}">
		<input type="hidden" id="email" value="${email}" />

		<div id="invest">
			<input type="button" value="����" id="invest_button" /> 
			<input type="button" value="����" id="borrow_button" />
			<table class="table">
				<tr>
					<td>��ǰ�̸�</td>
					<td>���ڱⰣ</td>
					<td>���ھ�</td>
					<td>���⳯¥</td>
					<td>������</td>
					<td>��ȯ���</td>
					<td>��������</td>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.i_pname}</td>
						<td>${list.i_times}����</td>
						<td>${list.i_invest}����</td>
						<td>${list.i_repayday}��</td>
						<td>${list.i_profit}%</td>
						<c:if test="${list.i_way==1}">
							<td>���� ���� ��ȯ</td>
						</c:if>
						<c:if test="${list.i_way==0}">
							<td>������ �յ� ��ȯ</td>
						</c:if>
						<td>${list.i_success}</td>
					</tr>
					
				</c:forEach>
				<tr>�� ���ھ� : ${sum}����
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${count==0}">
		<input type="hidden" id="email" value="${email}" />

		<div id="invest">
			<input type="button" value="����" id="invest_button" /> <input
				type="button" value="����" id="borrow_button" />
			<h2>���� ���ڰ��� �����ϴ�.</h2>
	</c:if>
</body>
</html>