<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="manager_companyModifyPro.dj" method="post">
	ȸ�� ��  :<input type="text" name="company" value="${companyinfo.company}"> <br />
	��ǥ�̻� : <input type="text" name="ceo" value="${list.ceo}"> <br />
	����ڵ�Ϲ�ȣ : <input type="text" name="licensee" value="${list.licensee}"> <br />
	�ּ� :<input type="text" name="address" value="${list.address}"> <br />
	ȸ���ǥ��ȣ : <input type="text" name="companynum" value="${list.companynum}"> <br />
	�ѽ� ��ȣ :<input type="text" name="fax" value=" ${list.fax}"> <br />
	�̸��� : <input type="text" name="email" value="${list.email}"> <br />
	<br/>
	���� �ݸ� : �ְ� <input type="text" name="max" value="${list.max}"> 
		(��ü�ݸ� �ְ�  <input type="text" name="overdue" value="${list.overdue}">) 
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