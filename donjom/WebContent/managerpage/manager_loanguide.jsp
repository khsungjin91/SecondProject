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
<div class="box-header">
		<h2>���� �ȳ� </h2>
		</div>
		<div class="box box-primary">
		<div class="box-body">
		
		������ ���� �ո����� �߱ݸ� ������ ������ �� �ֽ��ϴ�!.<br/>
		<hr>
		<br>
		<h2>1�и��� ��û�ϴ� ������  ��������</h2>
		<br>
		�����û > �߰����� > �������� > �ݵ�����<br/>
		<input type="button" value="�����û" onclick="javascript:location.href='loan_step1.dj'"><br/>
		<hr>
		<br>
		����5% �ո����� ��������<br/>
		 <img src="/image/sub-loan_1.jpg"><br/>
		<br/>
		Q. �ո����� �������� ��� ���� �����Ѱ���?<br/>
		<br/>	
		�����ڿ� ������ ���� ���ŷ��� ���� ���� ������� �޸� ��뱸���� ȹ�������� ����, �������� = ���ڼ����� �Ǵ� ������ �ŷ������� ������� �����Դϴ�.<br/>
		<br/>
		<br/>
		Q. ���� ������ ����ɻ� ��İ� ������ �ٸ�����?<br/>
		<br/>
		�ſ��� �ܿ��� �������� ��ȯ�ɷ�, ���� �м�, ���� �м�, �� ��ä�� �м�, ����� ��, ��� �м�, �Ҽ� ������ �м� ���� �������� �ɻ縦 ���� �����ڿ��� ���ο� �ſ��� �ο��մϴ�.<br/>
		<br/>
		<br/>
		Q. ���� ��û�ڰ��� ��� �ǳ���?<br/>
		<br/>
		1. ���̽� �ſ��� ���� 7��� �̳�<br/>
		<br/>
		2. �ֱ� 1�Ⱓ ��ü, ä�������� �̷��� ������ �����մϴ�.<br/>
		���νſ� : �����Ⱓ �ּ� 3���� �̻� <br/>
		����� : �ּ� 1�Ⱓ�� ���� �� ���� �߻� �̷�<br/> 
		�ε��� : �ü� ��ȸ ���� �㺸 <br/>
		<hr>
		<br/>
		<h2> ������ �ټ��� �����ڷ� ���� ��ݵ� ���ڱ����� ������ �߻��Ǵ� ��������Դϴ�. </h2><br/>
		<img src="/image/sub-loan_2.png"><br/>
		<hr>
		<br/>
			�������� �� �ȳ�
			<table border="1">
				<tr>
					<td> step1 <br/>
					ȸ������ �� �����û <br/>
					���� ȸ������ �� �����û ȭ�鿡�� <br/>
					���������� �ۼ��մϴ�.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step2 <br/>
					�������� <br/>
					���� ��û �� SMS �ȳ��� ���� ���� ������  <br/>
					�����Ͻø� ��û�� �Ϸ�˴ϴ�.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step3 <br/>
					����ɻ�<br/>
					�ɻ� ����ڰ� ��ȭ ������ ���� ��� Ȯ��<br/>
					�� �ɻ����� �뺸�մϴ�.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step4 <br/>
					���ڱ� ���� (1��~7��)<br/>
					����� �ݵ��� ���۵Ǹ�, �ּ� 1�п��� �ִ�<br/>
					7���� �ҿ�˴ϴ�.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step5 <br/>
					���� ���� �� ��ȯ ����<br/>
					��༭ �ۼ� �� ������� �������� ��������<br/>
					��ü�Ǹ�, ������ �Ⱓ���� �ſ� ��ȯ��<br/> 
					�Ͻð� �˴ϴ�.
					</td>					
				</tr> 
			</table>
			<hr>
			<h2> ������ �ߵ���ȯ �����ᰡ �����ϴ�.</h2>
			<input type="button" value="�����û" onclick="javascript:location.href='loan_step1.dj'"><br/>
			<jsp:include page="/WEB-INF/footer.jsp"/>
			</div></div></div>
	</body>
</html>