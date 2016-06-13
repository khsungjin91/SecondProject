<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>뉴스</title>
</head>
<body>
	<table>
		<tr>
		<td>${news.image}</td>
		<td>${news.sitename}</td>
		<td>${news.title}</td>
		<td>${news.content}</td>
		<td>${news.site}</td>
		<td>${news.reg}</td>
	</table>
		<input type="button" value="목록" onclick="javascript:location.href='news_manager.dj'">
		<input type="button" value="뉴스 수정" onclick="javascript:location.href='news_modify.dj?no=${news.num}'">
		<input type="button" value="뉴스 삭제" onclick="javascrip:location.href='news_delete.dj?no=${news.num}'">
</body>
</html>