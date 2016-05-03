<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>

function checkIt(){
	
	if(!document.userinput.nickname.value){	
		alert("닉네임을 입력해주세요");
		document.userinput.nickname.focus();
		return false;
	}
	
	if(!document.userinput.pw.value){
		alert("현재비밀번호를 입력해주세요");
		document.userinput.pw.focus();
		return false;
	}
	
}

function pwcheck(){
	
	var f1 = document.userinput;
	
	var pw = f1.newpw.value;
	var pwch = f1.pwch.value;
	
	if(pw != pwch){
		document.getElementById("checkPwd").innerHTML = "<font color=red>비밀번호를 확인해주세요.</font>";	
	}else{
		
		document.getElementById("checkPwd").innerHTML = "<font color=green>비밀번호가 동일합니다.</font>";
	}
	
}

function open_win_noresizable (url, name) {
	var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
}

</script>
</head>
<body>


${dto.profile}		<br/>
${dto.nickname}		<br/>
${dto.email}		<br/>
가입일 ${dto.join}			<br/>	

<a href="setting.dj">기본정보 수정</a>	<br/><br/>

<ul>
	<li>내정보</li>	
	<li><a href="dashboard.dj">대시보드</a></li>
	<li><a href="invest_history.dj">투자내역</a></li>
	<li><a href="laon_history.dj">대출내역</a></li>
	<li><a href="point.dj">충전/환급</a></li>
	<li><a href="notification.dj">알림메세지</a></li>
	<li><a href="setting.dj">설정</a></li>
	<li><a href="helf.dj">도움말</a></li>	
	<li><a href="logout.dj">로그아웃</a></li>			
</ul>

설정 

<a href="setting.dj">기본정보</a>
<a href="setting_cert_person.dj">인증센터</a>
<a href="setting_session_history.dj">로그인내역</a>


<h2>회원정보</h2>

<form action="signup_modifyPro.dj" method="post" enctype="multipart/form-data" name="userinput">
닉네임 <input type="text" name="nickname" value="${dto.nickname}">		<br/>
이메일 ${dto.email}								<br/>
가입일 ${dto.join}									<br/>
<c:if test="${dto.profile == null}">			
프로필사진수정 <input type="file" name="save">		<br/>
</c:if>
<c:if test="${dto.profile != null}">	
<input type="hidden" value="${dto.profile}" name="profile">	
<img src="/save/${dto.profile}">				<br/>
</c:if> 
추천인이메일 <input type="text" name="goodemail">	<br/>

비밀번호변경 										<br/>
새비밀번호 <input type="password" name="newpw">			<br/>
새비밀번호 확인 <input type="password" name="pwch" onkeyup="pwcheck()">	<br/>
<div id="checkPwd">비밀번호를 확인해주세요</div>
현재비밀번호 <input type="password" name="pw">			<br/>
※보안을 위해 정보수정시 현재 비밀번호를 입력해주세요.			<br/>

<input type="submit" value="수정" onclick="return checkIt()">				<br/><br/>
</form>

알림설정
<form action="signup_modifyPro2.dj" method="post" enctype="multipart/form-data">
<c:if test="${dto.snsreceive == 'on'}">
SNS 수신동의<input type="checkbox" name="snsreceive" checked="checked">			<br/>
</c:if>
<c:if test="${dto.snsreceive != 'on'}">
SNS 수신동의<input type="checkbox" name="snsreceive">			<br/>
</c:if>
<c:if test="${dto.emailreceive == 'on'}">
EMAILL 수신동의<input type="checkbox" name="emailreceive" checked="checked">		<br/><br/>
</c:if>
<c:if test="${dto.emailreceive != 'on'}">
EMAILL 수신동의<input type="checkbox" name="emailreceive">		<br/><br/>
</c:if>

<input type="submit" value="확인">
</form>

* DJ서비스를 더이상 원하지 않을 경우
<input type="button" value="삭제" onClick="javascript:open_win_noresizable('signup_checkPw.dj?email=${dto.email}')">

</body>
</html>