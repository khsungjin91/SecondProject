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
<table>
<tr>
<td>상품코드</td><td>상품제목</td><td>투자된금액</td><td>총투자인원</td><td>대출자이름</td><td>대출자정보</td><td>성공여부</td><td>송금</td>
</tr>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.p_code}</td>
<td><a href="fundView.dj?p_code=${list.p_code}">${list.p_name}</a></td>
<td>${list.p_invest}/${list.p_price}</td>
<td>${list.p_people}</td>
<td>${list.name}</td>
<td><a href="confirm_search.dj?confirm=i.no&search=${list.p_memeno}">대출자정보</a></td>
<td>${list.p_success}</td>
<td>
<c:if test="${list.p_success eq 'success'}">
<input type="button" value="송금미리보기">
</c:if>
<c:if test="${list.p_success eq 'fail' || list.p_success eq 'doing'}">
송금불가
</c:if>
</td>
</tr>
</c:forEach>
</table>
</body>
</html>