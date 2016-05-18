<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../style/css/herb.css" rel="stylesheet">
	<link href="../bt/css/bootstrap.min.css" rel="stylesheet">
 	<link href="../bt/css/bootstrap-theme.min.css" rel="stylesheet">
 	<title>�����û</title>
</head>
<body>
<c:if test="${sessionScope.memId == null }">
<script type="text/javascript">
window.location="signIn.dj";
</script>
</c:if>


<h2>������</h2>
<div id="loan-btn-sm">
	<img src="">
</div>
<form action="loan_step2.dj" method="post" class="form-horizontal">
	<div class="form-group">
		<label class="col-sm-2 control-label">�̸�</label>
		<div class="col-sm-10">
			<input type="text" name="memname" value="${sedto.name}" class="form-control" >
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">�������</label>
		<div class="col-sm-10">
			<input type="text" name="membirth" value="${sedto.birth}" class="form-control"  >
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">����</label>
		<div class="col-sm-10">
			<input type="text" name="sex" value="${sedto.gender}" class="form-control" >
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">�̸��� �ּ�</label>
		<div class="col-sm-10">
			<input type="text" name="mememail" value="${memdto.email}" class="form-control" >
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">�޴��� ��ȣ</label>
		<div class="col-sm-10">
			<input type="text" name="memphone" value="${sedto.mobilenum}" class="form-control" >
		</div>
	</div>
			<div class="form-group">
		<label class="col-sm-2 control-label">��� �����</label>
		<div class="col-sm-10">
			<input type="text" name="br_sum" class="form-control" >����
		</div>
	</div>
	
		<div class="form-group">
		<label class="col-sm-2 control-label">��ȯ ���</label>
		<div class="col-sm-10">
			<select name="br_way" class="form-control">
				<option value="������ �յ� ��ȯ">������ �յ� ��ȯ</option>
				<option value="���ݸ��� �Ͻû�ȯ">���ݸ��� �Ͻû�ȯ</option>
			</select>
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">��� ����Ⱓ</label>
		<div class="col-sm-10">
			<select name="br_term" class="form-control">
				<option value="1">1����</option>
				<option value="2">2����</option>
				<option value="3">3����</option>
				<option value="4">4����</option>
				<option value="5">5����</option>
				<option value="6">6����</option>
				<option value="12">12����</option>
				<option value="18">18����</option>
				<option value="24">24����</option>
				<option value="36">36����</option>
			</select>
			<input type="button" value="���ڰ���" class="btn btn-success">
		</div>
	</div>


����Ͻø� <a href="#">���Űŷ��μӾ��</a>�� �����ϰ� �˴ϴ�.
<input type="submit" value="�����û" class="btn btn-primary" name="loan-btn">
</form>



<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
    <script src="../bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>