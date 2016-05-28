<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
function Remittance(){
	$.ajax({
		type : "post",
		url : "/donjom/manager_remittance.dj",
		success : test,
		error : whenerror
	});
}

function test(a){
	$("#callback").html(a);
}

function whenerror(){
	alert("error");
}

</script>
</head>
<body>
<div id="callback">
<div>
	<ul>
		<li><input type="button" value="송금관련" onclick="Remittance()"></li>
		<li><input type="button" value="환급관련"></li>
	</ul>
</div>

<div>환급상품</div>
<table style="float: left">
<tr>
<td>상품코드</td><td>상품제목</td><td>대출한금액</td><td>대출이자</td><td>대출회차</td><td>상환일</td><td>총투자인원</td><td>대출자이름</td><td>대출자정보</td><td>이자환급</td>
</tr>
<c:forEach var="listrt" items="${listrt}" varStatus="z">
<tr>
<td>${listrt.p_code}</td>
<td><a href="fundView.dj?p_code=${listrt.p_code}">${listrt.p_name}</a></td>
<td>${listrt.p_price}만원</td>
<td>${listrt.p_rate}%</td>
<td>${listrt.p_term}회</td>
<td>${listrt.p_repayday}일</td>
<td>${listrt.p_people}명</td>
<td>${listrt.name}</td>
<td><a href="confirm_search.dj?confirm=i.no&search=${listrt.p_memeno}">상세정보</a></td>
<td><input type="button" value="이자환급" onclick="javascript:window.location='Money_check_f.dj?p_code=${listrt.p_code}'"></td>
</c:forEach>
</table>
<table>
<tr>
<td>환급하는 날</td>
</tr>
<c:forEach var="possible" items="${possible}">
<tr>
<td>
<c:if test="${possible == 1}"><span style="color:green; ">환급해!</span></c:if>
<c:if test="${possible == 0}"><span style="color:red; ">하지마!</span></c:if>
</td>
</tr>
</c:forEach>
</table>

<div><hr color="black"></div>
<div>환급완료상품</div>



</div>
</body>
</html>