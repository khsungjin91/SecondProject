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
		 $("a[name='delete']").on("click",function(e){
			 e.preventDefault();
			 fn_deleteText($(this));
		 });
	});
});

function fn_deleteText(obj){
	
	obj.parent().remove();
}
</script>


<h2>��ǰ�̸�</h2>

<input type="button" value="�����߰�" id="addText"> <br/>

�����û����<br/>
<form action="registerPro.dj" method="post">
<table border="1"> 
<tr>
<td>����</td><td>����</td><td>���ͷ�</td><td>����ݾ�</td><td>��ȯ���</td><td>����ȯ��</td>
</tr>
<tr>
<td>${dto.br_category}</td><td>${dto.br_term}</td><td><input type="text" name="percent">%</td><td>${dto.br_sum}</td><td>${dto.br_way}</td><td>calculate</td>
</tr>
<tr>
<td colspan="6">�������</td>
</tr>
<tr>
<td colspan="6">${dto.br_object}</td>
</tr>
</table>

<table id="textarray" border="1">

</table>
<input type="submit" value="�ݵ�����">
</form>
</body>
</html>