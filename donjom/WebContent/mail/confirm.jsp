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

	if(confirmNo != mailSendNo){
		
		alert("인증번호를 다시 확인해주세요.");
		return false;

	}else{
		
		var callback = callAjax();
		alert("인증완료");
		parent.document.userinput.$("#mailback").val(callback);
	}
}

function callAjax(){
	
	var confirmNo = $("#confirm").val();
	var mailSendNo = $("#mailSend").val();
	
    $.ajax({
	        type: "post",
	        url : "/donjom/sendMailPro.dj",
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

		
메일전송이 완료되었습니다. 인증번호를 확인해 주세요. <br/>

<input type="hidden" name="mailSend" value="${mailSend}" id="mailSend">
<input type="text" name="confirm" id="confirm">
<input type="button" value="인증하기" onclick="success(this.target);">

</body>
</html>