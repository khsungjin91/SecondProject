<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
function check(){
	
var user = document.userinput;
var price = ${dto.p_price};
var invest = ${dto.p_invest};
var mi = price - invest;
var limit = ${limit};

if(!user.amount.value){
	alert("���ڱݾ��� �Է��� �ּ���");
	user.amount.focus();
	return false;
}
if(user.amount.value == '0'){
	alert("���ڱݾ��� 0�� �� �� �����ϴ�.");
	user.amount.focus();
	return false;
}
if(user.amount.value > limit){
	alert("�ִ� ���� ���� �ݾ���"+limit+"���� �Դϴ�.");
	user.amount.focus();
	return false;
}
if(user.amount.value > mi){
	alert("���Ⱑ�ɱݾ��� �ʰ��մϴ� \n\n�� ���� �ݾ����� �������ּ���.");
	user.amount.focus();
	return false;
}

}
</script>
</head>
<body>

<h2>${dto.p_name}</h2>

<form action="fund_ready.dj" method="post" name="userinput">
<input type="hidden" name="email" value="${email}">
<div style="float: left;">
<table border="1">
<tr>
<td>��ǰ�ڵ�</td><td>�������</td><td>�����ð�</td>
</tr>
<tr>
<td>${dto.p_code}</td><td>${dto.p_category}</td><td>Time</td>
</tr>
</table>

<input type="hidden" value="${dto.p_code}" name="p_code">

�����û����
<table border="1">
<tr>
<td>����</td><td>����</td><td>���ͷ�</td><td>����ݾ�</td><td>��ȯ���</td><td>����ȯ��</td>
</tr>
<tr>
<td>${dto.p_category}</td><td>${dto.p_term}����</td><td>${dto.p_rate}%</td><td>${dto.p_price}����</td><td>${dto.p_way}</td><td>${dto.p_mrepay}����</td>
</tr>
<tr>
<td colspan="6">�������</td>
</tr>
<tr>
<td colspan="6">${dto.p_purpose}</td>
</tr>
<c:forEach var="conlist" items="${contentlist}">
<tr>
<td colspan="6">${conlist.p_content}</td>
</tr>
</c:forEach>
<tr>
<td colspan="6">
<c:forEach var="filelist" items="${filelist}">
<a href="/donjom/file/${filelist.p_file}">${filelist.p_file}/</a>
</c:forEach>
</td>
</tr>

</table>
</div>


<div style="float: left;">
<table border="1">
<tr><td>${dto.p_invest}����/${dto.p_price}����</td></tr>
<tr><td>������ �ο���</td></tr>
<tr><td>${dto.p_people}��</td></tr>
<tr><td>��ȯ���</td></tr>
<tr><td>${dto.p_way}</td></tr>
<tr><td>���ͷ�</td></tr>
<tr><td>${dto.p_rate}%</td></tr>
<tr><td>���ڱⰣ</td></tr>
<tr><td>${dto.p_term}����</td></tr>
<c:if test = "${dto.p_success == 'doing' &&  check == 0 && When.When == 1}">
<tr><td>���ڱݾ�</td></tr>
<tr>
<td>
<input type="text" name="amount">����
</td>
</tr>
</c:if>
<tr><td>�ݵ��Ⱓ : 1����</td></tr>
<c:if test="${dto.p_success == 'doing' && check == 0 && When.When == 1}">
<tr><td>�ִ����ڰ��ɱݾ�</td></tr>
<tr><td>${limit}����</td></tr>
</c:if>
<tr><td>��ȯ�� : �ſ�${dto.p_repayday}�� + 5��</td></tr>
<tr>
<c:if test="${dto.p_success == 'doing' && When.When == 0}">
	<c:if test="${dto.p_success == 'doing' && When.WhenTUS == 2}">
		 <script type="text/javascript">
		    $(document).ready(function(){
		    	window.setInterval('callAjax()', 1000); //3�ʸ����ѹ��� �Լ��� �����Ѵ�..!! 
		    });
		    function callAjax(){
		    	 $.ajax({
		 	        type: "post",
		 	        url : "/donjom/timemelee.dj",
		 	        success: test,	// ��������û ������ ���� �Լ�
		 	        error: whenError	//��������û ���н� �����Լ�
		      	});
		    }
		    function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
		        $("#time").html(aaa);
		    }
		    function whenError(){
		        alert("Error");
		    }
		  </script>

	</c:if>

<td>
	<div id="time">�ݵ����ô� �������Դϴ�.</div>
</td>

</c:if>


<c:if test="${When.When == 1}">

<c:if test="${dto.p_success == 'doing' && check == 0}">
<td><input type="submit" value="���ڹ̸�����" onclick="return check()"></td>
</c:if>

<c:if test="${dto.p_success == 'doing' && check != 0}">
<td><input type="button" value="���ڿϷ�"></td>
</c:if>

</c:if>

<c:if test="${dto.p_success == 'success'}">
<td><input type="button" value="�ݵ�����"></td>
</c:if>

<c:if test="${dto.p_success == 'fail'}">
<td><input type="button" value="�ݵ�����"></td>
</c:if>

</tr>

</table>
</div>
</form>

</body>
</html>