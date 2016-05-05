<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mail.bean.mailTest" %>
<%@ page import="javax.mail.MessagingException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>

function success(userinput){
	
	var callback = callAjax();
	var confirmNo = $("#confirm").val();
	var mailSendNo = $("#mailSend").val();

	if(confirmNo == mailSendNo){
		
		alert("인증완료");
		
		parent.document.userinput.$("#mailback").val(callback);
		
	}else{
		
		alert("인증번호를 다시 확인해주세요.");
		
	}
}

function callAjax(){
    $.ajax({
	        type: "post",
	        url : "/donjom/mail/confirmPro.jsp",
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
 	});
}
function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
    $("#mailback").html(aaa);
    console.log(resdata);
}
function whenError(){
    alert("Error");
}

</script>

<% request.setCharacterEncoding("euc-kr"); %>
<%
String chemail = request.getParameter("chemail");

int [] random = {0,0,0,0};

for(int i = 0 ; i<1; i++){
	  
	  for(int j = 0; j<4 ; j++){
	  i = (int)(Math.random()*10);
	  random[j] = i;
	  }
}
String mailSend = random[0]+""+random[1]+""+random[2]+""+random[3];  

String from = "psj9102@naver.com";    // 메일 보내는 사람
String to = chemail;   // 메일 받을사람
String cc = "";     // 참조
String subject = "DJ인증번호 번호 전송";// 제목
String content = 
"DJ 인증번호 전송 입니다."+mailSend+" 인증해주세요";// 내용

if(from.trim().equals("")) {
 System.out.println("보내는 사람을 입력하지 않았습니다.");
}
else if(to.trim().equals("")) {
 System.out.println("받는 사람을 입력하지 않았습니다.");
}
else {
 try {
  mailTest mt = new mailTest();
  
  // 메일보내기
  mt.sendEmail(from, to, cc, subject, content);
  System.out.println("메일 전송에 성공하였습니다.");
 }
 catch(MessagingException me) {
  System.out.println("메일 전송에 실패하였습니다.");
  System.out.println("실패 이유 : " + me.getMessage());
 }
 catch(Exception e) {
  System.out.println("메일 전송에 실패하였습니다.");
  System.out.println("실패 이유 : " + e.getMessage());
 }
}


%>
		
메일전송이 완료되었습니다. 인증번호를 확인해 주세요. <br/>

<input type="hidden" name="mailSend" value="<%=mailSend%>" id="mailSend">
<input type="text" name="confirm" id="confirm">
<input type="button" value="인증하기" onclick="success(this.target);">

</body>
</html>