<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항 수정</title>
</head>
<body>
	<form action="manager_notice.dj">
	<table>
		<tr>
			<td> 제목 </td>
			<td> 작성일 </td>
		</tr>
	</table>

		<input type="submit" value="수정">
		<input type="button" value="삭제" onclick="javascript:location.href='manager_noticeDel.dj'">
		<input type="reset" value="목록" onclick="javascript:location.href='manager_notice.dj'">
	</form>
</body>
</html>