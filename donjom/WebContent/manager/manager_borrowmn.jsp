<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>borrowmn</title>
</head>
<body>

	<table border="1">
		<tr>
			<td>�̸�</td>
			<td>����</td>
			<td>�ڵ�����ȣ</td>
			<td>����</td>
			<td>�����û��¥</td>
			<td>�ɻ��ϱ�</td>
		</tr>

	<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.memname}</td>
				<td>${list.mememail}</td>
				<td>${list.memphone}</td>
				<td>${list.br_object}</td>
				<td>${list.br_date}</td>
				<td><input type="button" value="�ɻ��ϱ�"
					onclick="javascript:location.href='manager_evaluation_write.dj?mememail=${list.mememail}&no=${list.no}'">
				</td>
			</tr>
	</c:forEach>
		</table>
	</table>




</body>
</html>