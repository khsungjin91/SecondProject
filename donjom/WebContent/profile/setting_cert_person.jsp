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
  
  
  function changeAcc(){
	  
	 	$.ajax({
	 		type: "post",
	 		url:"/donjom/change_bank.dj",
	 		success: function bank(a){ $("#changehere").html(a); },
	 		error : whenError
	 	});
  }
 	
  
  function check(){
	  
	  if(!$("#name").val()){
		  alert("�̸��� �Է����ּ���.");
		  $("#name").focus();
		  return false;
	  }
	  if(!$("#birth").val()){
		  alert("��������� �Է����ּ���.");
		  $("#birth").focus();
		  return false;
	  }
	  if(!$(":input:radio[name=gender]:checked").val()){
		 alert("������ �������ּ���.");
		 return false;
	  }
	  if(!$("#mobilenum").val()){
		  alert("��ȭ��ȣ�� �Է����ּ���.");
		  $("#mobilenum").focus();
		  return false;
	  }
	  if(!$("#bankcode").val()){
		  alert("������� �Է����ּ���.");
		  $("#bankcode").focus();
		  return false;
	  }
	  if(!$("#bankaccnum").val()){
		  alert("���¹�ȣ�� �Է����ּ���.");
		  $("#bankaccnum").focus();
		  return false;
	  }
	  
  }
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<c:if test="${sessionScope.memId == null}">
<script type="text/javascript">
alert("�α��� �� ��밡���մϴ�.");
window.location="signIn.dj";
</script>
</c:if>

<jsp:include page="/WEB-INF/settingside.jsp"/>


<h2>��������</h2>	<br/>

<!-- �̸� ������� ���� �޴���ȭ ���� ���¹�ȣ �Է±��� -->

<!-- �Է��� ��� -->
<c:if test="${dto.name != null}">
�̸�		<input type="text" name="name" value="${dto.name}" disabled="disabled" >				<br/>
�������	<input type="text" name="birth" value="${dto.birth}" disabled="disabled">				<br/>
����		<c:if test="${dto.gender =='woman'}">
		<input type="text" name="gender" value="����" disabled="disabled">			<br/>
		</c:if>
		<c:if test="${dto.gender == 'men'}">
		<input type="text" name="gender" value="����" disabled="disabled">			<br/>
		</c:if>
<c:if test="${memdto.confirm == 1}">
���������Ϸ�����Դϴ�.			<br/>
</c:if>
�޴�����ȣ	<input type="text" name="mobilenum" value="${dto.mobilenum}" disabled="disabled">		
<!-- ajax ��� ���� ������ �ٲ�� �س��� -->
<jsp:include page="/profile/bankbody.jsp"></jsp:include>
</c:if>

<!-- �Է¾��Ѱ��  -->
<c:if test="${dto.name == null}">
<form action="setting_cert_pro.dj" method="post" name="userinput">	

�̸�		<input type="text" name="name" id="name">															<br/>
�������	<input type="text" name="birth" id="birth" maxlength="8">	&nbsp;	��) 20011203		<br/>
����		����<input type="radio" name="gender"  id="gender" value="men">
		����<input type="radio" name="gender"  id="gender" value="woman">										<br/>

<c:if test="${memdto.confirm == 0}">
<div id="mailback">
���������ϱ�<input type="text" value="${memdto.email}" name="checkemail" id="checkemail">						
<input type="button" value="�����ϱ�" id="button">
</div>	
</c:if>
<c:if test="${memdto.confirm == 1}">
���������Ϸ�����Դϴ�.																					<br/>
</c:if>														
�޴�����ȣ	<input type="text" name="mobilenum" id="mobilenum" maxlength="11">						<br/>
����� <select name="bankcode" id="bankcode">
	<option value="��������">��������</option>
	<option value="�츮����">�츮����</option>
	<option value="��������">��������</option>
	<option value="�������">�������</option>
	<option value="��������">��������</option>
	<option value="�ϳ�����">�ϳ�����</option>
	</select>																					<br/>
���¹�ȣ	<input type="text" name="bankaccnum" id="bankaccnum">									<br/>
<input type="submit" value="�Է¿Ϸ�" onclick="return check()">									<br/>
</form>
</c:if>
�� 23:30~01:00 ���̿��� ���� ����� ���� �ð����� �̿뿡 ������ ������ �ֽ��ϴ�.										<br/>
�� ȯ�ް��� ������ SMS �������� �� �����մϴ�																	<br/><br/>

<!-- �ֹε�Ϲ�ȣ�� �ּ� �Է� ���� -->

������ ��õ¡�� ����																					<br/>
�� ���ڸ� �Ͻ÷��� �Ʒ� ������ �Է��Ͻñ� �ٶ��ϴ�.	
<!-- �Է��� ��� -->																				<br/>
<c:if test="${dto.socialnum != null}">
�ֹε�Ϲ�ȣ<input type="text" name="socialnum" value="${socialnum}" disabled="disabled">			<br/>
�ּ�		<input type="text" name="address" value="${dto.address}" disabled="disabled">			<br/>
</c:if>

<!-- �Է¾��� ��� -->
<c:if test="${dto.socialnum == null}">
<form action="setting_detail_pro.dj" method="post">
�ֹε�Ϲ�ȣ<input type="text" name="socialnum" maxlength="13"> &nbsp; ��)8910121234567				<br/>
�ּ�		<input type="text" name="address">	&nbsp; ��) ����� ������ ���ﵿ	230-10						<br/>
<input type="submit" value="�Է¿Ϸ�">																<br/>
</form>
</c:if>


�� ��õ¡��������?
������ �����ڰ� ���� ������ �߻��� ���, �����ڰ� ������ �δ��� ������ ������ �̸� ������ ����Ͽ� ¡���ϰ�, �������� �ҵ� ������ �Ű��ϱ� ���� �����ϴ� ���� �Դϴ�.	<br/>
��õ¡������ ���Է� �� �������� ���ڰ� �Ұ� �մϴ�.
</body>
</html>