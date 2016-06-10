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
  
  
  function changeAcc(){
	  
	 	$.ajax({
	 		type: "post",
	 		url:"/donjom/change_bank.dj",
	 		success: function bank(a){ $("#changehere").html(a); },
	 		error : whenError
	 	});
  }
 	
  
  function check(){
	  
	  if(!$("#name").val()){
		  alert("이름을 입력해주세요.");
		  $("#name").focus();
		  return false;
	  }
	  if(!$("#birth").val()){
		  alert("생년월일을 입력해주세요.");
		  $("#birth").focus();
		  return false;
	  }
	  if(!$(":input:radio[name=gender]:checked").val()){
		 alert("성별을 선택해주세요.");
		 return false;
	  }
	  if(!$("#mobilenum").val()){
		  alert("전화번호를 입력해주세요.");
		  $("#mobilenum").focus();
		  return false;
	  }
	  if(!$("#bankcode").val()){
		  alert("은행명을 입력해주세요.");
		  $("#bankcode").focus();
		  return false;
	  }
	  if(!$("#bankaccnum").val()){
		  alert("계좌번호를 입력해주세요.");
		  $("#bankaccnum").focus();
		  return false;
	  }
	  
  }
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<c:if test="${sessionScope.memId == null}">
<script type="text/javascript">
alert("로그인 후 사용가능합니다.");
window.location="signIn.dj";
</script>
</c:if>

<jsp:include page="/WEB-INF/settingside.jsp"/>


<h2>개인정보</h2>	<br/>

<!-- 이름 생년월일 성별 휴대전화 은행 계좌번호 입력구간 -->

<!-- 입력한 경우 -->
<c:if test="${dto.name != null}">
이름		<input type="text" name="name" value="${dto.name}" disabled="disabled" >				<br/>
생년월일	<input type="text" name="birth" value="${dto.birth}" disabled="disabled">				<br/>
성별		<c:if test="${dto.gender =='woman'}">
		<input type="text" name="gender" value="여자" disabled="disabled">			<br/>
		</c:if>
		<c:if test="${dto.gender == 'men'}">
		<input type="text" name="gender" value="남자" disabled="disabled">			<br/>
		</c:if>
<c:if test="${memdto.confirm == 1}">
메일인증완료상태입니다.			<br/>
</c:if>
휴대폰번호	<input type="text" name="mobilenum" value="${dto.mobilenum}" disabled="disabled">		
<!-- ajax 사용 은행 정보만 바뀌게 해놨음 -->
<jsp:include page="/profile/bankbody.jsp"></jsp:include>
</c:if>

<!-- 입력안한경우  -->
<c:if test="${dto.name == null}">
<form action="setting_cert_pro.dj" method="post" name="userinput">	

이름		<input type="text" name="name" id="name">															<br/>
생년월일	<input type="text" name="birth" id="birth" maxlength="8">	&nbsp;	예) 20011203		<br/>
성별		남자<input type="radio" name="gender"  id="gender" value="men">
		여자<input type="radio" name="gender"  id="gender" value="woman">										<br/>

<c:if test="${memdto.confirm == 0}">
<div id="mailback">
메일인증하기<input type="text" value="${memdto.email}" name="checkemail" id="checkemail">						
<input type="button" value="인증하기" id="button">
</div>	
</c:if>
<c:if test="${memdto.confirm == 1}">
메일인증완료상태입니다.																					<br/>
</c:if>														
휴대폰번호	<input type="text" name="mobilenum" id="mobilenum" maxlength="11">						<br/>
은행명 <select name="bankcode" id="bankcode">
	<option value="신한은행">신한은행</option>
	<option value="우리은행">우리은행</option>
	<option value="농협은행">농협은행</option>
	<option value="기업은행">기업은행</option>
	<option value="국민은행">국민은행</option>
	<option value="하나은행">하나은행</option>
	</select>																					<br/>
계좌번호	<input type="text" name="bankaccnum" id="bankaccnum">									<br/>
<input type="submit" value="입력완료" onclick="return check()">									<br/>
</form>
</c:if>
※ 23:30~01:00 사이에는 은행 전산망 점검 시간으로 이용에 제한이 있을수 있습니다.										<br/>
※ 환급계좌 변경은 SMS 본인인증 후 가능합니다																	<br/><br/>

<!-- 주민등록번호와 주소 입력 구간 -->

투자자 원천징수 정보																					<br/>
※ 투자를 하시려면 아래 정보를 입력하시기 바랍니다.	
<!-- 입력한 경우 -->																				<br/>
<c:if test="${dto.socialnum != null}">
주민등록번호<input type="text" name="socialnum" value="${socialnum}" disabled="disabled">			<br/>
주소		<input type="text" name="address" value="${dto.address}" disabled="disabled">			<br/>
</c:if>

<!-- 입력안한 경우 -->
<c:if test="${dto.socialnum == null}">
<form action="setting_detail_pro.dj" method="post">
주민등록번호<input type="text" name="socialnum" maxlength="13"> &nbsp; 예)8910121234567				<br/>
주소		<input type="text" name="address">	&nbsp; 예) 서울시 강남구 역삼동	230-10						<br/>
<input type="submit" value="입력완료">																<br/>
</form>
</c:if>


※ 원천징수정보란?
빌리의 투자자가 투자 수익이 발생한 경우, 투자자가 국가에 부담할 세액을 빌리가 미리 국가를 대신하여 징수하고, 투자자의 소득 정보를 신고하기 위해 수집하는 정보 입니다.	<br/>
원천징수정보 미입력 시 빌리에서 투자가 불가 합니다.
</body>
</html>