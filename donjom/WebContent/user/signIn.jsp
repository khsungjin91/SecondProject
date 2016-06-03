<%@ page language="java" contentType="text/html; charset=EUC-KR" 
     pageEncoding="EUC-KR"%> 
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <html> 
 <head> 
<!-- 메타태그 시작 -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />


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
                    alert("페이스북 로그인 YES! and 앱 허가 YES!");
                    handleFacebookRegist(response);
                } else if (response.status == "not_authorized") {
                    // 페이스북 로그인 YES! but 앱 허가 NO!
                    alert("페이스북 로그인 YES! but 앱 허가 NO!");
                    FB.login(function (response) {
                                handleFacebookRegist(response);
                            },
                            {scope: 'email'});
                } else {    // 페이스북 로그아웃 상태.
                	alert("페이스북 로그아웃 상태");
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
        			
        		},
        		error: function(){
        			
        		},
        		complete: function(){
        			location.replace("/donjom/signPro.dj?userId="+userId+"&userName="+userName+"&fbId="+fbId+"&userBirth="+userBirth+"&facebooklogin="+facebooklogin);
        		}
        	});  //ajax "sendPost" end
          });
        }
        
  </script>

 <title>LOGIN</title> 
 </head> 

 <body > 
  <jsp:include page="/WEB-INF/header.jsp"></jsp:include>
 <div class="login-box">
 
 <div class="login-box-body">
 	<h2 class="text-center">로그인</h2> 
  <form class="form-signin" action="signPro.dj" method="post" name="userinput"> 
 	<div class="form-group has-feedback">
 	<label for="inputEmail" class="sr-only">이메일 주소</label> 
 	<input type="email" id="inputEmail" name="email" class="form-control"  
 	placeholder="이메일을 입력해주세요 " required autofocus>
 	 <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
 	</div>
 	<div class="form-group has-feedback">
 	<label for = "inputPassword" class="sr-only">비밀번호</label> 
 	<input type="password" id="inputPassword" name="pw" class="form-control"  
 	placeholder="비밀번호를 입력해주세요" required>
 	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
 	</div>
 	 <div class="row">
 	 	<div class="col-xs-8">
 	 	 <div class="checkbox icheck">
 	 	 </div>
 	 	</div>
 	 </div>
 	 
 	<button class="btn btn-block bg-orange" type="submit" onclick="return checkIt()"> 
		<span class="glyphicon glyphicon-envelope">이메일로 로그인</span> 
	</button> 
 	 </form> 
 <hr>
		<button class="btn btn-block btn-social btn-facebook" type="button" onclick="FB.login();"> 
 		<i class="fa fa-facebook"></i>페이스북으로 로그인</button>
 	
 		<button class="btn  btn-primary btn-block" type="button" onclick="FB.logout();"> 
 		페이스북 로그아웃</button>
 	 <ul class="list-inline"> 
	<li><a href="signUp.dj">DJ회원가입</a></li> 
	<li><a href="findpw.dj">비밀번호 찾기</a></li> 
		</ul> 
 		</div> <!-- /login box -->
 	</div> 
 <jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body> 
</html> 
