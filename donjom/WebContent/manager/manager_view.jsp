<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>managerview save</title>

<script>
$(document).ready(function(){
	$("#invest").click(function(){ // id가 invest인것을 눌렀을 때 함수실행
		callAjax();
	});
});

function callAjax(){
	$.ajax({
		type: "post",
		url	: "/donjom/manager_borrow.dj",
		data: {
			no : $('#no').val(), // no값을 no라는 이름으로 bean에 넘겨줌 
		},
		success: test,
		error:whenError
	});
}
	
	
	
	
}





</script>










</head>
<body>
<table border=1>
	<tr>투자</tr>
	<tr>
	<td>상품이름</td>
	<td>성공여부</td>
	<td>투자기간</td>
	<td>투자액 </td>
	</tr>
	<c:forEach var="list" items="${list}">
	<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	</tr>
	</c:forEach>
	<tr>총 투자액 : </tr>	
</table>
<table border=1> 



</table>

</body>
</html>