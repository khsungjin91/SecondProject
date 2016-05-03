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

<a href="setting.dj">기본정보 수정</a>	<br/><br/>

<ul>
	<li>내정보</li>	
	<li><a href="dashboard.dj">대시보드</a></li>
	<li><a href="invest_history.dj">투자내역</a></li>
	<li><a href="laon_history.dj">대출내역</a></li>
	<li><a href="point.dj">충전/환급</a></li>
	<li><a href="notification.dj">알림메세지</a></li>
	<li><a href="setting.dj">설정</a></li>
	<li><a href="helf.dj">도움말</a></li>	
	<li><a href="logout.dj">로그아웃</a></li>			
</ul>

설정 		<br/>

<a href="setting.dj">기본정보</a>
<a href="setting_cert_person.dj">인증센터</a>
<a href="setting_session_history.dj">로그인내역</a>			<br/>

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
</body>
</html>