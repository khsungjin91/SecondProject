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

����� <select name="bankcode" id="bankcode">
	<option value="��������">��������</option>
	<option value="�츮����">�츮����</option>
	<option value="��������">��������</option>
	<option value="�������">�������</option>
	<option value="��������">��������</option>
	<option value="�ϳ�����">�ϳ�����</option>
	</select>																					<br/>
���¹�ȣ	<input type="text" name="bankaccnum" id="bankaccnum">									<br/>

<input type="button" value="�����ϱ�" onclick="go()"/>

</body>
</html>