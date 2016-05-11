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

 <a href="fundList_total.dj">전체</a>
 <a href="">사업자</a>
 <a href="">개인신용</a>
 <a href="">부동산</a>
 <a href="">담보대출</a>

<div>
<c:forEach var="list" items="${list}">
<a href="">
<div style="float: left;">
	<div>
		<img src="">
	</div>
	<div>
		<ul>
			<li>목표${list.p_price}만원  연${list.p_rate}%수익률</li>
			<li>${list.p_category} | ${list.p_term}</li>
			<li>%진행 ${list.p_people} ${list.p_success}</li>
		</ul>
	</div>
</div>
</a>
</c:forEach>
</div>

</body>
</html>