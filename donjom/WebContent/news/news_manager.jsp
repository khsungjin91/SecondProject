<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ��� ������ ������ </title>
</head>
<body>
<h2> ��� </h2>
<script type="text/javascript">
	function delCheck(value){
		if(value == "newsDel"
				)
		
	}

</script>
	<form action="news_write.dj">
	<table border="1">
		<tr>
			<td> ${list.image} </td>
		</tr>
		<tr>
			<td> ${list.sitename} </td>
		</tr>
		<tr> 
			<td> ${list.title} </td>
		</tr>
		<tr>
			<td> ${list.content} </td>
		</tr>
		<tr>
			<td> ${list.site} </td>
		</tr>
		<c:if test="list.size() <= 0">
			<tr>
				<td> ��ϵ� �Խù��� �����ϴ�.</td>
		</c:if>
	</table>
	<input type="button" value="���� �ø���" onclick="javascript:location.href='?currentPage= value="currentPage"/>';">
	<input type="button" value="���� �����ϱ�" onclick="javascript:location.href='/news_writePro.dj'">
	<input type="button" value="���� ����" onclick="javascrip:location.href='/news_deletePro.dj'">
	</form>

</body>
</html>