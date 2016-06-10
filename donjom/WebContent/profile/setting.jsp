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
<style type="text/css">
.filebox input[type="file"] {  /* ���� �ʵ� ����� */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

</style>
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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery.form.js"></script>
<script>
function upload(){
	
	  var form = $("#save")[0];
		alert(form)
	  var formData = new FormData(form);
	$.ajax({
		url : "/donjom/upload.dj",
		data : {
			save : formData
		},
		processData: false,
  	    contentType: false,
		type : "post",
		success : function test(data){ alert("good"); },
		error : function error(){ alert("error"); }
		
	});
	alert("end"); 
}


function deleteimg(){
	
	$.ajax({
		
		type:"post",
		url:"/donjom/deleteimg.dj",
		success : function test(data){ $("#img").html(data); },
		error : function error(){ alert("error"); }
	});
	
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
function view(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // ������� ������
            $target.html('<img src="' + e.target.result + '" border="0" width="150" class="img-circle" alt="review" />');
        }
        reader.readAsDataURL(html.files[0]);
    }
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

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>


	<div class="warpper dash-body">
		<div class="container">
<jsp:include page="/WEB-INF/settingside.jsp"/>

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
				 <label class="col-xs-4 control-label">�г���</label>
				 <div class="col-xs-5">
				 <input type="text" name="nickname" value="${dto.nickname}" class="form-control">
				 </div>
				</div>
				<div class="form-group">
				 <label class="col-xs-4 control-label">�̸���</label>
				 <div class="col-xs-5">
				 <input type="text"   value=" ${dto.email}" class="form-control" disabled>
				 </div>
				</div>	
				<div class="form-group">
				 <label class="col-xs-4 control-label">������</label>
				 <div class="col-xs-5">
				 ${dto.join}
				 </div>
				</div>		
				
			<div id="img" class="form-group">
				 <label class="col-xs-4 control-label">�����ʻ�������</label>
				 
				 <div class="col-xs-5">
				<c:if test="${dto.profile == null}">			
 					
 					<input type="file" name="save" id="save" onchange="view(this,$('#imgreview'))" > 
 					<br/><div id="imgreview" ></div>		<!-- �̹��� �̸�����  -->
				</c:if>
				<c:if test="${dto.profile != null}">	
					<input type="hidden" value="${dto.profile}" name="profile">	
					<img src="/donjom/save/${dto.profile}" width="150" class="img-circle"> 
					<input type="button" value="�̹�������" onclick="deleteimg()">
				</c:if> 
				 </div>
				 
				<!--  <div class="col-xs-5">
				<c:if test="${dto.profile == null}">			
 					<input type="file" name="save" id="save" onchange="upload()">		
				</c:if>
				<c:if test="${dto.profile != null}">	
					<input type="hidden" value="${dto.profile}" name="profile">	
					<img src="/donjom/save/${dto.profile}" width="100"> 
				</c:if> 
				 </div> -->
			</div>	
			<hr>
			
	<h3>��й�ȣ ���� </h3>
		<div class="form-group">
				 <label class="col-xs-4 control-label">����й�ȣ </label>
				 <div class="col-xs-5">
				 <input type="password" name="newpw" class="form-control">	
				 </div>
				</div>	
		<div class="form-group">
				 <label class="col-xs-4 control-label">����й�ȣ Ȯ�� </label>
				 <div class="col-xs-5">
				  <input type="password" name="pwch" onkeyup="pwcheck()"class="form-control">	
				</div>
			</div>
			
			<div id="checkPwd" ><small>�� ��й�ȣ�� Ȯ�����ּ���</small></div>
			<div class="form-group">
				 <label class="col-xs-4 control-label">���� ��й�ȣ </label>
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
<%-- <c:if test="${dto.snsreceive == 'on'}">
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
</c:if> --%>

<input type="submit" value="Ȯ��">
</form>

* DJ���񽺸� ���̻� ������ ���� ���
<input type="button" value="����" onClick="javascript:open_win_noresizable('signup_checkPw.dj?email=${dto.email}')">
	  		 
	  		 </div>
	  		</div>
	  	</div>
	  </div>
	</div>
  </div><!-- �����κ� ��ü ���� -->
</div><!-- ��ü warp -->

</body>
</html>