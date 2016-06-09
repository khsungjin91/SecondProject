<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${count == 0}">
미리보기는 상품이 올라가 뒤에 가능합니다.
</c:if>


<c:if test="${count == 1}">
<div>상품코드 : ${dto.code}</div>
<div>대출기간 : ${dto.term}개월</div>
<div>
대출방법 : 
<c:if test="${dto.way == 0}">
원리금 균등상환
</c:if>
<c:if test="${dto.way == 1}">
원금만기 일시상환
</c:if>
</div>
<div>대출이자 : 연 ${dto.rate}%</div>
<table border="1">
<tr>
<td>회차</td><td>상환일자</td><td>상환금</td><td>원금</td><td>이자</td><td>세금</td><td>실납입금</td><td>상환완료상태</td>
</tr>
<c:if test="${dto.back == 3}">
<tr>
<td colspan="8" align="center">대출에 실패 하셨습니다.</td>
</tr>
</c:if>
<c:if test="${dto.back == 1 && dto.back == 0}">
<c:forEach var="list" items="${list}" >
	<tr>
	<td>${list.no}</td>
	<td>${list.repayday}</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.refunds}"/>원</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}"/>원</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.interest}"/>원</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.tax}"/>원</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.total}"/>원</td>
	<td>
	
	<c:if test="${list.back == 0}">
	상환안됨
	</c:if>
	<c:if test="${list.back == 1}">
	상환됨
	</c:if>
	
	</td>
	</tr>
</c:forEach>
</c:if>
</table>
</c:if>

</body>
</html>