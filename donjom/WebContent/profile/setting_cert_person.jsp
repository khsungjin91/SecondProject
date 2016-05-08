<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

$(document).ready(function(){
    $("#button").click(function(){
        callAjax();
    });
  });
  
  function callAjax(){
	  
      $.ajax({
	        type: "post",
	        url : "/donjom/confirm.dj" ,
	        data: {	// url �������� ������ �Ķ����
	        	chemail : $('#checkemail').val(),
	        },
	        success: test,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
   	});
  }
  function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
      $("#mailback").html(aaa);
      console.log(resdata);
  }
  function whenError(){
      alert("Error");
  }

  
  
  function check(){
	  
	  var f1 = document.userinput;
	  
	  if(!f1.name.value){
		  alert("�̸��� �Է����ּ���.");
		  f1.name.focus();
		  return false;
	  }
	  if(!f1.birth.value){
		  alert("��������� �Է����ּ���.");
		  f1.birth.focus();
		  return false;
	  }
	  if(!f1.gender.checked){
		  alert("������ üũ���ּ���.");
		  f1.gender.focus();
		  return false;
	  }
	  if(!f1.mobilenum.value){
		  alert("��ȭ��ȣ�� �Է����ּ���.");
		  f1.mobilenum.focus();
		  return false;
	  }
	  if(!f1.bankcode.value){
		  alert("������� �Է����ּ���.");
		  f1.bankcode.focus();
		  return false;
	  }
	  if(!f1.bankaccnum.value){
		  alert("���¹�ȣ�� �Է����ּ���.");
		  f1.bankaccnum.focus();
		  return false;
	  }
	  
  }
</script>

</head>
<body>


<a href="setting.dj">�⺻���� ����</a>	<br/><br/>

<ul>
	<li>������</li>	
	<li><a href="dashboard.dj">��ú���</a></li>
	<li><a href="invest_history.dj">���ڳ���</a></li>
	<li><a href="laon_history.dj">���⳻��</a></li>
	<li><a href="point_deposit.dj">����/ȯ��</a></li>
	<li><a href="notification.dj">�˸��޼���</a></li>
	<li><a href="setting.dj">����</a></li>
	<li><a href="helf.dj">����</a></li>	
	<li><a href="logout.dj">�α׾ƿ�</a></li>			
</ul>

���� 		<br/>

<a href="setting.dj">�⺻����</a>
<a href="setting_cert_person.dj">��������</a>
<a href="setting_session_history.dj">�α��γ���</a>			<br/>


<a href="setting_cert_person.dj">ȸ������</a>
<a href="setting_cert_social.dj">�Ҽȿ���</a>			<br/>

<h2>��������</h2>	<br/>

<c:if test="${dto.name != null}">
�̸�		<input type="text" name="name" value="${dto.name}" disabled="disabled" >				<br/>
�������	<input type="text" name="birth" value="${dto.birth}" disabled="disabled">				<br/>
����		<input type="text" name="gender" value="${dto.gender}" disabled="disabled">				<br/>
<c:if test="${memdto.confirm == 1}">
���������Ϸ�����Դϴ�.			<br/>
</c:if>
�޴�����ȣ	<input type="text" name="mobilenum" value="${dto.mobilenum}" disabled="disabled">		<br/>
<!-- ajax ��� -->
�����	<input type="text" name="bankcode" value="${dto.bankcode}" disabled="disabled">			<br/>
���¹�ȣ	<input type="text" name="bankaccnum" value="${dto.bankaccnum}" disabled="disabled">		<br/>
<input type="button" value="���� �� ���� ����" onclick="">											<br/>
</c:if>



<c:if test="${dto.name == null}">
<form action="setting_cert_pro.dj" method="post" name="userinput">	
<input type="hidden" name="no" value="${no}">	
�̸�		<input type="text" name="name">															<br/>
�������	<input type="text" name="birth">														<br/>
����		����<input type="radio" name="gender" value="men">
		����<input type="radio" name="gender" value="woman">										<br/>

<c:if test="${memdto.confirm == 0}">
<div id="mailback">
���������ϱ�<input type="text" value="${memdto.email}" name="checkemail" id="checkemail">						
<input type="button" value="�����ϱ�" id="button">
</div>	
</c:if>
<c:if test="${memdto.confirm == 1}">
���������Ϸ�����Դϴ�.	
</c:if>
																		
�޴�����ȣ	<input type="text" name="mobilenum">													<br/>
�����	<input type="text" name="bankcode">														<br/>
���¹�ȣ	<input type="text" name="bankaccnum">													<br/>
<input type="submit" value="�Է¿Ϸ�" onclick="return check()">									<br/>
</form>
</c:if>
�� 23:30~01:00 ���̿��� ���� ����� ���� �ð����� �̿뿡 ������ ������ �ֽ��ϴ�.											<br/>
�� ȯ�ް��� ������ SMS �������� �� �����մϴ�																	<br/><br/>


������ ��õ¡�� ����																					<br/>
�� ���ڸ� �Ͻ÷��� �Ʒ� ������ �Է��Ͻñ� �ٶ��ϴ�.																<br/>
<c:if test="${dto.socialnum != null}">
�ֹε�Ϲ�ȣ<input type="text" name="socialnum" value="${dto.socialnum}" disabled="disabled">		<br/>
�ּ�		<input type="text" name="address" value="${dto.address}" disabled="disabled">			<br/>
</c:if>

<c:if test="${dto.socialnum == null}">
<form action="setting_detail_pro.dj" method="post">
<input type="hidden" name="no" value="${no}">	
�ֹε�Ϲ�ȣ<input type="text" name="socialnum">													<br/>
�ּ�		<input type="text" name="address">														<br/>
<input type="submit" value="�Է¿Ϸ�">																<br/>
</form>
</c:if>


�� ��õ¡��������?
������ �����ڰ� ���� ������ �߻��� ���, �����ڰ� ������ �δ��� ������ ������ �̸� ������ ����Ͽ� ¡���ϰ�, �������� �ҵ� ������ �Ű��ϱ� ���� �����ϴ� ���� �Դϴ�.	<br/>
��õ¡������ ���Է� �� �������� ���ڰ� �Ұ� �մϴ�.
</body>
</html>