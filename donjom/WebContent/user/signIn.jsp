<%@ page language="java" contentType="text/html; charset=EUC-KR" 
     pageEncoding="EUC-KR"%> 
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <html> 
 <head> 
<!-- ��Ÿ�±� ���� -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />


<!-- FaceBook Login Start -->
 <script language="javascript">
        // ���̽��� SDK �ʱ�ȭ
        window.fbAsyncInit = function () {
            FB.init({
                appId: '1206601269351179'    // Website with Facebook Login ����Ʈ : �ϴ� test ������ ��Ƕ �����󿡼� app ����
                , status: true   // check login status
                , cookie: true   // enable cookies to allow the server to access the session
                , xfbml: true    // parse XFBML
                //,oauth: true
            });
                 
        };
               
// ���̽��� SDK(js) �ε� (������ �ε� �ӵ� ����� ���� ���)
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

        // ���̽��� �������� ȸ�� ����
        function facebookRegist() {
            // ���̽��� �α��� ���� üũ
            
            FB.getLoginStatus(function (response) {
					
                if (response.status == "connected") {
                    // ���̽��� �α��� YES! and �� �㰡 YES!
                    alert("���̽��� �α��� YES! and �� �㰡 YES!");
                    handleFacebookRegist(response);
                } else if (response.status == "not_authorized") {
                    // ���̽��� �α��� YES! but �� �㰡 NO!
                    alert("���̽��� �α��� YES! but �� �㰡 NO!");
                    FB.login(function (response) {
                                handleFacebookRegist(response);
                            },
                            {scope: 'email'});
                } else {    // ���̽��� �α׾ƿ� ����.
                	alert("���̽��� �α׾ƿ� ����");
                    FB.login(function (response) {
                                handleFacebookRegist(response);
                            },
                            {scope: 'email'});
                }
            });
        }

        // ȸ������ �ڵ鷯
        function handleFacebookRegist(response) {

            var accessToken = response.authResponse.accessToken;
          	var userId, userName, fbId, userBirth;
			var facebooklogin = 1;
            FB.api('/me', 
            		'GET',
          		  {"fields":"id,name,birthday,email"}, 
          		  function (user) {
                userId = user.email;    // ���̽��� email
                userName = user.name;   // ���̽��� name
                fbId = user.id;         // ���̽��� id
                userBirth = user.birthday;  // ���̽��� ���� : mm/dd/yyyy
               
       
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
 	<h2 class="text-center">�α���</h2> 
  <form class="form-signin" action="signPro.dj" method="post" name="userinput"> 
 	<div class="form-group has-feedback">
 	<label for="inputEmail" class="sr-only">�̸��� �ּ�</label> 
 	<input type="email" id="inputEmail" name="email" class="form-control"  
 	placeholder="�̸����� �Է����ּ��� " required autofocus>
 	 <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
 	</div>
 	<div class="form-group has-feedback">
 	<label for = "inputPassword" class="sr-only">��й�ȣ</label> 
 	<input type="password" id="inputPassword" name="pw" class="form-control"  
 	placeholder="��й�ȣ�� �Է����ּ���" required>
 	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
 	</div>
 	 <div class="row">
 	 	<div class="col-xs-8">
 	 	 <div class="checkbox icheck">
 	 	 </div>
 	 	</div>
 	 </div>
 	 
 	<button class="btn btn-block bg-orange" type="submit" onclick="return checkIt()"> 
		<span class="glyphicon glyphicon-envelope">�̸��Ϸ� �α���</span> 
	</button> 
 	 </form> 
 <hr>
		<button class="btn btn-block btn-social btn-facebook" type="button" onclick="FB.login();"> 
 		<i class="fa fa-facebook"></i>���̽������� �α���</button>
 	
 		<button class="btn  btn-primary btn-block" type="button" onclick="FB.logout();"> 
 		���̽��� �α׾ƿ�</button>
 	 <ul class="list-inline"> 
	<li><a href="signUp.dj">DJȸ������</a></li> 
	<li><a href="findpw.dj">��й�ȣ ã��</a></li> 
		</ul> 
 		</div> <!-- /login box -->
 	</div> 
 <jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body> 
</html> 
