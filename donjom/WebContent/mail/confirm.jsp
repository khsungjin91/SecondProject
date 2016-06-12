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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

function callAjax(){
	
	var confirmNo = $("#confirm").val();
	var mailSendNo = $("#mailSend").val();
	
if(confirmNo != mailSendNo){
		
		alert("인증번호를 다시 확인해주세요.");
		return false;

	}else{
	
    $.ajax({
	        type: "post",
	        url : "/donjom/sendMailPro.dj",
	        success: function test(aaa){ alert("인증되셨습니다."); $("#mailback").html(aaa);},
	        error: function whenError(){ alert("Error"); }
 	});

	}
}

</script>
<div id="mailback">
	<div class="col-sm-6 col-sm-offset-3">
		<div class=" form-group">
			<label> 메일전송이 완료되었습니다! 인증번호를 확인해 주세요.</label> 
			<input type="hidden" name="mailSend" value="${mailSend}" id="mailSend"> 
			<div class="col-sm-8">
			<input type="text" name="confirm" id="confirm" class="form-control">
			</div>
			<input type="button" value="인증하기" onclick="callAjax();" class="btn bg-green">
			</div>
	</div>
</div>
</body>
</html>