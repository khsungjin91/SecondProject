<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� ����</title>
</head>
<body>
	<form action="manager_notice.dj">
	<table>
		<tr>
			<td> ���� </td>
			<td> �ۼ��� </td>
		</tr>
	</table>

		<input type="submit" value="����">
		<input type="button" value="����" onclick="javascript:location.href='manager_noticeDel.dj'">
		<input type="reset" value="���" onclick="javascript:location.href='manager_notice.dj'">
	</form>
</body>
</html>