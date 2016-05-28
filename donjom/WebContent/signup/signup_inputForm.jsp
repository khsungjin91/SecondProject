<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
 <!-- iCheck -->
  <link rel="stylesheet" href="bt/plugins/iCheck/square/blue.css">
<title>회원가입</title>
<!-- FaceBook Login Start -->
 <script language="javascript">
        // 페이스북 SDK 초기화
        window.fbAsyncInit = function () {
            FB.init({
                appId: '1206601269351179'    // Website with Facebook Login 사이트 : 일단 test 용으로 용퓌 계정상에서 app 생성
                , status: true   // check login status
                , cookie: true   // enable cookies to allow the server to access the session
                , xfbml: true    // parse XFBML
                //,oauth: true
            });
                 
        };
               
// 페이스북 SDK(js) 로딩 (페이지 로딩 속도 향상을 위해 사용)
        (function (d) {
            var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement('script');
            js.id = id;
            js.async = true;
            //js.src = "//connect.facebook.net/en_US/all.js";
            js.src = "http://connect.facebook.net/ko_KR/all.js";
            ref.parentNode.insertBefore(js, ref);
        }(document));

        // 페이스북 계정으로 회원 가입
        function facebookRegist() {
            // 페이스북 로그인 상태 체크
            
            FB.getLoginStatus(function (response) {
					
                if (response.status == "connected") {
                    // 페이스북 로그인 YES! and 앱 허가 YES!
                    //alert("페이스북 로그인 YES! and 앱 허가 YES!");
                    handleFacebookRegist(response);
                } else if (response.status == "not_authorized") {
                    // 페이스북 로그인 YES! but 앱 허가 NO!
                    //alert("페이스북 로그인 YES! but 앱 허가 NO!");
                    FB.login(function (response) {
                                handleFacebookRegist(response);
                            },
                            {scope: 'email'});
                } else {    // 페이스북 로그아웃 상태.
                	//alert("페이스북 로그아웃 상태");
                    FB.login(function (response) {
                                handleFacebookRegist(response);
                            },
                            {scope: 'email'});
                }
            });
        }

        // 회원가입 핸들러
        function handleFacebookRegist(response) {

            var accessToken = response.authResponse.accessToken;
          	var userId, userName, fbId, userBirth;
			var facebooklogin = 1;
            FB.api('/me', 
            		'GET',
          		  {"fields":"id,name,birthday,email"}, 
          		  function (user) {
                userId = user.email;    // 페이스북 email
                userName = user.name;   // 페이스북 name
                fbId = user.id;         // 페이스북 id
                userBirth = user.birthday;  // 페이스북 생일 : mm/dd/yyyy
                
       
        	$.ajax({
        		type: "POST",
        		url: "/donjom/main.dj",
        		async:true,
        		success: function(){
        			//alert("post-성공적!!");
        		},
        		error: function(){
        			//alert("post-에러씨발!!");
        		},
        		complete: function(){
        			//alert("post-개성공!!완젼!!");
        			location.replace("/donjom/signPro.dj?userId="+userId+"&userName="+userName+"&fbId="+fbId+"&userBirth="+userBirth+"&facebooklogin="+facebooklogin);
        		}
        	});  //ajax "sendPost" end
          });
        }
        
  </script>

</head>
<body class="hold-transition register-page">

<script>
function checkIt(){
	var pw = document.userinput.pw.value;
	var pwch = document.userinput.pwch.value;
	
	if(!document.userinput.nickname.value){
		alert("닉네임을 입력해주세요");
		document.userinput.nickname.focus();
		return false;
	}
	
	if(!document.userinput.email.value){
		alert("이메일을 입력해주세요");
		document.userinput.email.focus();
		return false;
	}
	
	if(!document.userinput.pw.value){
		alert("비밀번호를 입력해주세요");
		document.userinput.pw.focus();
		return false;
	}
	
	if(!document.userinput.pwch.value){
		alert("비밀번호를 확인해주세요");
		document.userinput.pwch.focus();
		return false;
	}

	if(!document.userinput.terms.checked){
		alert("약관의 동의를 하셔야합니다.");
		document.userinput.terms.focus();
		return false;
	}
	
	if(pw != pwch){
		alert("새로운 비밀번호가 서로 맞지않습니다.");
		document.userinput.pwch.focus();
		return false;
	}
}

function checkPwd(){
	
	var f1 = document.forms[0];
	
	var pw1 = f1.pw.value;
	var pw2 = f1.pwch.value;
	
	if(pw1 != pw2){
		document.getElementById("checkPwd").innerHTML = "<font color=red>비밀번호를 확인해주세요.</font>";		
	}else{
		document.getElementById("checkPwd").innerHTML = "<font color=green>비밀번호가 동일합니다.</font>";
	}
	
}
	
</script>
<div class="register-box">
 <div class="register-logo">
  <a href="main.dj"><b>회원가입</b></a>
 </div>
	<div class="register-box-body">
		<p class="login-box-msg">회원가입 하시면 DJ의 다양한 서비스를 이용하실 수 있습니다.</p>
	
	<form action="signUpPro.dj" method="post" name="userinput">
			<div class="form-group has-feedback">
			<input type="text" name="nickname" placeholder="닉네임" class="form-control">
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
			<input type="text" name="email" class="form-control" placeholder="이메일"> 
			 <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
			<input type="password" name="pw" class="form-control" placeholder="비밀번호">
			 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" name="pwch" onkeyup="checkPwd()" placeholder="비밀번호 확인"
					class="form-control">
					<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
			</div>


			<div id="checkPwd">비밀번호를 확인해주세요.</div>

			이용약관 동의 <input type="checkbox" name="terms"> <br /> 
			<input type="submit" class="btn btn-block bg-orange" value="이메일로 10초만에 가입하기" onclick="return checkIt()">
			
		</form>
	<hr>
	
	<button class="btn btn-block btn-social btn-facebook" type="button"
			onclick="facebookRegist();"><i class="fa fa-facebook"></i>페이스북으로 1초만에 가입</button>
	</div>
  </div>



</body>
</html>