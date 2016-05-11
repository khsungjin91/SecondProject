<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		 alert(textindex);
		 $("#textarray").append(
			"<tr><td>" +
		 	"<textarea rows='10' cols='80' name='content["+textindex+"]'></textarea> <a href='#this' name='delete'>����</a>" +
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
		 alert(fileindex);
		 $("#fileupload").append(
			"<tr><td>" +
		 	"<input type='file' name='upfile["+fileindex+"]'> <a href='#this' name='delete'>����</a>" +
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
		
		var sum = document.userinput.p_price.value;
		var rate = $("#rate").val();
		
	 var avg = sum*rate/100;
	 
	 var total = parseInt(avg)+parseInt(sum);
	 
	 $("#p_avg").val(total);
}		



</script>
<form action="registerPro.dj" method="post" enctype="multipart/form-data" name="userinput">

����<input type="text" name="p_name"> <br/>

�����û����<br/>
<table border="1"> 
<tr>
<td>����</td><td>����</td><td>���ͷ�</td><td>����ݾ�</td><td>��ȯ���</td><td>����ȯ��</td>
</tr>
<tr>
<td>
<select name="p_category">
<option value="${dto.br_category}">${dto.br_category}(���������)</option>
<option value="�����">�����</option>
<option value="����">����</option>
<option value="�ε���">�ε���</option>
<option value="����㺸">����㺸</option>
</select>
</td>
<td><input type="text" value="${dto.br_term}" name="p_term">����</td>
<td>��<input type="text" name="p_rate" id="rate" onkeyup="calculrator(this.target)">%</td>
<td><input type="text" value="${dto.br_sum}" name="p_price" id="p_price">����</td>
<td><input type="text" value="${dto.br_way}" name="p_way"></td>
<td><input type="text" name="p_avg" id="p_avg"></td>
</tr>
<tr>
<td colspan="6">�������</td>
</tr>
<tr>
<td colspan="6"><input type="text" value="${dto.br_object}" name="p_purpose"></td>
</tr>
<tr>
<td colspan="6">DJ �� �Ѹ���</td>
</tr>
<tr>
<td colspan="6"><input type="text" name=""></td>
</tr>
</table>


<input type="button" value="�����߰�" id="addText"> <br/>


<table id="textarray" border="1">
</table>


<input type="button" value="�����߰�" id="filebutton">	<br/>


<table id="fileupload">
</table>


<div>
<input type="hidden" name="indexno" value="0" id="textindex">
<input type="hidden" name="fileindex" value="0" id="fileindex">
</div>
<input type="hidden" name="br_category" value="${dto.br_category}" >

��ȯ��<select name="p_repayday">
<option value="${dto.br_hopeday}">�ſ�${dto.br_hopeday}�� ��ȯ(���������)</option>
<option value="1">�ſ� 1�� ��ȯ</option>
<option value="5">�ſ� 5�� ��ȯ</option>
<option value="10">�ſ� 10�� ��ȯ</option>
<option value="15">�ſ� 15�� ��ȯ</option>
<option value="20">�ſ� 20�� ��ȯ</option>
<option value="25">�ſ� 25�� ��ȯ</option>		
</select>
<br/>
<input type="submit" value="�ݵ�����">
</form>
</body>
</html>