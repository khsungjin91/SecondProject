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
	<jsp:include page="/WEB-INF/header.jsp"/>

<c:if test="${sessionScope.memId == null }">

<script type="text/javascript">
alert("�α��� �� ��밡���մϴ�.");
window.location="signIn.dj";
</script>

</c:if>

<jsp:include page="/WEB-INF/settingside.jsp"/>


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

<div>${pagingHtml}</div>

</body>
</html>