<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>

function checkIt(){
	
	if(!document.userinput.nickname.value){	
		alert("�г����� �Է����ּ���");
		document.userinput.nickname.focus();
		return false;
	}
	
	if(!document.userinput.pw.value){
		alert("�����й�ȣ�� �Է����ּ���");
		document.userinput.pw.focus();
		return false;
	}
	
}

function pwcheck(){
	
	var f1 = document.userinput;
	
	var pw = f1.newpw.value;
	var pwch = f1.pwch.value;
	
	if(pw != pwch){
		document.getElementById("checkPwd").innerHTML = "<font color=red>��й�ȣ�� Ȯ�����ּ���.</font>";	
	}else{
		
		document.getElementById("checkPwd").innerHTML = "<font color=green>��й�ȣ�� �����մϴ�.</font>";
	}
	
}

function open_win_noresizable (url, name) {
	var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
}

</script>
</head>
<body>


${dto.profile}		<br/>
${dto.nickname}		<br/>
${dto.email}		<br/>
������ ${dto.join}			<br/>	

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

���� 

<a href="setting.dj">�⺻����</a>
<a href="setting_cert_person.dj">��������</a>
<a href="setting_session_history.dj">�α��γ���</a>


<h2>ȸ������</h2>

<form action="signup_modifyPro.dj" method="post" enctype="multipart/form-data" name="userinput">
�г��� <input type="text" name="nickname" value="${dto.nickname}">		<br/>
�̸��� ${dto.email}								<br/>
������ ${dto.join}									<br/>
<c:if test="${dto.profile == null}">			
�����ʻ������� <input type="file" name="save">		<br/>
</c:if>
<c:if test="${dto.profile != null}">	
<input type="hidden" value="${dto.profile}" name="profile">	
<img src="/save/${dto.profile}">				<br/>
</c:if> 
��õ���̸��� <input type="text" name="goodemail">	<br/>

��й�ȣ���� 										<br/>
����й�ȣ <input type="password" name="newpw">			<br/>
����й�ȣ Ȯ�� <input type="password" name="pwch" onkeyup="pwcheck()">	<br/>
<div id="checkPwd">��й�ȣ�� Ȯ�����ּ���</div>
�����й�ȣ <input type="password" name="pw">			<br/>
�غ����� ���� ���������� ���� ��й�ȣ�� �Է����ּ���.			<br/>

<input type="submit" value="����" onclick="return checkIt()">				<br/><br/>
</form>

�˸�����
<form action="signup_modifyPro2.dj" method="post" enctype="multipart/form-data">
<c:if test="${dto.snsreceive == 'on'}">
SNS ���ŵ���<input type="checkbox" name="snsreceive" checked="checked">			<br/>
</c:if>
<c:if test="${dto.snsreceive != 'on'}">
SNS ���ŵ���<input type="checkbox" name="snsreceive">			<br/>
</c:if>
<c:if test="${dto.emailreceive == 'on'}">
EMAILL ���ŵ���<input type="checkbox" name="emailreceive" checked="checked">		<br/><br/>
</c:if>
<c:if test="${dto.emailreceive != 'on'}">
EMAILL ���ŵ���<input type="checkbox" name="emailreceive">		<br/><br/>
</c:if>

<input type="submit" value="Ȯ��">
</form>

* DJ���񽺸� ���̻� ������ ���� ���
<input type="button" value="����" onClick="javascript:open_win_noresizable('signup_checkPw.dj?email=${dto.email}')">

</body>
</html>