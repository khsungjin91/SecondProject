<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2> 언론 </h2>
	<form action="news_write.dj">
	<table border="1">
		<tr>
			<td> 뉴스이미지 </td>
			<td> <img alt="" src="C:\Users\user1\git\project1\donjom\WebContent\save\30rabbitring.jpg"> </td>
		</tr>
		<tr>
		
		
			<td> 뉴스사이트명 </td>
			<td> <input type="text" name="sitename"> </td>
		</tr>
		<tr> 
			<td> 뉴스제목 </td>
			<td> <input type="text" name="newstitle"> </td>
		</tr>
		<tr>
			<td> 뉴스내용요약 </td>
			<td> <input type="text" name="newscontent"> </td>
		</tr>
		<tr>
			<td> 자세히 보기 </td>
			<td> <a href="http://naver.com"></a></td>
		</tr>
	</table>
	<input type="submit" value="뉴스올리기">
	</form>
	</body>
</html>