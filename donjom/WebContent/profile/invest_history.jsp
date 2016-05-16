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



<c:forEach var="list" items="${list}">
<div style="width: 800px; height: 200px">
<div>
<div>상품코드 : ${list.i_pcode}</div>
<div style="float: right;">상환기간 : 대출금 지급전</div>
</div>

<div>
<div>${list.i_pname}</div>
<div></div>
</div>

<table>
<tr>
<td>상환예정일</td><td>회차</td><td>수익률(연)</td><td>투자금액</td><td rowspan="1">펀딩진행중</td>
</tr>
<tr>
<td>day</td><td>${list.i_times}</td><td>${list.i_profit}</td><td>${list.i_invest}</td><td></td>
</tr>
</table>

<ul>
	<li><a href="">상세플랜보기</a></li>
	<li><a href="">상환내역보기</a></li>
</ul>
</div>
</c:forEach>

</body>
</html>