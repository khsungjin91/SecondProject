<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<title>Insert title here</title>
<script>

function checkIt(){
	
	var pw = document.userinput.newpw.value;
	var pwch = document.userinput.pwch.value;
	
	
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
	if(pw != pwch){
		alert("새로운 비밀번호가 서로 맞지않습니다.");
		document.userinput.pwch.focus();
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

<c:if test="${sessionScope.memId == null }">

<script type="text/javascript">
alert("로그인 후 사용가능합니다.");
window.location="signIn.dj";
</script>

</c:if>


<div class="container warp">
<!-- warp시작 -->
  <div class="col-sm-3 mobile-profile-nav">
    <div class="user-info text-center radius">						
		<img src="/donjom/save/${dto.profile}" class="img-circle" width="90"  height="90">
		<p class="name txt-cut-line user-nick">${dto.nickname}	</p>
		<p class="email txt-cut-line">${dto.email}</p>
		<p class="date">가입일  ${dto.join}</p>
		<div class="btn-profile-edit hidden-xs">
			<button type="button" class="btn btn-success" onclick="location.href='setting.dj'"><i class="fa fa-cog"></i> 기본정보 수정</button>
		</div>
	</div>
	<ul class="menu menu-dashboard radius">
				<li class="dashboard"><a href ="dashboard.dj" class="active"><span class="glyphicon glyphicon-dashboard"></span> 대시보드</a></li>
				<li class="invest"><a href="invest_history.dj" class=""> 투자내역</a></li>
				<li class="lend"><a href="laon_history.dj" class=""> 대출내역</a></li>
				<li class="moeny"><a href="point_deposit.dj" class=""> 충전/환급</a></li>
				<li class="moeny hidden-xs"><a href="notification.dj" class="">알림 메세지</a></li>
				<li class="setting"><a href="setting.dj" class="">설정</a></li>
			</ul>
  </div>

<div class="col-xs-12 col-sm-9 contetns-warp right">
<!-- 좌측 전체 -->
	<div class="col-sm-12 contents-left">
	  <!-- 설정부분전체 -->
	  <div class="panel panel-default contents">
	  	<div class="panel-heading">
	  		<ol class="breadcrumb contents-menu hidden-xs">
	  		 <li><h3>설정</h3></li>
	  		 <li><a href="setting.dj">기본정보</a></li>
			 <li><a href="setting_cert_person.dj">인증센터</a></li>
			 <li><a href="setting_session_history.dj">로그인내역</a>
	  		</ol>
	  	</div>
	  	<div class="panel-body">
	  	  <div class="nav-tabs-custom">
	  		<ul class="nav nav-tabs">
	  		 <li class="active"><a href="#">회원인증</a></li>
	  		 <li><a href="#">소셜연동</a></li>
	  		</ul>
	  	</div>
	  		<div class="cate">
	  		<div class="form-warp">
	  		<h3>회원정보 </h3>
	  		 <form class="form-horizontal" action="signup_modifyPro.dj" method="post" enctype="multipart/form-data" name="userinput" >
				<div class="form-group">
				 <label class="col-xs-2 control-label">닉네임</label>
				 <div class="col-xs-5">
				 <input type="text" name="nickname" value="${dto.nickname}" class="form-control" disabled>
				 </div>
				</div>
				<div class="form-group">
				 <label class="col-xs-2 control-label">이메일</label>
				 <div class="col-xs-5">
				 <input type="text"   value=" ${dto.email}" class="form-control" disabled>
				 </div>
				</div>	
				<div class="form-group">
				 <label class="col-xs-2 control-label">가입일</label>
				 <div class="col-xs-5">
				 ${dto.join}
				 </div>
				</div>		
				
			<div class="form-group">
				 <label class="col-xs-2 control-label">프로필사진수정</label>
				 <div class="col-xs-5">
				<c:if test="${dto.profile == null}">			
 					<input type="file" name="save">		
				</c:if>
				<c:if test="${dto.profile != null}">	
					<input type="hidden" value="${dto.profile}" name="profile">	
					<img src="/donjom/save/${dto.profile}" width="150">				
				</c:if> 
				 </div>
			</div>	
			<hr>
				<div class="form-group">
				 <label class="col-xs-2 control-label">추천인이메일 </label>
				 <div class="col-xs-5">
				 <input type="text" name="goodemail" class="form-control">	
				 </div>
				</div>							
<hr>
	<h3>비밀번호 변경 </h3>
		<div class="form-group">
				 <label class="col-xs-2 control-label">새비밀번호 </label>
				 <div class="col-xs-5">
				 <input type="password" name="newpw" class="form-control">	
				 </div>
				</div>	
		<div class="form-group">
				 <label class="col-xs-2 control-label">새비밀번호 확인 </label>
				 <div class="col-xs-5">
				  <input type="password" name="pwch" onkeyup="pwcheck()"class="form-control">	
				</div>
				 </div>
				 <div id="checkPwd" class="text-right">비밀번호를 확인해주세요</div>
			
			<div class="form-group">
				 <label class="col-xs-2 control-label">현재 비밀번호 </label>
				 <div class="col-xs-5">
				  <input type="password" name="pw" class="form-control"><br/>
				  <div class="text-right"> ※보안을 위해 정보수정시 현재 비밀번호를 입력해주세요.</div>		
				 </div>
				</div>
				
	<input type="submit" value="수정" onclick="return checkIt()" class="btn btn-success">	
</form>
</div>
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
	  		 
	  		 
	  		</div>
	  	</div>
	  </div>
	</div>
  </div><!-- 설정부분 전체 상자 -->
</div><!-- 전체 warp -->

<img src="/donjom/save/${dto.profile}" width="150">		<br/>
${dto.nickname}		<br/>
${dto.email}		<br/>
가입일 ${dto.join}			<br/>	

<a href="setting.dj">기본정보 수정</a>	<br/><br/>

<ul>
	<li>내정보</li>	
	<li><a href="dashboard.dj">대시보드</a></li>
	<li><a href="invest_history.dj">투자내역</a></li>
	<li><a href="laon_history.dj">대출내역</a></li>
	<li><a href="point_deposit.dj">충전/환급</a></li>
	<li><a href="notification.dj">알림메세지</a></li>
	<li><a href="setting.dj">설정</a></li>	
</ul>

설정 




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
<img src="/donjom/save/${dto.profile}" width="150">				<br/>
</c:if> 

추천인이메일 <input type="text" name="goodemail">	<br/>

비밀번호변경 										<br/>
새비밀번호 <input type="password" name="newpw">			<br/>
새비밀번호 확인 <input type="password" name="pwch" onkeyup="pwcheck()">	<br/>
<div id="checkPwd">비밀번호를 확인해주세요</div>
현재비밀번호 <input type="password" name="pw">		<br/>
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