<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>

<title>Insert title here</title>
<script>
window.fbAsyncInit = function() {  
 FB.init({appId: '1206601269351179', 
	 status: true, 
	 cookie: true,
	 xfbml: true
	 });      
};
 
(function(d){  
 var js, id = 'facebook-jssdk', 
 ref = d.getElementsByTagName('script')[0];  
 if (d.getElementById(id)) {return;}  
 js = d.createElement('script'); js.id = id; js.async = true;  
 js.src = "//connect.facebook.net/en_US/all.js";  
 ref.parentNode.insertBefore(js, ref);  
}(document)); 
 
function facebooklogin() {  
 FB.login(function(response) {
   if (response.status === 'connected') {
  getMyProfile();
   } else if (response.status === 'not_authorized') {
     // ���̽��Ͽ��� �α��� �Ǿ�������, �ۿ��� �α��� �Ǿ����� �ʴ�.
   } else {
     // ���̽��Ͽ� �α����� �Ǿ����� �ʾƼ�, �ۿ� �α��� �Ǿ��ִ��� �Ҹ�Ȯ�ϴ�.
   }
 } , {scope: "user_about_me,email,user_birthday"} ); //���� ������ ���̵�(�̸���)�� ���� ������ ������ �ʹ�.
 
} 
 
function getMyProfile(){
 FB.api('/me',function(user){
 
 var myName= user.name ;
 var myEmail = user.email;
 var myId = user.id;
 
 if(myEmail != ""){
   //������ post�� ������ submitó��
 }
 
  });
 FB.api('/me/picture?type=large',function(data){
 var myImg = data.data.url;
 });
}
</script>


</head>
<body>
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

<h2>ȸ������</h2>
ȸ������ �Ͻø� DJ�� �پ��� ���񽺸� �̿��Ͻ� �� �ֽ��ϴ�.

<form action="signUpPro.dj" method="post" name="userinput">

�г��� <input type="text" name="nickname">			<br/>
�̸��� <input type="text" name="email">			<br/>

��й�ȣ<div> <input type="password" name="pw" > </div>

��й�ȣȮ��<div> <input type="password" name="pwch" onkeyup = "checkPwd()"> </div>

<div id="checkPwd">��й�ȣ�� Ȯ�����ּ���.</div>	

�̿��� ���� <input type="checkbox" name="terms">	<br/>
<input type="submit" value="�̸��Ϸ� 10�ʸ��� �����ϱ�" onclick="return checkIt()">	<br/>
</form>

<input type="button" value="���̽������� �α����ϱ�" onclick="facebooklogin();">
</body>
</html>