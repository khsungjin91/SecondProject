<%@ page language="java" contentType="text/html; charset=EUC-KR" 
     pageEncoding="EUC-KR"%> 
 <html> 
 <head> 

 	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
 	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
     <meta name="viewport" content="width=device-width, initial-scale=1"> 
     <link href="style/css/herb.css" rel="stylesheet"> 
 	<link href="bt/css/bootstrap.min.css" rel="stylesheet"> 
  	<link href="bt/css/bootstrap-theme.min.css" rel="stylesheet"> 
 
 <title>LOGIN</title> 
 </head> 
 <body> 
    <div id="fb-root"></div> 
         <script> 
        window.fbAsyncInit = function() { 
          FB.init({ 
              appId      : '1206601269351179', // �� ID 
               status     : true,          // �α��� ���¸� Ȯ�� 
               cookie     : true,          // ��Ű��� 
               xfbml      : true           // parse XFBML 
             }); 
             
             FB.getLoginStatus(function(response) { 
                 if (response.status === 'connected') { 
                      
                     FB.api('/me', function(user) { 
                         if (user) { 
                             var image = document.getElementById('image'); 
                             image.src = 'http://graph.facebook.com/' + user.id + '/picture'; 
                             var name = document.getElementById('name'); 
                             name.innerHTML = user.name 
                             var id = document.getElementById('id'); 
                             id.innerHTML = user.id 
                             var email = document.getElementById('email'); 
                             email.innerHTML = user.email 
                         } 
                    });     
                      
                } else if (response.status === 'not_authorized') { 
  
                 } else { 
                     
                 } 
            }); 
 
             FB.Event.subscribe('auth.login', function(response) { 
                 document.location.reload(); 
             }); 
              
           }; 
          
           // Load the SDK Asynchronously 
           (function(d){ 
             var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0]; 
              if (d.getElementById(id)) {return;} 
              js = d.createElement('script'); js.id = id; js.async = true; 
              js.src = "//connect.facebook.net/ko_KR/all.js"; 
              ref.parentNode.insertBefore(js, ref); 
            }(document)); 
            
           function facebooklogin(){ 
        	  FB.login(function(response) {   
         		    var fbname;   
         		    var accessToken = response.authResponse.accessToken;   
         		    FB.api('/me', function(user) {   
         		      fbname = user.name; 
         		      $.post("main.dj", { "userid": user.id, "email":user.email, "username": fbname, "fbaccesstoken":accessToken},   
         		      function (responsephp) {   
         		        if(responsephp=="N"){ 
         		         location.replace('/unmember/memberrege?flag=1');             
         		        }else{ 
         		         location.replace('/');             
         		        } 
         		      });       
         		    });    
         		  }, {scope: "user_about_me,publish_stream,read_friendlists,offline_access,email,user_birthday"});   
         		}   
         </script> 
         
 <script>
 
 function checkIt(){
	 
	 if(!document.userinput.email.value){
		 
		 alert("�̸����� �Է����ּ���");
		 document.userinput.email.focus();
	 }
	 
	 if(!document.userinput.pw.value){
		 
		 alert("��й�ȣ�� �Է����ּ���");
		 document.userinput.pw.focus();
	 }
	 
 }
         
 </script>
 

 <div id="login"> 
 <div id="container"> 
 	<h2 class="form-signin-heading">�α���</h2> 
 <form class="form-signin" action="signPro.dj" method="post" name="userinput"> 
 	<label for="inputEmail" class="sr-only">�̸��� �ּ�</label> 
 	<input type="email" id="inputEmail" name="email" class="form-control"  
 	placeholder="�̸����� �Է����ּ��� " required autofocus> 
 	<label for = "inputPassword" class="sr-only">��й�ȣ</label> 
 	<input type="password" id="inputPassword" name="pw" class="form-control"  
 	placeholder="��й�ȣ�� �Է����ּ���" required> 
 	 
 	<button class="btn btn-lg btn-primary btn-block" type="submit" onclick="return checkIt()"> 
		<span class="glyphicon glyphicon-envelope">�̸��Ϸ� �α���</span> 
	</button> 
 	 
	</form> 
 	<a href="#" onclick="FB.login();"> 
 	<button class="btn btn-lg btn-primary btn-block" type="button" > 
 		���̽������� �α��� 
 	</button></a> 
 	 
 	<a href="#" onclick="FB.logout();"> 
 	�α׾ƿ� 
	</a> 
	 
 	</div> 
	 
	 
 <p>��������� ���</p> 
	<div align="left"> 
 	<img id="image"/> 
   <div id="name"></div> 
    <div id="id"></div> 
    <div id="email"></div> 
</div> 
<fb:login-button show-faces="false" width="200" max-rows="1"></fb:login-button> 

 
<ul> 
	<li><a href="signUp.dj">DJȸ������</a></li> 
	<li><a href="findpw.dj">��й�ȣ ã��</a></li> 
</ul> 
 
 </div> 

 
 <!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) --> 
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� --> 
     <script src="bt/js/bootstrap.min.js"></script> 
       <!-- IE10 viewport hack for Surface/desktop Windows 8 bug --> 

   <script src="bt/js/ie10-viewport-bug-workaround.js"></script> 

   <script src="bt/js/ie10-viewport-bug-workaround.js"></script> 
 
 
</body> 
</html> 
