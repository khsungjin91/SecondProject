<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>

function fund_cancle(){
	
	if(confirm("�����û�� ��� �Ͻðڽ��ϱ�?")){
		
		window.location="fund_cancle.dj";		
	}else{
		
		self.close();	
	}	
}


</script>


${dto.name}���� �����û�� �Ϸ� �Ǿ����ϴ�.<br/>
�ɻ� ��� �� ����� �ݵ��� ���۵˴ϴ�. <br/>
<br/>
�ݸ�/�ѵ� ������ ���� ���� ������ �ʿ��մϴ�. <br/>
�Ʒ� �������� Fax�Ǵ� Email�� �����ֽø� ����ɻ簡 �Ϸ�˴ϴ�. <br/>
Fax: 02 - 8282 - 8282 / Email:psj9102@naver.com <br/>

<table border="1">
<tr>
<td>���ⱸ��</td><td>�غ񼭷�</td>
</tr>
<tr>
<td>���νſ�</td>
<td>
- �ź����纻 <br/>
- �ǰ����� �ڰݵ�� Ȯ�μ�, ���� Ȯ�μ� <br/>
   ��û��� : �ǰ����� ���� Ȩ������ Ȥ�� ��ȭ��û(1577-<br/>
   1000) <br/>
- �ְŷ����� �ֱ� 3���� ����  <br/>
- �ֹε�� ���ʺ� (�߱ޱ��� 1���� �̳� �߱޿�)  <br/>
</td>
</tr>
</table> 
<input type="button" value="���� ��û ���" onclick="return fund_cancle()">
<input type="button" value="�������� ����" onclick="javascript:window.location='main.dj'">

</body>
</html>