<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../style/css/herb.css" rel="stylesheet">
	<link href="../bt/css/bootstrap.min.css" rel="stylesheet">
 	<link href="../bt/css/bootstrap-theme.min.css" rel="stylesheet">
 	<title>�����û �߰�����</title>
</head>
<body>
<h2>��������</h2>
<div id="fund-form">
<form action="loan_writePro.dj" method="post" class="form-horizontal">

<input type="hidden" value="${br_sum}" name="br_sum">
<input type="hidden" value="${br_way}" name="br_way">
<input type="hidden" value="${br_term}" name="br_term">

		<div class="form-group">
			<label class="col-sm-2 control-label">���� ����</label>
			<div class="col-sm-7">
				<select class="form-control" name="br_category">
					<option value="p">����</option>
					<option value="b">�����</option>
					<option value="r">�ε���</option>
					<option value="c">����㺸</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">���� ����</label>
			<div class="col-sm-7">
				<select class="form-control" name="br_work">
					<option>���� ������ ������ �ּ���.</option>
					<option value="�����">�����</option>
					<option value="�߼ұ��">�߼ұ��</option>
					<option value="��ŸƮ��">��ŸƮ��</option>
					<option value="��Ÿ">��Ÿ</option>
				</select>
			</div>
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">����</label>
		<div class="col-sm-7">
			<select class="form-control" name="br_job">
				<option>������ ������ �ּ���.</option>
				<option value="������">������</option>
				<option value="������">������</option>
				<option value="���񽺾�">���񽺾�</option>
				<option value="����Ʈ����">����Ʈ����</option>
				<option value="������">������</option>
				<option value="�Ǽ���">�Ǽ���</option>
				<option value="�ܽľ�">�ܽľ�</option>
				<option value="�����">�����</option>
				<option value="�Ǿ���">�Ǿ���</option>
				<option value="������">������</option>
				<option value="���">���</option>
				<option value="��Ÿ">��Ÿ</option>
			</select>
		</div>
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">��� ����</label>
		<div class="col-sm-7">
			<select class="form-control" name="br_employ">
				<option>��� ���¸� ������ �ּ���.</option>
				<option value="������">������</option>
				<option value="�����(��������)">�����(��������)</option>
				<option value="��������">��������</option>
				<option value="��Ÿ">��Ÿ</option>
			</select>
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">���ҵ�(����)</label>
		<div class="col-sm-8">
			<input type="text" name="br_ycomein" class="form-control" >����
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">�� ��� �ҵ�</label>
		<div class="col-sm-8">
			<input type="text" name="br_mavg" class="form-control" >����
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">�� ��ä ��ȯ��</label>
		<div class="col-sm-8">
			<input type="text" name="br_mrepay" class="form-control" >����
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">�� ���� ���</label>
		<div class="col-sm-8">
			<input type="text" name="br_mlockpay" class="form-control" >����
		</div>
		</div>
		
		
		<div class="form-group">
		<label class="col-sm-2 control-label">�������</label>
		<div class="col-sm-8">
			<textarea name="br_object" class="form-control" cols="50" rows="10"></textarea>
		</div>
		</div>
		

		<div class="form-group">
		<label class="col-sm-2 control-label">��� ��ȯ�Ⱓ</label>
		<div class="col-sm-10">
			<select name="br_hopeday">
			<option value="1">�ſ� 1�� ��ȯ</option>
			<option value="5">�ſ� 5�� ��ȯ</option>
			<option value="10">�ſ� 10�� ��ȯ</option>
			<option value="15">�ſ� 15�� ��ȯ</option>
			<option value="20">�ſ� 20�� ��ȯ</option>
			<option value="25">�ſ� 25�� ��ȯ</option>		
			</select>
		</div>
	</div>

<input type="button" value="���ڰ���" class="btn btn-success"><br/>
����Ͻø� <a href="#">���Űŷ��μӾ��</a>�� �����ϰ� �˴ϴ�.


<input type="hidden" value="${memname}" name="memname" >
<input type="hidden" value="${membirth}" name="membirth" >
<input type="hidden" value="${mememail}" name="mememail" >
<input type="hidden" value="${memphone}" name="memphone" >

<input type="submit" value="�����û" class="btn btn-primary" name="loan-btn">
</form>
</div>






<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
    <script src="../bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>