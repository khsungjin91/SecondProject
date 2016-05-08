<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

$(document).ready(function(){
    $("#button").click(function(){
        callAjax();
    });
  });
  
  function callAjax(){
	  
      $.ajax({
	        type: "post",
	        url : "/donjom/confirm.dj" ,
	        data: {	// url 페이지도 전달할 파라미터
	        	chemail : $('#checkemail').val(),
	        },
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
   	});
  }
  function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
      $("#mailback").html(aaa);
      console.log(resdata);
  }
  function whenError(){
      alert("Error");
  }

  
  
  function check(){
	  
	  var f1 = document.userinput;
	  
	  if(!f1.name.value){
		  alert("이름을 입력해주세요.");
		  f1.name.focus();
		  return false;
	  }
	  if(!f1.birth.value){
		  alert("생년월일을 입력해주세요.");
		  f1.birth.focus();
		  return false;
	  }
	  if(!f1.gender.checked){
		  alert("성별을 체크해주세요.");
		  f1.gender.focus();
		  return false;
	  }
	  if(!f1.mobilenum.value){
		  alert("전화번호를 입력해주세요.");
		  f1.mobilenum.focus();
		  return false;
	  }
	  if(!f1.bankcode.value){
		  alert("은행명을 입력해주세요.");
		  f1.bankcode.focus();
		  return false;
	  }
	  if(!f1.bankaccnum.value){
		  alert("계좌번호를 입력해주세요.");
		  f1.bankaccnum.focus();
		  return false;
	  }
	  
  }
</script>

</head>
<body>


<a href="setting.dj">기본정보 수정</a>	<br/><br/>

<ul>
	<li>내정보</li>	
	<li><a href="dashboard.dj">대시보드</a></li>
	<li><a href="invest_history.dj">투자내역</a></li>
	<li><a href="laon_history.dj">대출내역</a></li>
	<li><a href="point_deposit.dj">충전/환급</a></li>
	<li><a href="notification.dj">알림메세지</a></li>
	<li><a href="setting.dj">설정</a></li>
	<li><a href="helf.dj">도움말</a></li>	
	<li><a href="logout.dj">로그아웃</a></li>			
</ul>

설정 		<br/>

<a href="setting.dj">기본정보</a>
<a href="setting_cert_person.dj">인증센터</a>
<a href="setting_session_history.dj">로그인내역</a>			<br/>


<a href="setting_cert_person.dj">회원인증</a>
<a href="setting_cert_social.dj">소셜연동</a>			<br/>

<h2>개인정보</h2>	<br/>

<c:if test="${dto.name != null}">
이름		<input type="text" name="name" value="${dto.name}" disabled="disabled" >				<br/>
생년월일	<input type="text" name="birth" value="${dto.birth}" disabled="disabled">				<br/>
성별		<input type="text" name="gender" value="${dto.gender}" disabled="disabled">				<br/>
<c:if test="${memdto.confirm == 1}">
메일인증완료상태입니다.			<br/>
</c:if>
휴대폰번호	<input type="text" name="mobilenum" value="${dto.mobilenum}" disabled="disabled">		<br/>
<!-- ajax 사용 -->
은행명	<input type="text" name="bankcode" value="${dto.bankcode}" disabled="disabled">			<br/>
계좌번호	<input type="text" name="bankaccnum" value="${dto.bankaccnum}" disabled="disabled">		<br/>
<input type="button" value="은행 및 계좌 변경" onclick="">											<br/>
</c:if>



<c:if test="${dto.name == null}">
<form action="setting_cert_pro.dj" method="post" name="userinput">	
<input type="hidden" name="no" value="${no}">	
이름		<input type="text" name="name">															<br/>
생년월일	<input type="text" name="birth">														<br/>
성별		남자<input type="radio" name="gender" value="men">
		여자<input type="radio" name="gender" value="woman">										<br/>

<c:if test="${memdto.confirm == 0}">
<div id="mailback">
메일인증하기<input type="text" value="${memdto.email}" name="checkemail" id="checkemail">						
<input type="button" value="인증하기" id="button">
</div>	
</c:if>
<c:if test="${memdto.confirm == 1}">
메일인증완료상태입니다.	
</c:if>
																		
휴대폰번호	<input type="text" name="mobilenum">													<br/>
은행명	<input type="text" name="bankcode">														<br/>
계좌번호	<input type="text" name="bankaccnum">													<br/>
<input type="submit" value="입력완료" onclick="return check()">									<br/>
</form>
</c:if>
※ 23:30~01:00 사이에는 은행 전산망 점검 시간으로 이용에 제한이 있을수 있습니다.											<br/>
※ 환급계좌 변경은 SMS 본인인증 후 가능합니다																	<br/><br/>


투자자 원천징수 정보																					<br/>
※ 투자를 하시려면 아래 정보를 입력하시기 바랍니다.																<br/>
<c:if test="${dto.socialnum != null}">
주민등록번호<input type="text" name="socialnum" value="${dto.socialnum}" disabled="disabled">		<br/>
주소		<input type="text" name="address" value="${dto.address}" disabled="disabled">			<br/>
</c:if>

<c:if test="${dto.socialnum == null}">
<form action="setting_detail_pro.dj" method="post">
<input type="hidden" name="no" value="${no}">	
주민등록번호<input type="text" name="socialnum">													<br/>
주소		<input type="text" name="address">														<br/>
<input type="submit" value="입력완료">																<br/>
</form>
</c:if>


※ 원천징수정보란?
빌리의 투자자가 투자 수익이 발생한 경우, 투자자가 국가에 부담할 세액을 빌리가 미리 국가를 대신하여 징수하고, 투자자의 소득 정보를 신고하기 위해 수집하는 정보 입니다.	<br/>
원천징수정보 미입력 시 빌리에서 투자가 불가 합니다.
</body>
</html>