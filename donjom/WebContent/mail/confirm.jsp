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
		
		alert("�����Ϸ�");
		
		parent.document.userinput.$("#mailback").val(callback);
		
	}else{
		
		alert("������ȣ�� �ٽ� Ȯ�����ּ���.");
		
	}
}

function callAjax(){
    $.ajax({
	        type: "post",
	        url : "/donjom/mail/confirmPro.jsp",
	        success: test,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
 	});
}
function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
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

String from = "psj9102@naver.com";    // ���� ������ ���
String to = chemail;   // ���� �������
String cc = "";     // ����
String subject = "DJ������ȣ ��ȣ ����";// ����
String content = 
"DJ ������ȣ ���� �Դϴ�."+mailSend+" �������ּ���";// ����

if(from.trim().equals("")) {
 System.out.println("������ ����� �Է����� �ʾҽ��ϴ�.");
}
else if(to.trim().equals("")) {
 System.out.println("�޴� ����� �Է����� �ʾҽ��ϴ�.");
}
else {
 try {
  mailTest mt = new mailTest();
  
  // ���Ϻ�����
  mt.sendEmail(from, to, cc, subject, content);
  System.out.println("���� ���ۿ� �����Ͽ����ϴ�.");
 }
 catch(MessagingException me) {
  System.out.println("���� ���ۿ� �����Ͽ����ϴ�.");
  System.out.println("���� ���� : " + me.getMessage());
 }
 catch(Exception e) {
  System.out.println("���� ���ۿ� �����Ͽ����ϴ�.");
  System.out.println("���� ���� : " + e.getMessage());
 }
}


%>
		
���������� �Ϸ�Ǿ����ϴ�. ������ȣ�� Ȯ���� �ּ���. <br/>

<input type="hidden" name="mailSend" value="<%=mailSend%>" id="mailSend">
<input type="text" name="confirm" id="confirm">
<input type="button" value="�����ϱ�" onclick="success(this.target);">

</body>
</html>