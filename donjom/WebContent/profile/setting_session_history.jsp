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
alert("로그인 후 사용가능합니다.");
window.location="signIn.dj";
</script>

</c:if>

<jsp:include page="/WEB-INF/settingside.jsp"/>


<h2>로그인내역</h2>

<table>
<tr>
<td>시각</td><td>활동</td><td>IP주소</td><td>위치</td>
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