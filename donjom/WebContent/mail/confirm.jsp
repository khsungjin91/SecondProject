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

function success(userinput){
	
	var confirmNo = $("#confirm").val();
	var mailSendNo = $("#mailSend").val();

	if(confirmNo != mailSendNo){
		
		alert("������ȣ�� �ٽ� Ȯ�����ּ���.");
		return false;

	}else{
		
		var callback = callAjax();
		alert("�����Ϸ�");
		parent.document.userinput.$("#mailback").val(callback);
	}
}

function callAjax(){
	
	var confirmNo = $("#confirm").val();
	var mailSendNo = $("#mailSend").val();
	
    $.ajax({
	        type: "post",
	        url : "/donjom/sendMailPro.dj",
	        success: function test(aaa){ $("#mailback").html(aaa);},
	        error: function whenError(){ alert("Error"); }
 	});
}

</script>
	<div class="col-sm-6 col-sm-offset-3">
		<div class=" form-group">
			<label> ���������� �Ϸ�Ǿ����ϴ�! ������ȣ�� Ȯ���� �ּ���.</label> 
			<input type="hidden" name="mailSend" value="${mailSend}" id="mailSend"> 
			<div class="col-sm-8">
			<input type="text" name="confirm" id="confirm" class="form-control">
			</div>
			<input type="button" value="�����ϱ�" onclick="success(this.target);" class="btn bg-green">
			</div>
			
		
	</div>
</body>
</html>