<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<table border="1">
		<tr>
			<td> 뉴스이미지 </td>
			<td> <input type="file" name="image" > </td>

		</tr>
		<tr>
			<td> 뉴스사이트명 </td>
			<td> <input type="text" name="sitename" value="${news.sitename}"> </td>
		</tr>
		<tr> 
			<td> 뉴스제목 </td>
			<td> <input type="text" name="title" value="${news.title}"> </td>
		</tr>
		<tr>
			<td> 뉴스내용요약 </td>
			<td> <input type="text" name="content" value="${news.content}"> </td>
		</tr>
		<tr>
			<td> 자세히 보기 </td>
			<td> <input type="text" name="site" value="${news.site}"> </td>
		</tr>
	</table>
	
</body>
</html>