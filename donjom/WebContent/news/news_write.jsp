<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 언론 관리자 페이지 </title>
</head>
<body>
<h2> 언론 </h2>
	
	<input type="text" name="serch">
	<input type="button" value="검색">
	
	<form action="news_write.dj" method="post" enctype="multipatr/form-data">
		
	<table border="1">
		<tr>
			<td> 뉴스이미지 </td>
			<td> <input type="file" name="image"> </td>

		</tr>
		<tr>
			<td> 뉴스사이트명 </td>
			<td> <input type="text" name="sitename"> </td>
		</tr>
		<tr> 
			<td> 뉴스제목 </td>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<td> 뉴스내용요약 </td>
			<td> <input type="text" name="content"> </td>
		</tr>
		<tr>
			<td> 자세히 보기 </td>
			<td> <input type="text" name="site"> </td>
		</tr>
	</table>
	<input type="submit" value="뉴스 저장하기">
	<input type="button" value="뉴스 수정하기" onclick="javascript:location.href='news_writePro.dj'">
	<input type="button" value="목록으로" onclick="javascript:location.href='news_manager.dj'">
	</form>

</body>
</html>