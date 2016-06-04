<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#addText").click(function(){
		 var textindex = $("#textarray tr").children().length;
		 $("#textarray").append(
			"<tr><td>" +
		 	"<textarea rows='10' cols='80' name='content["+textindex+"]'></textarea> <a href='#this' name='delete'>삭제</a>" +
		 	"</td></tr>" 
		 );
		$("#textindex").val(textindex);
		 $("a[name='delete']").on("click",function(e){
			 e.preventDefault();
			 fn_deleteText($(this));
		 });
	});
});

$(document).ready(function(){
	$("#filebutton").click(function(){
		 var fileindex = $("#fileupload tr").children().length;
		 $("#fileupload").append(
			"<tr><td>" +
		 	"<input type='file' name='upfile["+fileindex+"]'> <a href='#this' name='delete'>삭제</a>" +
		 	"</td></tr>" 
		 );
		$("#fileindex").val(fileindex);
		 $("a[name='delete']").on("click",function(e){
			 e.preventDefault();
			 fn_deleteText($(this));
		 });
	});
});

function fn_deleteText(obj){
	
	obj.parent().remove();
}


function calculrator(userinput){
		
		var term = document.userinput.p_term.value; 
		var sum = document.userinput.p_price.value;
		var rate = $("#rate").val();
		
	if(document.userinput.p_way.value == "1"){
	 var total = parseInt(parseFloat(sum)*(parseFloat(rate/12))/100);
	 
	 $("#p_avg").val(total);
	 
	}else if(document.userinput.p_way.value == "0"){
	
	var total = parseInt(parseFloat(sum)/parseFloat(term)) + parseInt(parseFloat(sum)*(parseFloat(rate/12))/100);
		
	$("#p_avg").val(total);
	
	}

}		
</script>
<form action="registerPro.dj" method="post" enctype="multipart/form-data" name="userinput">
<input type ="hidden" value="${no}" name="p_brno"/>
제목<input type="text" name="p_name"> <br/>

대출신청내역<br/>
<table border="1"> 
<tr>
<td>구분</td><td>만기</td><td>수익률</td><td>대출금액</td><td>상환방식</td><td>월상환액</td>
</tr>
<tr>
<td>
<select name="p_category">
<option value="${dto.br_category}">
<c:if test="${dto.br_category == 'b'}">
사업자(대출자희망)
</c:if>
<c:if test="${dto.br_category == 'p'}">
개인(대출자희망)
</c:if>
<c:if test="${dto.br_category == 'r'}">
부동산(대출자희망)
</c:if>
<c:if test="${dto.br_category == 'c'}">
매출담보(대출자희망)
</c:if>
</option>
<option value="b">
<c:if test="${dto.br_category == 'b'}">
사업자
</c:if>
</option>
<option value="p">개인</option>
<option value="r">부동산</option>
<option value="c">매출담보</option>
</select>

</td>
<td><input type="text" value="${dto.br_term}" name="p_term">개월</td>
<td>연<input type="text" name="p_rate" id="rate" onkeyup="calculrator(this.target)">%</td>
<td><input type="text" value="${dto.br_sum}" name="p_price" id="p_price">만원</td>
<td>
<select name="p_way">
<option value="${dto.br_way}">${dto.br_way}(대출자희망)</option>
<option value="0">원리금 균등상환</option>
<option value="1">원금만기 일시상환</option>
</select>
</td>
<td><input type="text" name="p_mrepay" id="p_avg">만원</td>
</tr>
<tr>
<td colspan="6">대출목적</td>
</tr>
<tr>
<td colspan="6"><input type="text" value="${dto.br_object}" name="p_purpose"></td>
</tr>
<tr>
<td colspan="6">DJ 평가 한마디</td>
</tr>
<tr>
<td colspan="6"><input type="text" name=""></td>
</tr>
</table>


<input type="button" value="내용추가" id="addText"> <br/>


<table id="textarray" border="1">
</table>


<input type="button" value="서류추가" id="filebutton">	<br/>


<table id="fileupload">
</table>


<div>
<input type="hidden" name="indexno" value="0" id="textindex">
<input type="hidden" name="fileindex" value="0" id="fileindex">
</div>
<input type="hidden" name="br_category" value="${dto.br_category}" >

상환일<select name="p_repayday">
<option value="${dto.br_hopeday}">매월${dto.br_hopeday}일 상환(대출자희망)</option>
<option value="1">매월 1일 상환</option>
<option value="5">매월 5일 상환</option>
<option value="10">매월 10일 상환</option>
<option value="15">매월 15일 상환</option>
<option value="20">매월 20일 상환</option>
<option value="25">매월 25일 상환</option>		
</select>
<br/>
<input type="hidden" value="${dto.memno}" name="p_memeno">
<input type="submit" value="펀딩시작">
</form>
</body>
</html>