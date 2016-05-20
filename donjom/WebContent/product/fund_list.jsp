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
 <a href="fundList_total.dj">사업자</a>
 <a href="fundList_total.dj">개인신용</a>
 <a href="fundList_total.dj">부동산</a>
 <a href="fundList_total.dj">담보대출</a>

<div>
<c:forEach var="list" items="${list}">
<a href="fundView.dj?p_code=${list.p_code}">
<div style="float: left;">
	<div>
		<img src="">
	</div>
	<div>
		<ul>
			<li>목표${list.p_price}만원  연${list.p_rate}%수익률</li>
			<li>${list.p_category} | 만기${list.p_term}개월</li>
			<li>%진행 ${list.p_people} 
			<c:if test = "${list.p_success == 'doing'}">
			/ 펀딩진행중
			</c:if>
			<c:if test = "${list.p_success == 'success'}">
			/ 펀딩성공
			</c:if>
			<c:if test = "${list.p_success == 'fail'}">
			/ 펀딩실패
			</c:if>
			
			</li>
		</ul>
	</div>
</div>
</a>
</c:forEach>
</div>

</body>
</html>