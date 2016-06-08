<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<title>ȸ�� ���� ����</title>
</head>
<body>

<div class="col-sm-12 col-sm-6 ">
	<div class="row">
	<form action="manager_companyPro.dj" method="post" class="form-horizontal">
	
			<div class="form-group">
				<label class="col-sm-4 control-label">ȸ�� �� :</label>
				<div class="col-sm-10 col-sm-6">
					<input type="text" name="company" value="${list.company}" class="form-control">
				</div>
			</div>
			<div class="form-group">
					<label class="col-sm-4 control-label">��ǥ�̻� : </label>
				<div class="col-sm-10 col-sm-6">
					<input type="text" name="ceo" value="${list.ceo}" class="form-control"> 
				</div>
			</div>
	<div class="form-group">
					<label class="col-sm-4 control-label">����ڵ�Ϲ�ȣ :</label>
					<div class="col-sm-10 col-sm-6">
					 <input type="text" name="licensee"value="${list.licensee}" class="form-control">
		</div>
	</div>
	<div class="form-group">
					<label class="col-sm-4 control-label">�ּ� :	</label>
					<div class="col-sm-10 col-sm-6">
					<input type="text" name="address"value="${list.address}" class="form-control"> </div></div>
	<div class="form-group">
					<label class="col-sm-4 control-label">ȸ���ǥ��ȣ :</label> 
					<div class="col-sm-10 col-sm-6">
					<input type="text" name="companynum"value="${list.companynum}" class="form-control"></div></div>
	<div class="form-group">
					<label class="col-sm-4 control-label">�ѽ� ��ȣ : </label>
					<div class="col-sm-10 col-sm-6">
					<input type="text" name="fax"value="${list.fax}" class="form-control"> </div></div>
	<div class="form-group">
					<label class="col-sm-4 control-label">�̸��� : 	</label>
					<div class="col-sm-10 col-sm-6">
					<input type="text" name="email"value="${list.email}" class="form-control"> </div></div>
	<br/>
	<div class="form-group">
					<label class="col-sm-4 control-label">���� �ݸ� :</label>
					
					 �ְ� <input type="text" name="max"value="${list.max}"> <br/>
		(��ü�ݸ� �ְ�  <input type="text" name="overdue"value="${list.overdue}">) 
		������ ��, ������� �����Դϴ�. <p/>
		</div>
		<hr>
		<div class="text-center">
		���� �� ������ �߰�����Ḧ �����ϴ� ���� �ҹ��Դϴ�. <br/>
		��޼������ ��Ÿ �δ��� �����ϴ�.
		<br/>
		2016 DonJom Inc.
		</div>
	
	<hr>
	<div class="col-sm-12 col-sm-8 col-sm-offset-4">
	<input type="submit" value="����" class="btn btn-success btn-lg">
	<input type="button" name="modify" value="����"onclick="javascript:location.href='manager_companyModify.dj'"
	class="btn btn-default btn-lg">
	<input type="reset" value="���" onclick="javascript:location.href='manager_page.dj'" class="btn btn-default btn-lg"> 
		</div>
		
	</form>
	</div>
</div>

	</body>
</html>