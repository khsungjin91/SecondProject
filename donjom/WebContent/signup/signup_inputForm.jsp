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
<title>ȸ������</title>
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
                    //alert("���̽��� �α��� YES! and �� �㰡 YES!");
                    handleFacebookRegist(response);
                } else if (response.status == "not_authorized") {
                    // ���̽��� �α��� YES! but �� �㰡 NO!
                    //alert("���̽��� �α��� YES! but �� �㰡 NO!");
                    FB.login(function (response) {
                                handleFacebookRegist(response);
                            },
                            {scope: 'email'});
                } else {    // ���̽��� �α׾ƿ� ����.
                	//alert("���̽��� �α׾ƿ� ����");
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
        			//alert("post-������!!");
        		},
        		error: function(){
        			//alert("post-��������!!");
        		},
        		complete: function(){
        			//alert("post-������!!����!!");
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
		alert("�г����� �Է����ּ���");
		document.userinput.nickname.focus();
		return false;
	}
	
	if(!document.userinput.email.value){
		alert("�̸����� �Է����ּ���");
		document.userinput.email.focus();
		return false;
	}
	
	if(!document.userinput.pw.value){
		alert("��й�ȣ�� �Է����ּ���");
		document.userinput.pw.focus();
		return false;
	}
	
	if(!document.userinput.pwch.value){
		alert("��й�ȣ�� Ȯ�����ּ���");
		document.userinput.pwch.focus();
		return false;
	}

	if(!document.userinput.terms.checked){
		alert("����� ���Ǹ� �ϼž��մϴ�.");
		document.userinput.terms.focus();
		return false;
	}
	
	if(pw != pwch){
		alert("���ο� ��й�ȣ�� ���� �����ʽ��ϴ�.");
		document.userinput.pwch.focus();
		return false;
	}
}

function checkPwd(){
	
	var f1 = document.forms[0];
	
	var pw1 = f1.pw.value;
	var pw2 = f1.pwch.value;
	
	if(pw1 != pw2){
		document.getElementById("checkPwd").innerHTML = "<font color=red>��й�ȣ�� Ȯ�����ּ���.</font>";		
	}else{
		document.getElementById("checkPwd").innerHTML = "<font color=green>��й�ȣ�� �����մϴ�.</font>";
	}
	
}
	
</script>
<div class="register-box">
 <div class="register-logo">
  <a href="main.dj"><b>ȸ������</b></a>
 </div>
	<div class="register-box-body">
		<p class="login-box-msg">ȸ������ �Ͻø� DJ�� �پ��� ���񽺸� �̿��Ͻ� �� �ֽ��ϴ�.</p>
	
	<form action="signUpPro.dj" method="post" name="userinput">
			<div class="form-group has-feedback">
			<input type="text" name="nickname" placeholder="�г���" class="form-control">
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
			<input type="text" name="email" class="form-control" placeholder="�̸���"> 
			 <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
			<input type="password" name="pw" class="form-control" placeholder="��й�ȣ">
			 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" name="pwch" onkeyup="checkPwd()" placeholder="��й�ȣ Ȯ��"
					class="form-control">
					<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
			</div>


			<div id="checkPwd">��й�ȣ�� Ȯ�����ּ���.</div>

			�̿��� ���� <input type="checkbox" name="terms"> <br /> 
			<input type="submit" class="btn btn-block bg-orange" value="�̸��Ϸ� 10�ʸ��� �����ϱ�" onclick="return checkIt()">
			
		</form>
	<hr>
	
	<button class="btn btn-block btn-social btn-facebook" type="button"
			onclick="facebookRegist();"><i class="fa fa-facebook"></i>���̽������� 1�ʸ��� ����</button>
	</div>
  </div>



</body>
</html>