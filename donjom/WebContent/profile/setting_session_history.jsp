<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<a href="setting.dj">�⺻���� ����</a>	<br/><br/>

<ul>
	<li>������</li>	
	<li><a href="dashboard.dj">��ú���</a></li>
	<li><a href="invest_history.dj">���ڳ���</a></li>
	<li><a href="laon_history.dj">���⳻��</a></li>
	<li><a href="point_deposit.dj">����/ȯ��</a></li>
	<li><a href="notification.dj">�˸��޼���</a></li>
	<li><a href="setting.dj">����</a></li>
	<li><a href="helf.dj">����</a></li>	
	<li><a href="logout.dj">�α׾ƿ�</a></li>			
</ul>

���� 		<br/>

<a href="setting.dj">�⺻����</a>
<a href="setting_cert_person.dj">��������</a>
<a href="setting_session_history.dj">�α��γ���</a>			<br/>

<h2>�α��γ���</h2>

<table>
<tr>
<td>�ð�</td><td>Ȱ��</td><td>IP�ּ�</td><td>��ġ</td>
</tr>
<c:forEach var="session" items="${session}">
<tr>
<td>${session.time}</td>
<td>${session.move}</td>
<td>${session.ip}</td>
<td>${session.place}</td>
</tr>
</c:forEach>
</table>
</body>
</html>