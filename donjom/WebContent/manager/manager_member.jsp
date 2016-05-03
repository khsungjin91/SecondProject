<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			<td>대출자/투자자</td>
			<td>대출자 거래은행</td>
			<td>대출자 계좌번호</td>
			<td>대출 금액</td>
			<td>상환액</td>
			<td>회원 상태</td>
			<td>가상계좌</td>
	</table>

</body>
</html>