<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>evaluation write</title>
</head>
<body>
	<div>
		<center>
			<b> ${dto.memname}���� ���� ����</b>
			<form action="manager_evaluation_writeinsert.dj" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<td>ID :${dto.mememail}</td>
					</tr>
					<tr>
						<td width="70" align="center" colspan="4">
						�ɻ系��<textarea name="e_content" rows="13" cols="100"></textarea>
						</td>
					</tr>
					<tr>
					<td>
					���ü ���� ���� : 
					<select name="e_cphave">
						<option value="���ü Ȯ�οϷ�">���ü Ȯ�� �Ϸ�</option>
						<option value="Ȯ�� ����">Ȯ�� ����</option>
						<option value="���ü ����">���ü ����</option>
					</select>
					���ü ���ε��: <input type="file" name="cpfile"/></td>
					</tr>
					<tr>
					<td>
					��Ÿ ���� : <input type="file" name="document"/>
					</td>
					</tr>
					<tr>
					<td>			
					�� ���� ����: 
					<select name="e_doccount">
						<option value="0">0��</option>
						<option value="1">1��</option>
						<option value="2">2��</option>
						<option value="3">3��</option>
						<option value="4">4��</option>
						<option value="5">5��</option>
					</select>
					���� ��� :
					<select name="e_result">
						<option value="success">���� ���� </option>
						<option value ="fail">���� ����</option>					
					</select>
					</td>
					</tr>
					<tr>			
						<td colspan="4" align="center">
						
						<input type="hidden" value="${dto.memname}" name="e_memname"/>
						<input type="hidden" value="${dto.no}" name="no"/>
						<input type="hidden" value="${dto.mememail}" name="e_memid">
						<input type="submit"	value="�ɻ�Ϸ�" />
						
						</td>
					</tr>
				</table>


			</form>


		</center>

	</div>



</body>
</html>