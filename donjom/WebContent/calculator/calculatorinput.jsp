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
	        data: {	// url 페이지도 전달할 파라미터
	        	investmoney : $("#investmoney").val(),
	        	term : $("#term").val(),
	        	rate : $("#rate").val(), 
	        	way : $("#way").val() 
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

<form action="calculStart.dj" method="post" name="userinput">
상환방법
<select name="way" id="way">
<option value="0">원리금 균등상환</option>
<option value="1">원금만기 일시상환</option>
</select>							<br/>
대출금액<input type="text" name="investmoney" id="investmoney">만원		<br/>
대출기간<input type="text" name="term" id="term">개월		<br/>
대출금리<input type="text" name="rate" id="rate">%		<br/>

<input type="button" value="계산하기" id="calculator" onclick="return check()"> <br/>

</form>

<input type="button" value="닫기" onclick="javascript:self.close()">


<div id="resultBack">


</div>
</body>
</html>