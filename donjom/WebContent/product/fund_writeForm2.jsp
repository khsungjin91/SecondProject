<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>�����û �߰�����</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container">
		<div class="col-lg-12 col-md-8 col-sm-offset-2">
			<div class="col-xs-8">
	<h2>��������</h2>
	<hr>
	
	<div id="fund-form" class="box box-success">
	<div class="box-header"></div>
		<form action="loan_writePro.dj" method="post" class="form-horizontal">

			<input type="hidden" value="${br_sum}" name="br_sum"> <input
				type="hidden" value="${br_way}" name="br_way"> <input
				type="hidden" value="${br_term}" name="br_term">

			<div class="form-group">
				<label class="col-sm-4 control-label">���� ����</label>
				<div class="col-sm-6">
					<select class="form-control" name="br_category">
						<option value="p">����</option>
						<option value="b">�����</option>
						<option value="r">�ε���</option>
						<option value="c">����㺸</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">���� ����</label>
				<div class="col-sm-6">
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
				<label class="col-sm-4 control-label">����</label>
				<div class="col-sm-6">
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
				<label class="col-sm-4 control-label">��� ����</label>
				<div class="col-sm-6">
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
				<label class="col-sm-4 control-label">���ҵ�(����)</label>
				<div class="col-sm-6">
				<div class="input-group">
					<input type="text" name="br_ycomein" class="form-control">
<div class="input-group-addon">����</div>
</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">�� ��� �ҵ�</label>
				<div class="col-sm-6">
				<div class="input-group">
					<input type="text" name="br_mavg" class="form-control">
<div class="input-group-addon">����</div>
</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">�� ��ä ��ȯ��</label>
				<div class="col-sm-6">
				<div class="input-group">
					<input type="text" name="br_mrepay" class="form-control">
<div class="input-group-addon">����</div>
</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">�� ���� ������</label>
				<div class="col-sm-6">
				<div class="input-group">
					<input type="text" name="br_mlockpay" class="form-control">
<div class="input-group-addon">����</div>
</div>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-4 control-label">�������</label>
				<div class="col-sm-6">
					<textarea name="br_object" class="form-control" cols="50" rows="10"></textarea>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-4 control-label">��� ��ȯ�Ⱓ</label>
				<div class="col-sm-4">
					<select name="br_hopeday" class="form-control">
						<option value="1">�ſ� 1�� ��ȯ</option>
						<option value="5">�ſ� 5�� ��ȯ</option>
						<option value="10">�ſ� 10�� ��ȯ</option>
						<option value="15">�ſ� 15�� ��ȯ</option>
						<option value="20">�ſ� 20�� ��ȯ</option>
						<option value="25">�ſ� 25�� ��ȯ</option>
					</select>
					</div>
					<div class="col-sm-2">
					<input type="button" value="���ڰ���" class="btn btn-sm bg-green" data-target="#loan-cal"  data-toggle="modal" >
				</div>
			</div>

			<hr>
			<div class="text-center">
			����Ͻø� <a href="#">���Űŷ��μӾ��</a>�� �����ϰ� �˴ϴ�. 
			<input type="hidden" value="${memname}" name="memname"> 
				<input type="hidden" value="${membirth}" name="membirth"> 
				<input type="hidden" value="${mememail}" name="mememail"> 
				<input type="hidden" value="${memphone}" name="memphone"> 
			<div class="box-header">
				<input type="submit" value="�����û" class="btn btn-lg bg-orange" name="loan-btn">
				</div>
			</div>
		</form>
	</div>
	
			</div>
		</div>
	</div>





	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>