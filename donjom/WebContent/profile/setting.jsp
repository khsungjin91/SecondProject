<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//code.jquery.com/jquery.form.js"></script>


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

<script>
function upload(){
	
	  var form = $("#save")[0];
		alert(form)
	  var formData = new FormData(form);
	$.ajax({
		url : "/donjom/upload.dj",
		data : {
			save : formData
		},
		processData: false,
  	    contentType: false,
		type : "post",
		success : function test(data){ alert("good"); },
		error : function error(){ alert("error"); }
		
	});
	alert("end"); 
}


function deleteimg(){
	
	var img = $("#profile").val();
	
	$.ajax({
		type:"post",
		url:"/donjom/deleteimg.dj",
		data : {
			
			profile : img		
			
		},
		success : function test(data){ $("#img").html(data); },
		error : function error(){ alert("error"); }
	});
	
}
</script>
<script>
function view(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            $target.html('<img src="' + e.target.result + '" border="0" width="150" class="img-circle" alt="review" />');
        }
        reader.readAsDataURL(html.files[0]);
    }
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

<jsp:include page="/WEB-INF/header.jsp"/>
	<div class="warpper dash-body">
		<div class="container">
			<jsp:include page="/WEB-INF/settingside.jsp"/>

<div class="col-xs-12 col-sm-8 contetns-warp right">
<!-- 좌측 전체 -->
	<div class="col-sm-12 contents-left">
	  <!-- 설정부분전체 -->
	  <div class="box box-default contents">
	  	<div class="panel-heading">
	  		<ol class="breadcrumb contents-menu hidden-xs">
	  		 <li><h3>설정</h3></li>
	  		 <li><a href="setting.dj">기본정보</a></li>
			 <li><a href="setting_cert_person.dj">인증센터</a></li>
			 <li><a href="setting_session_history.dj">로그인내역</a>
	  		</ol>
	  	</div>
	  	<div class="panel-body">
	  		<div class="cate">
	  		<div class="form-warp">
	  			<h3 class="box-header">회원정보 </h3>
	  		 <form class="form-horizontal" action="signup_modifyPro.dj" method="post" enctype="multipart/form-data" name="userinput" >
				<div class="form-group">
				 <label class="col-xs-3 control-label">닉네임</label>
				 <div class="col-xs-5">
				 <input type="text" name="nickname" value="${dto.nickname}" class="form-control">
				 </div>
				</div>
				<div class="form-group">
				 <label class="col-xs-3 control-label">이메일</label>
				 <div class="col-xs-5">
				 <input type="text"   value=" ${dto.email}" class="form-control" disabled>
				 </div>
				</div>	
				<div class="form-group">
				 <label class="col-xs-3 control-label">가입일</label>
				 <div class="col-xs-5">
				 ${dto.join}
				 </div>
				</div>		
				
			<div id="img" class="form-group">
				 <label class="col-xs-3 control-label">프로필사진수정</label>
				 
				 <div class="col-xs-5">
				<c:if test="${dto.profile == null}">			
 					
 					<input type="file" name="save" id="save" onchange="view(this,$('#imgreview'))" > 
 					<br/><div id="imgreview" ></div>		<!-- 이미지 미리보기  -->
				</c:if>
				<c:if test="${dto.profile != null}">	
					<input type="hidden" value="${dto.profile}" name="profile" id="profile">	
					<img src="/donjom/save/${dto.profile}" width="150" class="img-circle"> 
					<input type="button" value="이미지삭제" onclick="deleteimg()">
				</c:if> 
				 </div>
				 
				<!--  <div class="col-xs-5">
				<c:if test="${dto.profile == null}">			
 					<input type="file" name="save" id="save" onchange="upload()">		
				</c:if>
				<c:if test="${dto.profile != null}">	
					<input type="hidden" value="${dto.profile}" name="profile">	
					<img src="/donjom/save/${dto.profile}" width="100"> 
				</c:if> 
				 </div> -->
			</div>	
			<hr>
			
	<h3 class="box-header">비밀번호 변경 </h3>
		<div class="form-group">
				 <label class="col-xs-3 control-label">비밀번호 </label>
				 <div class="col-xs-6">
				 <input type="password" name="newpw" class="form-control">	
				 </div>
				</div>	
		<div class="form-group">
				 <label class="col-xs-3 control-label">비밀번호 확인 </label>
				 <div class="col-xs-6">
				  <input type="password" name="pwch" onkeyup="pwcheck()"class="form-control">	
				</div>
			</div>
			
			<div id="checkPwd" ></div>
			<div class="form-group">
				 <label class="col-xs-3 control-label">현재 비밀번호 </label>
				 <div class="col-xs-6">
				  <input type="password" name="pw" class="form-control"><br/>
				  <small>※보안을 위해 정보수정시 현재 비밀번호를 입력해주세요.</small>	
				 </div>
				</div>
				<div class="text-center">
					<input type="submit" value="수정" onclick="return checkIt()" class="btn  btn-lg bg-green">	
				</div>
</form>

</div>
<%--
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
--%>
<hr>
<p class="text-center">
<small>* DJ서비스를 더이상 원하지 않을 경우 </small>
<input type="button" value="탈퇴" onClick="javascript:open_win_noresizable('signup_checkPw.dj?email=${dto.email}&memno=${dto.no}')" class="btn btn-xs bg-red">
	  		 </p>
	  		 </div>
	  		</div>
	  	</div>
	  </div>
	</div>
  </div><!-- 설정부분 전체 상자 -->
</div><!-- 전체 warp -->
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>