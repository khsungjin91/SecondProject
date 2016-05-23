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
	//투자버튼
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
			<input type="button" value="투자" id="invest_button" /> <input
				type="button" value="대출" id="borrow_button" />
			<table border="1">
				<tr>
					<td>카테고리</td>
					<td>대출액</td>
					<td>대출목적</td>
					<td>대출기간</td>
					<td>상환일</td>
					<td>상환방법</td>
					<td>업종</td>
					<td>직종</td>
					<td>고용형태</td>
					<td>연수익</td>
					<td>월급</td>
					<td>현재대출금</td>
					<td>월고정액</td>
					<td>대출신청일</td>
					<td>성공여부</td>

				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.br_category}</td>
						<td>${list.br_sum}만원</td>
						<td>${list.br_object}</td>
						<td>${list.br_term}개월</td>
						<td>${list.br_hopeday}일</td>
						<td>${list.br_way}</td>
						<td>${list.br_work}</td>
						<td>${list.br_job}</td>
						<td>${list.br_employ}</td>
						<td>${list.br_ycomein}만원</td>
						<td>${list.br_mavg}만원</td>
						<td>${list.br_mrepay}만원</td>
						<td>${list.br_mlockpay}만원</td>
						<td>${list.br_date}</td>
						<td>${list.success}</td>

					</tr>
				</c:forEach>
				<tr>총 대출액 :${sum}만원
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${count ==0}">
		<input type="hidden" id="email" value="${email}" />

		<div id="borrow">
			<input type="button" value="투자" id="invest_button" /> <input
				type="button" value="대출" id="borrow_button" />
			<h2>현재 대출건이 없습니다.</h2>
	</c:if>
</body>
</html>