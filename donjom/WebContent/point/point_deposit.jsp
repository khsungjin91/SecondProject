<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2> ����ȯ�� </h2>

<ul>
	<li><a href="point_deposit.dj">����</a></li>
	<li><a href="point_withdrow.dj">ȯ��</a></li>
	<li><a href="point_history.dj">����/ȯ�޳���</a></li>
</ul>

�����ϱ�
������ġ��: ��													<br/>
������ü �� ���� �ݿ� �ð��� <b>�� 1~10��</b> ���� �Դϴ�. 					<br/>
������ ���� <b>��������</b>�� <b>��������</b> ����� �ʿ��մϴ�.				<br/>
��ġ���� ���� ���¿� ��ȭ�� <b>������ ��ŭ 1:1</b>�� �̷�����ϴ�.				<br/>
23:00 ~ 00:30�� ���̿��� <b>����� ���� �ð�</b>���� ��ü�� �Ұ��� �� �ֽ��ϴ�.	<br/>


<c:if test="${dto.socialnum == null}">

-������¸� �Ҵ�������� ȸ�������� �ʿ��մϴ�.	<br/>
-��õ¡�� �������� �Է��ϼž� ���������� �Ϸ�˴ϴ�.	<br/>
(ȸ������ �Ŀ��� ������� ������ �Ұ��ϴٸ�, �̸��� �Ǵ� ��ȭ�� ���� �ٶ��ϴ�.) <br/>

<input type="button" value="�����Ϸ�����" onclick="javascript:window.location='setting_cert_person.dj'">

</c:if>


<c:if test="${dto.socialnum != null}">
������������	<br/>
�����  ${dto.bankcode}		<br/>
������  ${dto.name}			<br/>
<%--���¹�ȣ  ${dto.randomacc}--%>	<br/>
�Ա��ڸ�  ${dto.name}		<br/>

<form action="point_charging.dj" method="post">
<input type="text" name="ch_price">
<input type="submit" value="�����ϱ�">
</form>

�� �� ������� ��ȣ�� ���ڱ��� ��ü�Ͻø� ������ ��ġ������ ���ڰ� �����մϴ�.
</c:if>

</body>
</html>