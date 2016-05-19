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
function check(){
	
var user = document.userinput;
var price = ${dto.p_price};
var invest = ${dto.p_invest};
var mi = price - invest;
var limit = ${limit};

if(!user.amount.value){
	alert("투자금액을 입력해 주세요");
	user.amount.focus();
	return false;
}
if(user.amount.value == '0'){
	alert("투자금액은 0이 될 수 없습니다.");
	user.amount.focus();
	return false;
}
if(user.amount.value > limit){
	alert("최대 투자 가능 금액은"+limit+"만원 입니다.");
	user.amount.focus();
	return false;
}
if(user.amount.value > mi){
	alert("대출가능금액을 초과합니다 \n\n더 낮은 금액으로 투자해주세요.");
	user.amount.focus();
	return false;
}

}
</script>
</head>
<body>

<h2>${dto.p_name}</h2>

<form action="fund_ready.dj" method="post" name="userinput">
<input type="hidden" name="email" value="${email}">
<div style="float: left;">
<table border="1">
<tr>
<td>상품코드</td><td>대출목적</td><td>남은시간</td>
</tr>
<tr>
<td>${dto.p_code}</td><td>${dto.p_category}</td><td>Time</td>
</tr>
</table>

<input type="hidden" value="${dto.p_code}" name="p_code">

대출신청내역
<table border="1">
<tr>
<td>구분</td><td>만기</td><td>수익률</td><td>대출금액</td><td>상환방식</td><td>월상환액</td>
</tr>
<tr>
<td>${dto.p_category}</td><td>${dto.p_term}개월</td><td>${dto.p_rate}%</td><td>${dto.p_price}만원</td><td>${dto.p_way}</td><td>${dto.p_mrepay}만원</td>
</tr>
<tr>
<td colspan="6">대출목적</td>
</tr>
<tr>
<td colspan="6">${dto.p_purpose}</td>
</tr>
<c:forEach var="conlist" items="${contentlist}">
<tr>
<td colspan="6">${conlist.p_content}</td>
</tr>
</c:forEach>
<tr>
<td colspan="6">
<c:forEach var="filelist" items="${filelist}">
<a href="/donjom/file/${filelist.p_file}">${filelist.p_file}/</a>
</c:forEach>
</td>
</tr>

</table>
</div>


<div style="float: left;">
<table border="1">
<tr><td>${dto.p_invest}만원/${dto.p_price}만원</td></tr>
<tr><td>투자자 인원수</td></tr>
<tr><td>${dto.p_people}명</td></tr>
<tr><td>상환방식</td></tr>
<tr><td>${dto.p_way}</td></tr>
<tr><td>수익률</td></tr>
<tr><td>${dto.p_rate}%</td></tr>
<tr><td>투자기간</td></tr>
<tr><td>${dto.p_term}개월</td></tr>
<c:if test = "${dto.p_success == 'doing' &&  check == 0 && When.When == 1}">
<tr><td>투자금액</td></tr>
<tr>
<td>
<input type="text" name="amount">만원
</td>
</tr>
</c:if>
<tr><td>펀딩기간 : 1주일</td></tr>
<c:if test="${dto.p_success == 'doing' && check == 0 && When.When == 1}">
<tr><td>최대투자가능금액</td></tr>
<tr><td>${limit}만원</td></tr>
</c:if>
<tr><td>상환일 : 매월${dto.p_repayday}일 + 5일</td></tr>
<tr>
<c:if test="${dto.p_success == 'doing' && When.When == 0}">
	<c:if test="${dto.p_success == 'doing' && When.WhenTUS == 2}">
		 <script type="text/javascript">
		    $(document).ready(function(){
		    	window.setInterval('callAjax()', 1000); //3초마다한번씩 함수를 실행한다..!! 
		    });
		    function callAjax(){
		    	 $.ajax({
		 	        type: "post",
		 	        url : "/donjom/timemelee.dj",
		 	        success: test,	// 페이지요청 성공시 실행 함수
		 	        error: whenError	//페이지요청 실패시 실행함수
		      	});
		    }
		    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
		        $("#time").html(aaa);
		    }
		    function whenError(){
		        alert("Error");
		    }
		  </script>

	</c:if>

<td>
	<div id="time">펀딩개시는 수요일입니다.</div>
</td>

</c:if>


<c:if test="${When.When == 1}">

<c:if test="${dto.p_success == 'doing' && check == 0}">
<td><input type="submit" value="투자미리보기" onclick="return check()"></td>
</c:if>

<c:if test="${dto.p_success == 'doing' && check != 0}">
<td><input type="button" value="투자완료"></td>
</c:if>

</c:if>

<c:if test="${dto.p_success == 'success'}">
<td><input type="button" value="펀딩성공"></td>
</c:if>

<c:if test="${dto.p_success == 'fail'}">
<td><input type="button" value="펀딩실패"></td>
</c:if>

</tr>

</table>
</div>
</form>

</body>
</html>