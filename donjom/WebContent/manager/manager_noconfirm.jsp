<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>member page</title>
</head>
<body>
	<form action="noconfirm_search.dj" method="post">
		<select name="noconfirm">
			<option value="nickname">닉네임</option>
			<option value="email">이메일</option>
		</select> 
		<input type="text" align="right" name="search"/> 
		<input type="submit" value="검색" align="right"/>
	</form>
	<table class="table table-condensed">
		<tr>
			<td>닉네임</td>
			<td>이메일</td>
			<td>가입날짜</td>
		</tr>
		<c:if test="${setting == 1 }">
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.nickname}</td>
					<td>${list.email}</td>
					<td>${list.join}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="11" align="center">${pagingHtml}</td></tr>
		</c:if>
		<c:if test="${setting == 2}">
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.nickname}</td>
					<td>${list.email}</td>
					<td>${list.join}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="11" align="center">${pagingHtml}</td></tr>
		</c:if>
	</table>
</body>
</html>




