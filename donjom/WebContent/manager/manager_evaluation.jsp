<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>evaluation page</title>
</head>
<body>
	<form action="evaluation_search.dj" method="post">
		<select name="evaluation">
			<option value="id">회원아이디</option>
			<option value="result">심사 결과</option>
		</select> <input type="text" align="right" name="search" /> <input
			type="submit" value="검색" align="right" /> <input type="button"
			value="심사평작성"
			onclick="javascript:location.href='manager_evaluation_write.dj'">

	</form>
	<c:if test="${count != 0}">
		<table border="1">
			<tr>
				<td>회원아이디</td>
				<td>대출 목적</td>
				<td>서류 존재 여부</td>
				<td>심사 결과</td>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.id}</td>
					<td>${list.document}</td>
					<td>${list.result}</td>
			</c:forEach>
		</table>
	</c:if>

	<c:if test="${count == 0}">
	심사할 대출건이 없습니다.
	</c:if>

</body>
</html>