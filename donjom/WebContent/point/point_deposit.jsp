<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${sessionScope.memId == null }">

		<script type="text/javascript">
alert("�α��� �� ��밡���մϴ�.");
window.location="signIn.dj";
</script>

	</c:if>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="warpper dash-body">
		<div class="container">
			<jsp:include page="/WEB-INF/settingside.jsp"/>
			<!-- ������ ����ȯ�� ���̾� -->
			<div class="col-sm-12 col-md-8 ">
				<div class="box box-solid panel-body">
					<div class="box-header">
					<ul class="breadcrumb">
					<li><h2 class="box-title">����ȯ��</h2></li>
						<li><a href="point_deposit.dj">����</a></li>
						<li><a href="point_withdrow.dj">ȯ��</a></li>
						<li><a href="point_history.dj">����/ȯ�޳���</a></li>
					</ul>
					</div>
					
					<div class="box-body">
					<h4 class="box-title">�����ϱ�</h4>
					 <h3 class="title-con text-aqua">������ġ��:  <fmt:formatNumber value="${total }" pattern="#,###" />�� </h3>
					 <ul class="list-unstyled text-lineheight">
					 <li><i class="fa fa-check text-olive"></i> ������ü �� ���� �ݿ� �ð��� <b>�� 1~10��</b> ���� �Դϴ�.</li>
					 <li><i class="fa fa-check text-olive"></i> ������ ���� <b>��������</b>�� <b>��������</b> ����� �ʿ��մϴ�. </li>
					 <li><i class="fa fa-check text-olive"></i> ��ġ���� ���� ���¿� ��ȭ�� <b>������ ��ŭ 1:1</b>�� �̷�����ϴ�.  </li>
					 <li><i class="fa fa-check text-olive"></i> 23:00 ~ 00:30�� ���̿��� <b>����� ���� �ð�</b>���� ��ü�� �Ұ��� �� �ֽ��ϴ�. </li>
					 </ul> 


					<c:if test="${dto.socialnum == null && dto.bankaccnum == null}">

-������¸� �Ҵ�������� ȸ�������� �ʿ��մϴ�.	<br />
-��õ¡�� �������� �Է��ϼž� ���������� �Ϸ�˴ϴ�.	<br />
(ȸ������ �Ŀ��� ������� ������ �Ұ��ϴٸ�, �̸��� �Ǵ� ��ȭ�� ���� �ٶ��ϴ�.) <br />

						<input type="button" value="�����Ϸ�����"
							onclick="javascript:window.location='setting_cert_person.dj'">

					</c:if>
<br>
<div class="well">
					<c:if test="${dto.socialnum != null && dto.bankaccnum != null}">
								<h3>������������</h3>
								<dl class="dl-horizontal ">
									<dt>�����</dt>
									<dd>${dto.bankcode}</dd>
									<dt>������</dt>
									<dd>${dto.name}</dd>
									<dt>���¹�ȣ</dt>
									<dd>${dto.randomacc}</dd>
									<dt>�Ա��ڸ�</dt>
									<dd>${dto.name}	</dd>
									</dl>

						<form action="point_charging.dj" method="post">
						<div class="col-sm-6">
							<input type="text" name="ch_price" class="form-control"> 
							</div>
							<input type="submit" value="�����ϱ�" class="btn btn-md bg-green">
						</form>
<hr>
�� �� ������� ��ȣ�� ���ڱ��� ��ü�Ͻø� ������ ��ġ������ ���ڰ� �����մϴ�.
</c:if></div>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>