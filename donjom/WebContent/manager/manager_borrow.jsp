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
			url : "/donjom/manager_view.dj?email='${email}'",
			success : test,
			error : whenError
		});
	}
	function test(aaa) {
		$("#borrow").html(aaa);
		console.log(resdata);
	}
	function whenError() {
		alert("Error");
	}
</script>

</head>
<body>
	<div id="borrow">
		<input type="button" value="투자" id="invest_button" /> <input
			type="button" value="대출" id="borrow_button" />
		<table>
			<tr>
				<td>상품이름</td>
				<td>성공여부</td>
				<td>대출기간</td>
				<td>대출액</td>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
			<tr>총 대출액 :
			</tr>
		</table>
	</div>
</body>
</html>