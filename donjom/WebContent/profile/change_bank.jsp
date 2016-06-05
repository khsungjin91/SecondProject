<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

function go(){
	
	$.ajax({
		
		type: "post",
		url:"/donjom/gochange.dj",
		data :{
			
			bankcode : $("#bankcode").val() ,
			bankaccnum : $("#bankaccnum").val()
		},
		success : test,
		error: error
	});
}

function test(a){
	alert("success");
}

function error(){
	alert("Error");
}

</script>
</head>
<body>

은행명 <select name="bankcode" id="bankcode">
	<option value="신한은행">신한은행</option>
	<option value="우리은행">우리은행</option>
	<option value="농협은행">농협은행</option>
	<option value="기업은행">기업은행</option>
	<option value="국민은행">국민은행</option>
	<option value="하나은행">하나은행</option>
	</select>																					<br/>
계좌번호	<input type="text" name="bankaccnum" id="bankaccnum">									<br/>

<input type="button" value="변경하기" onclick="go()"/>

</body>
</html>