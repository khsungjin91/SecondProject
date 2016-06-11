<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� ����</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	function button() {
		alert("�ش� E-mail�� ������ȣ�� ���� �Ǿ����ϴ�. ");
		$.ajax({
			type : "post",
			url : "/donjom/confirm.dj",
			data : { // url �������� ������ �Ķ����
				chemail : $('#checkemail').val(),
			},
			success : function test(a) {
				$("#callback").html(a);
			},
			error : function whenError() {
				alert("Error");
			}

		});
	}

	function changeAcc() {

		$.ajax({
			type : "post",
			url : "/donjom/change_bank.dj",
			success : function bank(a) {
				$("#changehere").html(a);
			},
			error : function bankfail() {
				alert("error");
			},
		});
	}

	function confirm() {

		if (!$("#name").val()) {
			alert("�̸��� �Է����ּ���.");
			$("#name").focus();
			return false;
		}
		if (!$("#birth").val()) {
			alert("��������� �Է����ּ���.");
			$("#birth").focus();
			return false;
		}
		if (!$(":input:radio[name=gender]:checked").val()) {
			alert("������ �������ּ���.");
			return false;
		}
		if (!$("#mobilenum").val()) {
			alert("��ȭ��ȣ�� �Է����ּ���.");
			$("#mobilenum").focus();
			return false;
		}
		if (!$("#bankcode").val()) {
			alert("������� �Է����ּ���.");
			$("#bankcode").focus();
			return false;
		}
		if (!$("#bankaccnum").val()) {
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
			window.location = "signIn.dj";
		</script>
	</c:if>


	<div class="warpper dash-body">
		<div class="container">
			<jsp:include page="/WEB-INF/settingside.jsp" />
			<div class="col-xs-12 col-sm-8 contetns-warp right">
<!-- ���� ��ü -->
	<div class="col-sm-12 contents-left">
	  <!-- �����κ���ü -->
	  <div class="box box-default contents">
	  	<div class="box-header">
	  		<ol class="breadcrumb contents-menu hidden-xs">
	  		 <li><h3>����</h3></li>
	  		 <li><a href="setting.dj">�⺻����</a></li>
			 <li><a href="setting_cert_person.dj">��������</a></li>
			 <li><a href="setting_session_history.dj">�α��γ���</a>
	  		</ol>
	  	</div>
	  	<div class="box-body">
					<h3 class="box-header">��������</h3>
					
<div class="box-body">
					<!-- �̸� ������� ���� �޴���ȭ ���� ���¹�ȣ �Է±��� -->

					<!-- �Է��� ��� -->

<form class="form-horizontal">
					<c:if test="${dto.name != null}">
						
							<div class="form-group">
								<label class="col-xs-3 control-label">�̸� </label>
								<div class="col-sm-5">
									<input type="text" name="name" value="${dto.name}" class="form-control" disabled>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">�������</label>
								<div class="col-sm-5">
									<input type="text" name="birth" value="${dto.birth}" class="form-control" disabled>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">����</label>
								<div class="col-sm-5">
							<c:if test="${dto.gender =='woman'}">
								<input type="text" name="gender" value="����" class="form-control" disabled>
								
							</c:if>
							<c:if test="${dto.gender == 'men'}">
								<input type="text" name="gender" value="����" class="form-control" disabled>
								
							</c:if>
							</div>
							</div>
							<c:if test="${memdto.confirm == 1}">
						<div class="col-sm-offset-3"><strong class="text-danger"><i class="fa fa-check"></i> ���� ���� �Ϸ� �����Դϴ�.	</strong></div><br>
							</c:if>
							<div class="form-group">
								<label class="col-sm-3 control-label">�޴�����ȣ</label>
								<div class="col-sm-5">
								 <input type="text" name="mobilenum" value="${dto.mobilenum}" class="form-control" disabled>
								 </div></div>
							<!-- ajax ��� ���� ������ �ٲ�� �س��� -->
							<jsp:include page="/profile/bankbody.jsp"></jsp:include>
						
					</c:if>
</form>

					<!-- �Է¾��Ѱ��  -->
					<c:if test="${dto.name == null}">

						<form action="setting_cert_pro.dj" method="post" name="userinput" class="form-horizontal">

							<div class="form-group">
							<label class="col-xs-3 control-label">�̸�</label>
							<div class="col-sm-5">
							<input type="text" name="name" id="name" class="form-control">
							</div>
							</div>
							<div class="form-group">
							<label class="col-xs-3 control-label">�������</label>
							<div class="col-sm-5">
							<input type="text" name="birth" id="birth" maxlength="8" class="form-control">
							 &nbsp; <small>��) 20011203</small>
							</div>
							</div>
							<div class="form-group">
							<label class="col-xs-3 control-label">���� </label>
							<div class="col-sm-5">
							<div class="radio">
							<label><input type="radio" name="gender" id="gender" value="men">���� </label> &nbsp; &nbsp;
							<label><input type="radio" name="gender" id="gender" value="woman">����</label>
							</div>
							</div>
							</div>
							
							<c:if test="${memdto.confirm == 0}">
								<div id="callback" class="form-group">
									<label class="col-xs-3 control-label">���������ϱ�</label>
									<div class="col-xs-5">
									<input type="text" value="${memdto.email}"  name="checkemail" id="checkemail" class="form-control"> 
									</div>
									<input type="button" value="�����ϱ�" onclick="button()" class="btn bg-red">
								</div>
							</c:if>
							<c:if test="${memdto.confirm == 1}">
							<label class="text-danger"><b>�������� �Ϸ� �����Դϴ�.</b>	</label>																				<br />
							</c:if>
							<div class="form-group">
							<label class="col-xs-3 control-label">�޴�����ȣ</label>
							<div class="col-sm-5">
							<input type="text" name="mobilenum" id="mobilenum"
								maxlength="11" class="form-control">
							</div>
							</div>
							 <div class="form-group">
							<label class="col-xs-3 control-label">�����</label>
							<div class="col-sm-5">  
							<select name="bankcode" id="bankcode" class="form-control">
								<option value="��������">��������</option>
								<option value="�츮����">�츮����</option>
								<option value="��������">��������</option>
								<option value="�������">�������</option>
								<option value="��������">��������</option>
								<option value="�ϳ�����">�ϳ�����</option>
							</select> 
							</div>
							</div>
							 <div class="form-group">
							<label class="col-xs-3 control-label">���¹�ȣ</label>
							<div class="col-sm-5"> 
							 <input type="text" name="bankaccnum" id="bankaccnum" class="form-control">
							 </div>
							 <input type="submit" value="�Է¿Ϸ�" onclick="return confirm()" class="btn bg-green"> 
							 </div>
						</form>

					</c:if>
					�� 23:30~01:00 ���̿��� ���� ����� ���� �ð����� �̿뿡 ������ ������ �ֽ��ϴ�. <br /> �� ȯ�ް���
					������ SMS �������� �� �����մϴ� <br /> <br />

					<!-- �ֹε�Ϲ�ȣ�� �ּ� �Է� ���� -->
				<div class="well">
					<div class="box-header">
					<h3 >������ ��õ¡�� ���� </h3>
					�� ���ڸ� �Ͻ÷��� �Ʒ� ������ �Է��Ͻñ� �ٶ��ϴ�.
					</div>
					
					<!-- �Է��� ��� -->
					<br />
					<c:if test="${dto.socialnum != null}">
					<div class="form-horizontal">
					<div class="form-group">
							<label class="col-sm-3 control-label">�ֹε�Ϲ�ȣ</label>
							<div class="col-sm-5">
							<input type="text" name="socialnum" value="${socialnum}" class="form-control" disabled>
							</div>
							</div>
							<div class="form-group">
							<label class="col-sm-3 control-label">�ּ�</label>
							<div class="col-sm-5">
							<input type="text" name="address" value="${dto.address}" class="form-control" disabled>
							</div>
							</div>
							</div>
					</c:if>

					<!-- �Է¾��� ��� -->
					<c:if test="${dto.socialnum == null}">
						<form action="setting_detail_pro.dj" method="post" class="form-horizontal">
							<div class="form-group">
							<label class="col-sm-3 control-label">�ֹε�Ϲ�ȣ</label>
							<div class="col-sm-5">
							<input type="text" name="socialnum" maxlength="13" class="form-control">
							&nbsp; <small>��)8910121234567 </small>
							</div>
							</div>
							<div class="form-group">
							<label class="col-sm-3 control-label">�ּ�</label>
							<div class="col-sm-5">
							<input type="text" name="address" class="form-control">
							 &nbsp; <small>��) ����� ������ ���ﵿ 230-10 </small>
							</div>
							<input type="submit" value="�Է¿Ϸ�" class="btn bg-green">
							</div>
							   
						</form>
					</c:if>

<hr>
					<strong>�� ��õ¡��������? </strong><br>
					<small>������ �����ڰ� ���� ������ �߻��� ���, �����ڰ� ������ �δ��� ������ ������ �̸� ������ ����Ͽ�
					¡���ϰ�, �������� �ҵ� ������ �Ű��ϱ� ���� �����ϴ� ���� �Դϴ�.  ��õ¡������ ���Է� �� ��������
					���ڰ� �Ұ� �մϴ�.</small>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>