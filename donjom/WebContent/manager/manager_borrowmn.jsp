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
	<div>
		<table border="1">
			<c:forEach var="list" items="${list}">
				<a href =""><img src="\donjom\save\30rabbitring.jpg" width="200"height="350"></a>
			</c:forEach>
		</table>
	</div>
	<div>
		<table border="1">
			<tr>
				<td height="200" valign="middle" width="200" " align="right">
					<b>���������&nbsp;:&nbsp;5%</b><br /> <b>��ȯ���� ����&nbsp;:&nbsp;3��</b><br />
					<b>��ȯ �Ϸ�� ����&nbsp;:&nbsp;5��</b><br />
				</td>
			</tr>
			
		</table>
	</div>
	
		
</body>
</html>