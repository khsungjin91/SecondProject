<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>${dto.p_name}</h2>

<div style="float: left;">
<table border="1">
<tr>
<td>��ǰ�ڵ�</td><td>�������</td><td>�����ð�</td>
</tr>
<tr>
<td>${dto.p_code}</td><td>${dto.p_category}</td><td>Time</td>
</tr>
</table>


�����û����
<table border="1">
<tr>
<td>����</td><td>����</td><td>���ͷ�</td><td>����ݾ�</td><td>��ȯ���</td><td>����ȯ��</td>
</tr>
<tr>
<td>${dto.p_category}</td><td>${dto.p_term}</td><td>${dto.p_rate}</td><td>${dto.p_price}</td><td>${dto.p_way}</td><td>��ȯ��</td>
</tr>
<tr>
<td colspan="6">�������</td>
</tr>
<tr>
<td colspan="6">${dto.p_purpose}</td>
</tr>
<c:forEach var="conlist" items="${contentlist}">
<tr>
<td colspan="6">${conlist.p_content}</td>
</tr>
</c:forEach>
<tr>
<td colspan="6">
<c:forEach var="filelist" items="${filelist}">
<a href="/donjom/file/${filelist.p_file}">${filelist.p_file}/</a>
</c:forEach>
</td>
</tr>

</table>
</div>


<div style="float: left;">
<table border="1">
<tr><td>���ڵȱݾ�/${dto.p_price}</td></tr>
<tr><td>������ �ο���</td></tr>
<tr><td>��ȯ���</td></tr>
<tr><td>${dto.p_way}</td></tr>
<tr><td>���ͷ�</td></tr>
<tr><td>${dto.p_rate}</td></tr>
<tr><td>���ڱⰣ</td></tr>
<tr><td>${dto.p_term}</td></tr>
<tr><td>�ݵ��Ⱓ : 1����</td></tr>
<tr><td>��ȯ�� : �ſ�${dto.p_repayday}�� + 5��</td></tr>
<tr>
<c:if test="${dto.p_success == 'success'}">
<td><input type="button" value="�ݵ�����"></td>
</c:if>
<c:if test="${dto.p_success == 'doing'}">
<td><input type="button" value="���ڹ̸�����" onclick="javascript:window.location='fund_ready.dj?p_code=${dto.p_code}'"></td>
</c:if>
<c:if test="${dto.p_success == 'fail'}">
<td><input type="button" value="�ݵ�����"></td>
</c:if>
</tr>

</table>
</div>


</body>
</html>