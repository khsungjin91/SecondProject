<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />

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
<script>

function checkEmail(){

	$.ajax({
		type : "post",
		url : "/donjom/check_Email.dj",
		data :{
			email : $("#email").val()
		},
		success : function test(a){ 
			$("#checkEmail").html(a); 
			},
		error : function error(){ alert("error"); }
	});
	
}
</script>
<script>

function checkIt(){
	
	var pw = $("#pw").val();
	var pwch = $("#pwch").val();
	
	if(!$("#nickname").val()){
		alert("�г����� �Է����ּ���");
		$("#nickname").focus();
		return false;
	}
	
	if(!$("#email").val()){
		alert("�̸����� �Է����ּ���");
		$("#email").focus();
		return false;
	}
	
	if(!$("#pw").val()){
		alert("��й�ȣ�� �Է����ּ���");
		$("#pw").focus();
		return false;
	}
	
	if(!$("#pwch").val()){
		alert("��й�ȣ�� Ȯ�����ּ���");
		$("#pwch").focus();
		return false;
	}

	if(!$("#terms").is(":checked")){
		alert("����� ���Ǹ� �ϼž��մϴ�.");
		return false;
	}
	
	if(pw != pwch){
		alert("��й�ȣ�� ���� ���� �ʽ��ϴ�.");
		return false;
	}
}

function checkPwd(){
	
	var pw1 = $("#pw").val();
	var pw2 = $("#pwch").val();
	
	if(pw1 != pw2){
		document.getElementById("checkPwd").innerHTML = "<font color=red>��й�ȣ�� Ȯ�����ּ���.</font>";		
	}else{
		document.getElementById("checkPwd").innerHTML = "<font color=green>��й�ȣ�� �����մϴ�.</font>";
	}
	
}
</script>

</head>

<body >
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<div class="register-box">
 <div class="register-logo">
  <a href="main.dj"><b>ȸ������</b></a>
 </div>
	<div class="register-box-body">
		<p class="login-box-msg">ȸ������ �Ͻø� DJ�� �پ��� ���񽺸� �̿��Ͻ� �� �ֽ��ϴ�.</p>
	
	<form action="signUpPro.dj" method="post" name="userinput">
			<div class="form-group has-feedback">
			<input type="text" name="nickname" id="nickname" placeholder="�г���" class="form-control">
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
			<input type="email" name="email" id="email" class="form-control" placeholder="�̸���" onblur="checkEmail()"> 
			 <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			 <div id="checkEmail"></div>
			</div>
			<div class="form-group has-feedback">
			<input type="password" name="pw" id="pw" class="form-control" placeholder="��й�ȣ">
			 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" name="pwch" id="pwch" onkeyup="checkPwd()" placeholder="��й�ȣ Ȯ��"
					class="form-control">
					<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
			</div>


			<div id="checkPwd">��й�ȣ�� Ȯ�����ּ���.</div>

			�̿��� ���� <input type="checkbox" name="terms" id="terms"> <br /> 
			<input type="submit" class="btn btn-block bg-orange" value="�̸��Ϸ� 10�ʸ��� �����ϱ�" onClick="return checkIt()">
			
		</form>
	<hr>
	
	<button class="btn btn-block btn-social btn-facebook" type="button"
			onclick="facebookRegist();"><i class="fa fa-facebook"></i>���̽������� 1�ʸ��� ����</button>
	</div>
  </div>
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>


</body>
</html>