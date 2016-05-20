<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>repay page</title>
</head>
<body>

	<form action="">
		<select> 
		<option>펀딩진행중</option>
		<option>펀딩성공</option>
		<option>상환중</option>
		<option>상환완료</option>
		<option>펀딩실패</option>
		<option>연체</option>
		<option>부도</option>
		<option>투자취소</option>
		</select>
		<input type="text">
		<input type="button" value="검색"> <br/>

	<!-- 투자 -->
	<table border="1">
		<tr>
			<td>회원아이디</td>
			<td>상품코드</td>
			<td>투자</td>
			<td>상환상태</td>
			<td>
		</tr>
	</table>
	<br/><br/><br/>	
	
	<!-- 대출 -->
	<table border="1">	 
		<tr>
			<td>대출</td>
			<td>회원아이디</td>
			<td>상품코드</td>
			<td>상환상태</td>
		</tr>	
	</table>
</form>
</body>
</html>