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
<script>

function checkprice(){
	
	var f1 = document.userinput;
	var receive = f1.re_price.value;
	var total = ${total}
	
	if(!f1.re_price.value){
		
		alert("환급액을 입력해주시기 바랍니다.");
		f1.re_price.focus();
		return false;
	}
	
	if(total < receive){
		
		alert("환급금액이 초과되었습니다");
		f1.re_price.focus();
		return false;
	}
	
}

</script>


<h2> 충전환급 </h2>

<ul>
	<li><a href="point_deposit.dj">충전</a></li>
	<li><a href="point_withdrow.dj">환급</a></li>
	<li><a href="point_history.dj">충전/환급내역</a></li>
</ul>


환급하기		<br/>

출금은 본인 명의의 계좌로만 가능합니다.		<br/>
 환급 수수료 : 무료					<br/>
 환급 최소 금액 : 1 원					<br/>
 환급 최대 금액 (1일 기준) : 무제한		<br/>
 환급 시각 : 신청 후 약 20분 이내에 계좌이체 (단, 서버 작업이 진행중일 때에는 반영금액이 지체될 수 있습니다.)		<br/>
 환급 신청시 고객님의 휴대폰으로 수신된 환급 요청 동의번호를 확인 후, 해당 번호를 0000 형식으로 답변하면 환급이 완료됩니다.	<br/><br/>

<c:if test="${dto.socialnum == null}">

-환급을 진행하시려면 회원인증이 필요합니다.			<br/>
-원천징수 정보까지 입력하셔야 최종인증이 완료됩니다.		<br/>
(회원인증 후에도 환급 진행이 불가하다면, 이메일 또는 전화로 문의 바랍니다.) <br/>

<input type="button" value="인증하러가기" onclick="javascript:window.location='setting_cert_person.dj'">

</c:if>

<c:if test="${dto.socialnum != null}">

<form action="point_refunds.dj" method="post" name="userinput">
환급가능액  ${total}원											<br/>
1일 환급한도 여분액 무제한											<br/>
환급액 <input type="text" name="re_price"/>원					 <br/>
은행명 ${dto.bankcode}											<br/>
환급계좌번호 ${dto.bankaccnum}									<br/>		
예금주 ${dto.name}												<br/>	
<input type="submit" value="환급하기" onclick="return checkprice()">							
</form>

<input type="button" value="환급알아보기" onclick="">			
</c:if>


</body>
</html>