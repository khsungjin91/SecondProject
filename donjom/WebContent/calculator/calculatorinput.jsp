<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>

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
	        	way : $("#way").val(), 
	        	split : 0 
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

<form action="calculStart.dj" method="post" name="userinput" class="form-horizontal">

	 <div class="form-group">
			<label class="col-sm-2 control-label">��ȯ���</label>
			<div class="col-sm-10">
				<div class="input-group">
					<select name="way" id="way" class="form-control">
						<option value="0">������ �յ��ȯ</option>
						<option value="1">���ݸ��� �Ͻû�ȯ</option>
					</select>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">����ݾ�</label>
			<div class="col-sm-10">
				<div class="input-group">
					<input type="text" class="form-control" name="investmoney" id="investmoney" placeholder="������� ���� ������ �Է����ּ���">
					<div class="input-group-addon">����</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">����Ⱓ</label>
			<div class="col-sm-10">
				<div class="input-group">
				<input type="text" class="form-control"  name="term" id="term" placeholder="����Ⱓ�� �Է����ּ���">
				<div class="input-group-addon">����</div>
				</div>
			</div>
		</div>
	
		<div class="form-group">
			<label class="col-sm-2 control-label">����ݸ�</label>
			<div class="col-sm-10">
				<div class="input-group">
				<div class="input-group-addon">��</div>
				<input type="text" class="form-control"  name="rate" id="rate">
				<div class="input-group-addon">%</div>
				</div>
			</div>
		</div>


		<div class="text-center">
		<input type="button" value="����ϱ�" id="calculator" class="btn btn-lg bg-green" onclick="return check()"> <br/>
	</div>


</form>
<hr>
	<div id="resultBack"></div>
</body>
</html>