<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>evaluation page</title>
</head>
<body>
	<form method="post" action="manager_evaluation.dj">
	<!-- �⺻ ����  -->
	�ź��� �纻 :  <input type="file" name="file"> <br/>
	�ǰ����� �ڰݵ�� Ȯ�μ� :  <input type="file" name="file"> <br/>
	�ǰ����� ����Ȯ�μ� :  <input type="file" name="file"> <br/>
	�ֹε�� ���ʺ�(�߱ޱ��� 1�����̳� �߱޿�) :  <input type="file" name="file"> <br/>
	
	<!-- �׿��� �ɻ� ���� -->
	���ü �������� Ȯ�� : <input type="checkbox"> ���ü Ȯ�� �Ϸ� 
						<input type="checkbox"> Ȯ�� ���� <br/>
	���ü ���ε�� Ȯ�� : <input type="text"> <br/>
	
	<input type="submit" value="����">
	<br/><br/>
	
	<select> 
		<option>ȸ�����̵�</option>
	</select>
	<input type="text">
	<input type="button" value="�˻�"> <br/>
	
	<table border="1">
		<tr>
			<td> ȸ�����̵� </td>
			<td> ���� ���� ����</td>
			<td> �ɻ�Ϸ� 	</td>
				<input type="button" value="�ɻ�Ϸ�"> <br/>
			<td> Ż������ </td>
				<input type="button" value="Ż�� ����"> <br/>
		</tr>				
	</table>
	</form>
</body>
</html>