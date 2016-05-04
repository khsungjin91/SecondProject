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
	
	var confirmNo = $("#confirm").val();
	var mailSendNo = $("#mailSend").val();

	window.location = "sendMailPro.dj?mailSend=" + mailSendNo +"&confirm="+confirmNo ;
		
}

</script>

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


<%=chemail%>로  
메일전송을 완료했습니다. 

<input type="hidden" name="mailSend" value="<%=mailSend%>" id="mailSend">
<input type="text" name="confirm" id="confirm">
<input type="button" value="인증하기" onclick="success(this.target);">

</body>
</html>