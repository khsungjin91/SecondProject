<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>

<div class="col-sm-12">
	
	<form action="manager_companyPro.dj" method="post" class="form-horizontal">
	<div class="form-group">
	<label class="col-sm-2 control-label">ȸ�� ��  :</label> 
	<input type="text" name="company" value="${company.getCompany}"> 
	</div>
	��ǥ�̻� : <input type="text" name="ceo" value="${company.ceo}"> <br />
	����ڵ�Ϲ�ȣ : <input type="text" name="licensee"value="${company.licensee}"> <br />
	�ּ� :	<input type="text" name="address"value="${company.address}"> <br />
	ȸ���ǥ��ȣ : <input type="text" name="companynum"value="${company.companynum}"> <br />
	�ѽ� ��ȣ : <input type="text" name="fax"value="${company.fax}"> <br />
	�̸��� : 	<input type="text" name="email"value="${company.email}"> <br />
	<br/>
	���� �ݸ� : �ְ� <input type="text" name="max"value="${company.max}"> 
		(��ü�ݸ� �ְ�  <input type="text" name="overdue"value="${company.overdue}">) 
		������ ��, ������� �����Դϴ�. <br/>
		���� �� ������ �߰�����Ḧ �����ϴ� ���� �ҹ��Դϴ�. <br/>
		��޼������ ��Ÿ �δ��� �����ϴ�.
	<br /><br />
	2016 DonJom Inc.
	<br />
	<input type="submit" value="����">
	<input type="button" name="modify" value="����"onclick="javascript:location.href='manager_companyModify.dj'">
	<input type="reset" value="���" onclick="javascript:location.href='manager_page.dj'"> 

	</form>
</div>
	</body>
</html>