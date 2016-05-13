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
	<form action="manager_evaluation_search.dj" method="post">
		<select name="evaluation">
			<option value="e_memid">���̵�</option>
			<option value="e_memname">�̸�</option>
			<option value="e_result">�ɻ� ���</option>
		</select> 
		<input type="text" align="right" name="search" /> 
		<input type="submit" value="�˻�" align="right" /> 
	</form>
	
	<c:if test="${count != 0}">
		<table border="1">
			<tr>
				<td>���̵�</td>
				<td>�̸�</td>
				<td>����</td>
				<td>���ü ����</td>
				<td>���ü ���ε��</td>
				<td>���� ����</td>
				<td>�ɻ� ����</td>
				<td>�ɻ� ���</td>
			</tr>
			<c:if test="${setting ==1 }">
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.e_memid}</td>
					<td>${list.e_memname}</td>
					<td>${list.e_document}</td>
					<td>${list.e_cphave}</td>
					<td>${list.e_cpfile}</td>
					<td>${list.e_doccount}</td>
					<td>${list.e_content}</td>
					<td>${list.e_result}</td>
					</tr>
			</c:forEach>
			</c:if>
			
			<c:if test="${setting ==2}">
			<c:forEach var="list" items="${list}">
				<tr>
				<td>${list.e_memid}</td>
				<td>${list.e_memname}</td>
				<td>${list.e_document}</td>
				<td>${list.e_cphave}</td>
				<td>${list.e_cpfile}</td>
				<td>${list.e_doccount}</td>
				<td>${list.e_content}</td>
				<td>${list.e_result}</td>
				</tr>			
			</c:forEach>
			</c:if>
		</table>
	</c:if>
	<c:if test="${count == 0}">
	���� �ɻ�Ϸ�� �׸��� �����ϴ�. 	
	</c:if>

</body>
</html>