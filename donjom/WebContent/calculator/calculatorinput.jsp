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
	        data: {	// url 페이지도 전달할 파라미터
	        	investmoney : $("#investmoney").val(),
	        	term : $("#term").val(),
	        	rate : $("#rate").val(), 
	        	way : $("#way").val(), 
	        	split : 0 
	        },
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
   	});
  }
  function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
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
		alert("필수항목입니다.");
		return false;
	}
	
	if(!user.term.value){
		user.term.focus();
		alert("필수항목입니다.");
		return false;
	}
	
	if(!user.rate.value){
		user.rate.focus();
		alert("필수항목입니다.");
		return false;
	}

}


</script>

<form action="calculStart.dj" method="post" name="userinput" class="form-horizontal">

	 <div class="form-group">
			<label class="col-sm-2 control-label">상환방법</label>
			<div class="col-sm-10">
				<div class="input-group">
					<select name="way" id="way" class="form-control">
						<option value="0">원리금 균등상환</option>
						<option value="1">원금만기 일시상환</option>
					</select>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">대출금액</label>
			<div class="col-sm-10">
				<div class="input-group">
					<input type="text" class="form-control" name="investmoney" id="investmoney" placeholder="대출금을 만원 단위로 입력해주세요">
					<div class="input-group-addon">만원</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">대출기간</label>
			<div class="col-sm-10">
				<div class="input-group">
				<input type="text" class="form-control"  name="term" id="term" placeholder="대출기간을 입력해주세요">
				<div class="input-group-addon">개월</div>
				</div>
			</div>
		</div>
	
		<div class="form-group">
			<label class="col-sm-2 control-label">대출금리</label>
			<div class="col-sm-10">
				<div class="input-group">
				<div class="input-group-addon">연</div>
				<input type="text" class="form-control"  name="rate" id="rate">
				<div class="input-group-addon">%</div>
				</div>
			</div>
		</div>


		<div class="text-center">
		<input type="button" value="계산하기" id="calculator" class="btn btn-lg bg-green" onclick="return check()"> <br/>
	</div>


</form>
<hr>
	<div id="resultBack"></div>
</body>
</html>