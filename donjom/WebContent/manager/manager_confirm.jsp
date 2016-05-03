<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>manager page</title>
</head>
<body>
	<select> 
		<option>회원이름</option>
		<option>인증회원/일반회원</option>
		<option>상품코드</option>
		<option>상환중</option>
		<option>상환완료</option>
		<option>연체</option>
		<option>부도</option>
	</select>
	<input type="text" align="right">
	<input type="submit" value="검색" align="right">

	<table border=1>
		<tr>
			<td>회원이름 </td>
			<td>회원이메일</td>
			<td>일반회원/인증회원</td>
			<td>생년월일</td>
			<td>핸드폰번호</td>
			<td>회원 거래은행</td>
			<td>회원 계좌번호</td>
			<td>회원 주민번호</td>
			<td>회원 주소</td>
			<td>대출 금액</td>
			<td>투자 금액</td>
			<td>상환 금액</td>
			<td>환불 금액</td>
			<td>회원 상태</td>
			<td>가상계좌</td>
		</tr>
		<c:forEach var="list1" items="${list1}">
		<tr>
		<td>${list1. }</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		
		
		
		
		</tr>
		</c:forEach>
	</table>

</body>
</html>