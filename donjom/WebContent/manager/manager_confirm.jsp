<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>manager page</title>
</head>
<body>
	<select> 
		<option>ȸ���̸�</option>
		<option>����ȸ��/�Ϲ�ȸ��</option>
		<option>��ǰ�ڵ�</option>
		<option>��ȯ��</option>
		<option>��ȯ�Ϸ�</option>
		<option>��ü</option>
		<option>�ε�</option>
	</select>
	<input type="text" align="right">
	<input type="submit" value="�˻�" align="right">

	<table border=1>
		<tr>
			<td>ȸ���̸� </td>
			<td>ȸ���̸���</td>
			<td>�Ϲ�ȸ��/����ȸ��</td>
			<td>�������</td>
			<td>�ڵ�����ȣ</td>
			<td>ȸ�� �ŷ�����</td>
			<td>ȸ�� ���¹�ȣ</td>
			<td>ȸ�� �ֹι�ȣ</td>
			<td>ȸ�� �ּ�</td>
			<td>���� �ݾ�</td>
			<td>���� �ݾ�</td>
			<td>��ȯ �ݾ�</td>
			<td>ȯ�� �ݾ�</td>
			<td>ȸ�� ����</td>
			<td>�������</td>
		</tr>
		<c:forEach var="list1" items="${list1}">
		<tr>
		<td>${list1. }</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		
		
		
		
		</tr>
		</c:forEach>
	</table>

</body>
</html>