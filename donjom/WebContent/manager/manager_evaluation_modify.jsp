<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>evaluation write</title>
</head>
<body>
	<div>
		<center>
			<b> ${edto.e_memname}���� ���� ����(����)</b>
			<form action="manager_evaluation_update.dj" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<td>ID :${edto.e_memid}</td>
					</tr>
					<tr>
						<td width="70" align="center" colspan="4">
						�ɻ系��<textarea name="e_content" rows="13" cols="100">${edto.e_content}</textarea>
						</td>
					</tr>
					<tr><td>
					���ü ���� ���� : ${edto.e_cphave}
					<select name="e_cphave">
					<c:if test="${edto.e_cphave == null}">
					<option value = '���ü Ȯ�οϷ�'>���ü Ȯ�οϷ� </option>
					<option value = 'Ȯ�� ����'>Ȯ�� ����</option>
					<option value="���ü ����">���ü ����</option>
					</c:if>
					<c:if test="${edto.e_cphave == '���ü Ȯ�οϷ�'}">
					<option value = '���ü Ȯ�οϷ�'>���ü Ȯ�οϷ� </option>
					<option value = 'Ȯ�� ����'>Ȯ�� ����</option>
					<option value="���ü ����">���ü ����</option>
					</c:if>
					<c:if test="${edto.e_cphave == 'Ȯ�� ����'}">
					<option value = 'Ȯ�� ����'>Ȯ�� ����</option>
					<option value="���ü ����">���ü ����</option>
					<option value = '���ü Ȯ�οϷ�'>���ü Ȯ�οϷ� </option>
					</c:if>
					<c:if test="${edto.e_cphave == '���ü ����'}">
					<option value="���ü ����">���ü ����</option>
					<option value = '���ü Ȯ�οϷ�'>���ü Ȯ�οϷ� </option>
					<option value = 'Ȯ�� ����'>Ȯ�� ����</option>
					</c:if>
					</select> 
					</td></tr>
					
					<tr><td>
					���ü ���ε��: 
					<a href ="/donjom/file/${edto.e_cpfile}" >${edto.e_cpfile}</a>	
					<input type="file" name="cpfile"/>
					</td></tr>
					
					<tr><td>
					��Ÿ ���� : 
					<a href ="/donjom/file/${edto.e_document}">${edto.e_document}</a>
					<input type="file" name="document"/>
					</td></tr>
					
					<tr><td>			
					�� ���� ����: 
					<select name="e_doccount">
						<option value="${edto.e_doccount}">${edto.e_doccount}��(��������)</option>
						<option value="0">0��</option>
						<option value="1">1��</option>
						<option value="2">2��</option>
						<option value="3">3��</option>
						<option value="4">4��</option>
						<option value="5">5��</option>
					</select>
					���� ��� : ${edto.e_result}
					<select name="e_result">
						<option value="success">success</option>
						<option value ="fail">fail</option>					
					</select>
					</td></tr>
					
					<tr><td colspan="4" align="center">
						
						<input type="hidden" value="${edto.e_cpfile}" name="cpfile"/>
						<input type="hidden" value="${edto.e_document}" name="document"/>
						
						<input type="hidden" value="${edto.e_memname}" name="e_memname"/>
						<input type="hidden" value="${edto.no}" name="no"/>
						<input type="hidden" value="${edto.e_memid}" name="e_memid">
						<input type="submit"	value="�����Ϸ�" />
						
					</td></tr>
				</table>


			</form>


		</center>

	</div>



</body>
</html>