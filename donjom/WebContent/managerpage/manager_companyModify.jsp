<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="manager_companyModify.dj" method="post">
	ȸ�� ��  :<input type="text" name="company" value="${company.getCompany}"> <br />
	��ǥ�̻� : <input type="text" name="ceo" value="${company.ceo}"> <br />
	����ڵ�Ϲ�ȣ : <input type="text" name="licensee" value="${company.licensee}"> <br />
	�ּ� :<input type="text" name="address" value="${company.address}"> <br />
	ȸ���ǥ��ȣ : <input type="text" name="companynum" value="${company.companynum}"> <br />
	�ѽ� ��ȣ :<input type="text" name="fax" value=" ${company.fax}"> <br />
	�̸��� : <input type="text" name="email" value="${company.email}"> <br />
	<br/>
	���� �ݸ� : �ְ� <input type="text" name="max" value="${company.max}"> 
		(��ü�ݸ� �ְ�  <input type="text" name="overdue" value="${company.overdue}">) 
		������ ��, ������� �����Դϴ�.
		���� �� ������ �߰�����Ḧ �����ϴ� ���� �ҹ��Դϴ�.
		��޼������ ��Ÿ �δ��� �����ϴ�.
	<br /><br />
	2016 DonJom Inc.
	<br />
	<input type="submit" value="�����Ϸ�">
	</form>
	
	

</body>
</html>