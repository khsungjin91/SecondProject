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
	//대출버튼
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
			<input type="button" value="투자" id="invest_button" /> 
			<input type="button" value="대출" id="borrow_button" />
			<table class="table">
				<tr>
					<td>상품이름</td>
					<td>투자기간</td>
					<td>투자액</td>
					<td>만기날짜</td>
					<td>이자율</td>
					<td>상환방법</td>
					<td>성공여부</td>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.i_pname}</td>
						<td>${list.i_times}개월</td>
						<td>${list.i_invest}만원</td>
						<td>${list.i_repayday}일</td>
						<td>${list.i_profit}%</td>
						<c:if test="${list.i_way==1}">
							<td>원금 만기 상환</td>
						</c:if>
						<c:if test="${list.i_way==0}">
							<td>원리금 균등 상환</td>
						</c:if>
						<td>${list.i_success}</td>
					</tr>
					
				</c:forEach>
				<tr>총 투자액 : ${sum}만원
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${count==0}">
		<input type="hidden" id="email" value="${email}" />

		<div id="invest">
			<input type="button" value="투자" id="invest_button" /> <input
				type="button" value="대출" id="borrow_button" />
			<h2>현재 투자건이 없습니다.</h2>
	</c:if>
</body>
</html>