<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ���� �ȳ� </title>
</head>
<body>
<jsp:include page="/WEB-INF/header.jsp"/>
	<div class="container">
		<div class="box-header text-center">
		<h2> ���� �ȳ� </h2>
		���ݸ� �ô�! �������� ����� ���� ä�ǿ� �����ϼ���!
		</div>
		
		<hr>
		<div class="box-body">
		<div class="text-center">
		<h2>������ ������ ��������</h2>
		��ġ�� �Ա� > �����ϱ� > SMS���� > ���ڿϷ�
		<br><input type="button" value="�����ϱ�" class="btn btn-lg bg-green" onclick="javascript:location.href='fundList.dj'"><br/>
		</div>
		<hr>
		<br>
		���� ���ڻ�ǰ ��� 5~15%�� ������ ���ڼ��� <br/>
		 <img src="image\sub-loan_2.png"><br/>
		<br/>
		<br/>
		Q. ���� ���ڴ� �� ���ͷ��� ������?<br/>
		<br/>
		�����ڿ� ������ ���� ���ŷ��� ���� ���� ������� �޸� ��뱸���� ȹ�������� ����, ���� �� �߻��ϴ� ���� ������ �����ںв� �״�� �����帮�� �����Դϴ�.<br/>
		<br/>
		<br/>
		Q. ���� ä�� ���ڰ� ���������� �ʳ���?<br/>
		<br/>
		2016�� 1�� ���� ����ɻ� �������� 6.9% �Դϴ�. ������ �������� �ɻ縦 ���� ���赵�� ���� �������� ���ڻ�ǰ�� ���� �� �� �ֽ��ϴ�.<br/>
		<br/>
		<br/>
		Q. ��ġ�� �ý����� �����ΰ���?<br/>
		<br/>
		���� ���Ƿ� �߱޵� ������¿� ���� ����� �� �� �ִ� �ý����Դϴ�.<br/>
		���� �� �ش� ������¹�ȣ�� ���ڱ��� �Ա��ϸ� ��ġ���� �����ǰ�, �����ڷκ��� �������� ��ȯ �޴� ��쵵 �ش� �ݾ��� ��ġ������ �����˴ϴ�. ��ġ���� 24�ð� �ǽð����� ������� �����մϴ�.<br/>
		<br/>
		<hr>
		<br/>
			���� �� ȯ�� �� �ȳ�
			<table border="1">
				<tr>
					<td> step1 <br/>
					���������� (���� 1ȸ) <br/>
					ȸ�� ���� �� ���� > ȸ������ �̵� ��  <br/>
					�����ڿ�õ¡������ �Է�
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step2 <br/>
					������� �߱� �� ��ġ�� �Ա� <br/>
					����/ȯ�� > ���� �̵� �� ������� �߱� �� <br/>
					�ش� ���·� ��ġ�� �Ա�
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step3 <br/>
					���ڱ� �Է� �� �������� ȸ��<br/>
					<input type="button" value="�ڼ��� ����" onclick="javascript:location.href='manager_investmethod.dj'">
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step4 <br/>
					���ڿϷ� �� ��ȯ���� <br/>
					�ſ� �����ڰ� ��ȯ�ϴ� ���ݰ� ���ڸ�<br/>
					�����ϸ�, ����� ���ڰ� ����˴ϴ�.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step5 <br/>
					������ �� �ǰŷ� �������� ����ϱ�<br/>
					�ſ� ��ȯ�Ǵ� �������� ������ ������<br/>
					��ġ������ �ԱݵǾ� �ֽ��ϴ�. ����/ȯ�� > ȯ��<br/> 
					�̵� �� ���Ͻô� �ݾ��� 24�ð� ��� ��� �����մϴ�.
					<input type="button" value="�ڼ��� ����" onclick="javascript:location.href='manager_refundmethod.dj'">
					</td>					
				</tr> 
			</table>
			<hr>
			<h2> ������ �÷��� �̿� �����ᰡ �����ϴ�.</h2>
			<input type="button" value="�����ϱ�" onclick="javascript:location.href='fundList.dj'">
</div>
</div>
	<jsp:include page="/WEB-INF/footer.jsp"/>
</body>
</html>