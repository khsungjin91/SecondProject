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


ȯ���ϱ�		<br/>

����� ���� ������ ���·θ� �����մϴ�.		<br/>
 ȯ�� ������ : ����					<br/>
 ȯ�� �ּ� �ݾ� : 1 ��					<br/>
 ȯ�� �ִ� �ݾ� (1�� ����) : ������		<br/>
 ȯ�� �ð� : ��û �� �� 20�� �̳��� ������ü (��, ���� �۾��� �������� ������ �ݿ��ݾ��� ��ü�� �� �ֽ��ϴ�.)		<br/>
 ȯ�� ��û�� ������ �޴������� ���ŵ� ȯ�� ��û ���ǹ�ȣ�� Ȯ�� ��, �ش� ��ȣ�� 0000 �������� �亯�ϸ� ȯ���� �Ϸ�˴ϴ�.	<br/>

<c:if test="${dto.socialnum == null}">

-ȯ���� �����Ͻ÷��� ȸ�������� �ʿ��մϴ�.			<br/>
-��õ¡�� �������� �Է��ϼž� ���������� �Ϸ�˴ϴ�.		<br/>
(ȸ������ �Ŀ��� ȯ�� ������ �Ұ��ϴٸ�, �̸��� �Ǵ� ��ȭ�� ���� �ٶ��ϴ�.) <br/>

<input type="button" value="�����Ϸ�����" onclick="javascript:window.location='setting_cert_person.dj'">

</c:if>

<c:if test="${dto.socialnum != null}">

<form action="point_withdrowPro.dj" method="post">
ȯ�ް��ɾ� 0��													<br/>
1�� ȯ���ѵ� ���о� ������											<br/>
ȯ�޾� <input type="text" value="0" name="backmoney"/>��		<br/>
����� ${dto.bankcode}											<br/>
ȯ�ް��¹�ȣ ${dto.bankaccnum}									<br/>		
������ ${dto.name}												<br/>	

<input type="button" value="ȯ�޾˾ƺ���" onclick="">			
<input type="submit" value="ȯ���ϱ�">							
</form>
</c:if>


</body>
</html>