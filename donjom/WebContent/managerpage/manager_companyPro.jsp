<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>

	ȸ�� ��  : ${company.company} <br />
	��ǥ�̻� : ${company.ceo} <br />
	����ڵ�Ϲ�ȣ : ${company.licensee} <br />
	�ּ� :	${company.address} <br />
	ȸ���ǥ��ȣ : ${company.companynum} <br />
	�ѽ� ��ȣ : ${company.fax} <br />
	�̸��� : 	${company.email} <br />
	<br/>
	���� �ݸ� : �ְ� ${company.max} (��ü�ݸ� �ְ�  ${company.overdue}) 
		������ ��, ������� �����Դϴ�.
		���� �� ������ �߰�����Ḧ �����ϴ� ���� �ҹ��Դϴ�.
		��޼������ ��Ÿ �δ��� �����ϴ�.
	<br /><br />
	2016 DonJom Inc.
	<br />
	
	<input type="reset" value="ȸ������" onclick="javascript:location.href='manager_companyinfo.dj'"> 


</body>
</html>