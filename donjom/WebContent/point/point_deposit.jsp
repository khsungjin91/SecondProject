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

<h2> 충전환급 </h2>

<ul>
	<li><a href="point_deposit.dj">충전</a></li>
	<li><a href="point_withdrow.dj">환급</a></li>
	<li><a href="point_history.dj">충전/환급내역</a></li>
</ul>

충전하기
보유예치금: 원													<br/>
계좌이체 후 충전 반영 시간은 <b>약 1~10분</b> 사이 입니다. 					<br/>
충전을 위해 <b>본인인증</b>과 <b>은행정보</b> 등록이 필요합니다.				<br/>
예치금은 가상 계좌에 원화를 <b>충전한 만큼 1:1</b>로 이루어집니다.				<br/>
23:00 ~ 00:30분 사이에는 <b>은행망 점검 시간</b>으로 이체가 불가할 수 있습니다.	<br/>


<c:if test="${dto.socialnum == null}">

-가상계좌를 할당받으려면 회원인증이 필요합니다.	<br/>
-원천징수 정보까지 입력하셔야 최종인증이 완료됩니다.	<br/>
(회원인증 후에도 가상계좌 생성이 불가하다면, 이메일 또는 전화로 문의 바랍니다.) <br/>

<input type="button" value="인증하러가기" onclick="javascript:window.location='setting_cert_person.dj'">

</c:if>


<c:if test="${dto.socialnum != null}">
충전계좌정보	<br/>
은행명  ${dto.bankcode}		<br/>
예금주  ${dto.name}			<br/>
<%--계좌번호  ${dto.randomacc}--%>	<br/>
입금자명  ${dto.name}		<br/>

<form action="point_charging.dj" method="post">
<input type="text" name="ch_price">
<input type="submit" value="충전하기">
</form>

※ 위 가상계좌 번호로 투자금을 이체하시면 충전된 예치금으로 투자가 가능합니다.
</c:if>

</body>
</html>