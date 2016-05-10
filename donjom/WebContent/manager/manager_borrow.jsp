<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>managerborrow</title>
</head>
<body>

	<div id="borrow">
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
			<tr>
			</tr>
		</table>
	</div>
</body>
</html>