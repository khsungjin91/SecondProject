<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>category page</title>
</head>
<body>
	<form method="post" action="manager_categoryPro.dj">
	카테고리 코드 : <input type="text" name="c_code"/>	<br />
	카테고리 이름 : <input type="text" name="c_name"/> <br /><br />
	<input type="submit" value="카테고리 추가"/>
	<input type="button" value="카테고리 수정" onclick="javascript:location.href='manager_categoryModify.dj'"/>
	<input type="button" value="카테고리 삭제" onclick="javascript:location.href='manager_categoryDel.dj'" >
	</form> 

	<br/>
	
	<table border="1">
		<tr>
			<td>카테고리 코드</td>
			<td>카테고리 이름</td>
		</tr>
	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.c_code} </td>
			<td>${list.c_name} </td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>