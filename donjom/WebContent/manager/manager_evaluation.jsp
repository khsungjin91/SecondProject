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
			<option value="id">ȸ�����̵�</option>
			<option value="result">�ɻ� ���</option>
		</select> <input type="text" align="right" name="search" /> <input
			type="submit" value="�˻�" align="right" /> <input type="button"
			value="�ɻ����ۼ�"
			onclick="javascript:location.href='manager_evaluation_write.dj'">

	</form>
	<c:if test="${count != 0}">
		<table border="1">
			<tr>
				<td>ȸ�����̵�</td>
				<td>���� ����</td>
				<td>���� ���� ����</td>
				<td>�ɻ� ���</td>
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
	�ɻ��� ������� �����ϴ�.
	</c:if>

</body>
</html>