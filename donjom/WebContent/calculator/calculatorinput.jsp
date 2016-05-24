<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

$(document).ready(function(){
    $("#calculator").click(function(){
        callAjax();
    });
  });
  
  function callAjax(){
      $.ajax({
	        type: "post",
	        url : "/donjom/calculStart.dj" ,
	        data: {	// url �������� ������ �Ķ����
	        	investmoney : $("#investmoney").val(),
	        	term : $("#term").val(),
	        	rate : $("#rate").val(), 
	        	way : $("#way").val() 
	        },
	        success: test,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
   	});
  }
  function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
      $("#resultBack").html(aaa);
      console.log(resdata);
  }
  function whenError(){
      alert("Error");
  }
  
  
function check(){
	
	var user = document.userinput;
	
	if(!user.investmoney.value){
		user.investmoney.focus();
		alert("�ʼ��׸��Դϴ�.");
		return false;
	}
	
	if(!user.term.value){
		user.term.focus();
		alert("�ʼ��׸��Դϴ�.");
		return false;
	}
	
	if(!user.rate.value){
		user.rate.focus();
		alert("�ʼ��׸��Դϴ�.");
		return false;
	}

}


</script>

<form action="calculStart.dj" method="post" name="userinput">
��ȯ���
<select name="way" id="way">
<option value="0">������ �յ��ȯ</option>
<option value="1">���ݸ��� �Ͻû�ȯ</option>
</select>							<br/>
����ݾ�<input type="text" name="investmoney" id="investmoney">����		<br/>
����Ⱓ<input type="text" name="term" id="term">����		<br/>
����ݸ�<input type="text" name="rate" id="rate">%		<br/>

<input type="button" value="����ϱ�" id="calculator" onclick="return check()"> <br/>

</form>

<input type="button" value="�ݱ�" onclick="javascript:self.close()">


<div id="resultBack">


</div>
</body>
</html>