<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<title>Insert title here</title>
<script>

function checkIt(){
	
	var pw = document.userinput.newpw.value;
	var pwch = document.userinput.pwch.value;
	
	
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
	if(pw != pwch){
		alert("���ο� ��й�ȣ�� ���� �����ʽ��ϴ�.");
		document.userinput.pwch.focus();
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

<c:if test="${sessionScope.memId == null }">

<script type="text/javascript">
alert("�α��� �� ��밡���մϴ�.");
window.location="signIn.dj";
</script>

</c:if>


<div class="container warp">
<!-- warp���� -->
  <div class="col-sm-3 mobile-profile-nav">
    <div class="user-info text-center radius">						
		<img src="/donjom/save/${dto.profile}" class="img-circle" width="90"  height="90">
		<p class="name txt-cut-line user-nick">${dto.nickname}	</p>
		<p class="email txt-cut-line">${dto.email}</p>
		<p class="date">������  ${dto.join}</p>
		<div class="btn-profile-edit hidden-xs">
			<button type="button" class="btn btn-success" onclick="location.href='setting.dj'"><i class="fa fa-cog"></i> �⺻���� ����</button>
		</div>
	</div>
	<ul class="menu menu-dashboard radius">
				<li class="dashboard"><a href ="dashboard.dj" class="active"><span class="glyphicon glyphicon-dashboard"></span> ��ú���</a></li>
				<li class="invest"><a href="invest_history.dj" class=""> ���ڳ���</a></li>
				<li class="lend"><a href="laon_history.dj" class=""> ���⳻��</a></li>
				<li class="moeny"><a href="point_deposit.dj" class=""> ����/ȯ��</a></li>
				<li class="moeny hidden-xs"><a href="notification.dj" class="">�˸� �޼���</a></li>
				<li class="setting"><a href="setting.dj" class="">����</a></li>
			</ul>
  </div>

<div class="col-xs-12 col-sm-9 contetns-warp right">
<!-- ���� ��ü -->
	<div class="col-sm-12 contents-left">
	  <!-- �����κ���ü -->
	  <div class="panel panel-default contents">
	  	<div class="panel-heading">
	  		<ol class="breadcrumb contents-menu hidden-xs">
	  		 <li><h3>����</h3></li>
	  		 <li><a href="setting.dj">�⺻����</a></li>
			 <li><a href="setting_cert_person.dj">��������</a></li>
			 <li><a href="setting_session_history.dj">�α��γ���</a>
	  		</ol>
	  	</div>
	  	<div class="panel-body">
	  	  <div class="nav-tabs-custom">
	  		<ul class="nav nav-tabs">
	  		 <li class="active"><a href="#">ȸ������</a></li>
	  		 <li><a href="#">�Ҽȿ���</a></li>
	  		</ul>
	  	</div>
	  		<div class="cate">
	  		<div class="form-warp">
	  		<h3>ȸ������ </h3>
	  		 <form class="form-horizontal" action="signup_modifyPro.dj" method="post" enctype="multipart/form-data" name="userinput" >
				<div class="form-group">
				 <label class="col-xs-2 control-label">�г���</label>
				 <div class="col-xs-5">
				 <input type="text" name="nickname" value="${dto.nickname}" class="form-control" disabled>
				 </div>
				</div>
				<div class="form-group">
				 <label class="col-xs-2 control-label">�̸���</label>
				 <div class="col-xs-5">
				 <input type="text"   value=" ${dto.email}" class="form-control" disabled>
				 </div>
				</div>	
				<div class="form-group">
				 <label class="col-xs-2 control-label">������</label>
				 <div class="col-xs-5">
				 ${dto.join}
				 </div>
				</div>		
				
			<div class="form-group">
				 <label class="col-xs-2 control-label">�����ʻ�������</label>
				 <div class="col-xs-5">
				<c:if test="${dto.profile == null}">			
 					<input type="file" name="save">		
				</c:if>
				<c:if test="${dto.profile != null}">	
					<input type="hidden" value="${dto.profile}" name="profile">	
					<img src="/donjom/save/${dto.profile}" width="150">				
				</c:if> 
				 </div>
			</div>	
			<hr>
				<div class="form-group">
				 <label class="col-xs-2 control-label">��õ���̸��� </label>
				 <div class="col-xs-5">
				 <input type="text" name="goodemail" class="form-control">	
				 </div>
				</div>							
<hr>
	<h3>��й�ȣ ���� </h3>
		<div class="form-group">
				 <label class="col-xs-2 control-label">����й�ȣ </label>
				 <div class="col-xs-5">
				 <input type="password" name="newpw" class="form-control">	
				 </div>
				</div>	
		<div class="form-group">
				 <label class="col-xs-2 control-label">����й�ȣ Ȯ�� </label>
				 <div class="col-xs-5">
				  <input type="password" name="pwch" onkeyup="pwcheck()"class="form-control">	
				</div>
				 </div>
				 <div id="checkPwd" class="text-right">��й�ȣ�� Ȯ�����ּ���</div>
			
			<div class="form-group">
				 <label class="col-xs-2 control-label">���� ��й�ȣ </label>
				 <div class="col-xs-5">
				  <input type="password" name="pw" class="form-control"><br/>
				  <div class="text-right"> �غ����� ���� ���������� ���� ��й�ȣ�� �Է����ּ���.</div>		
				 </div>
				</div>
				
	<input type="submit" value="����" onclick="return checkIt()" class="btn btn-success">	
</form>
</div>
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
	  		 
	  		 
	  		</div>
	  	</div>
	  </div>
	</div>
  </div><!-- �����κ� ��ü ���� -->
</div><!-- ��ü warp -->

<img src="/donjom/save/${dto.profile}" width="150">		<br/>
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
</ul>

���� 




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
<img src="/donjom/save/${dto.profile}" width="150">				<br/>
</c:if> 

��õ���̸��� <input type="text" name="goodemail">	<br/>

��й�ȣ���� 										<br/>
����й�ȣ <input type="password" name="newpw">			<br/>
����й�ȣ Ȯ�� <input type="password" name="pwch" onkeyup="pwcheck()">	<br/>
<div id="checkPwd">��й�ȣ�� Ȯ�����ּ���</div>
�����й�ȣ <input type="password" name="pw">		<br/>
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