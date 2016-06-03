<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>�����û</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<c:if test="${sessionScope.memId == null }">
		<script type="text/javascript">
			window.location = "signIn.dj";
		</script>
	</c:if>

	<div class="container">
		<div class="col-xs-12">
			<div class="col-xs-12 col-sm-8 col-sm-offset-2 ">
				<h2 class="text-center">������</h2>
				<hr>
			</div>
			<div class="col-xs-12 col-sm-8 col-sm-offset-2 ">
				<div class="col-xs-12 lend-box">
					<ul class="col-xs-12 lend-box list-inline text-center">
						<li><i class="fa fa-pencil-square-o fa-3x"></i>
							<div>�� ����</div></li>
						<li><i class="fa fa-angle-right fa-2x"></i></li>
						<li><i class="fa fa-folder-open-o fa-3x"></i>
							<div>���� ��û ����</div></li>
						<li><i class="fa fa-angle-right fa-2x"></i></li>
						<li><i class="fa fa-file-text-o fa-3x"></i>
							<div>���� ����</div></li>
						<li><i class="fa fa-angle-right fa-2x"></i></li>
						<li><i class="fa  fa-desktop fa-3x"></i>
							<div>�ݵ� ����</div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="col-sm-8 col-md-offset-2">
			<div class=" box box-primary">
				<div class="box-header"></div>

				<form action="loan_step2.dj" method="post" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">�̸�</label>
						<div class="col-sm-8">
							<input type="text" name="memname" value="${sedto.name}"
								class="form-control" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">�������</label>
						<div class="col-sm-8">
							<input type="text" name="membirth" value="${sedto.birth}"
								class="form-control " >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">����</label>
						<div class="col-sm-8">
							<input type="text" name="sex" value="${sedto.gender}"
								class="form-control " >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">�̸��� �ּ�</label>
						<div class="col-sm-8">
							<input type="text" name="mememail" value="${email}"
								class="form-control" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">�޴��� ��ȣ</label>
						<div class="col-sm-8">
							<input type="text" name="memphone" value="${sedto.mobilenum}"
								class="form-control" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">��� �����</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="br_sum" class="form-control">
								<div class="input-group-addon">����</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">��ȯ ���</label>
						<div class="col-sm-8">
							<select name="br_way" class="form-control">
								<option value="0">������ �յ��ȯ</option>
								<option value="1">���ݸ��� �Ͻû�ȯ</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">��� ����Ⱓ</label>
						<div class="col-sm-8">
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
						</div>
					</div>
					<hr>
					<div class="text-center">
					����Ͻø� <a href="#">���Űŷ��μӾ��</a>�� �����ϰ� �˴ϴ�. 
					<hr>
					<p class="box-body"><input type="submit" value="�����û" class="btn btn-primary btn-lg" name="loan-btn"></p>
					</div>
				</form>

			</div>
		</div>
	</div>





	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>