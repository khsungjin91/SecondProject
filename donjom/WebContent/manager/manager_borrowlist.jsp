<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>�� �Ϸ� ����Ʈ</title>
</head>
<body>
	<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>
						�� �Ϸ� ����Ʈ 
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">�򰡿ϷḮ��Ʈ</li>
					</ol>
				</div>
			</div>
			</div>
			<hr>
			</div>
	<div class="container">
		<div class="box box-success">
			<table class="table table-bordered">
				<tr>
					<td>ȸ���̸���</td>
					<td width="90">ȸ���̸�</td>
					<td>�������</td>
					<td width="110">����������</td>
					<td></td>
				</tr>

				<c:if test="${count == 0}">
					<tr>
						<td colspan="3">�򰡰� ���� ������ �����ϴ�.</td>
					</tr>
				</c:if>
				<c:if test="${count != 0}">
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.mememail}</td>
							<td>${list.memname}</td>
							<td>${list.br_object}</td>
							<td>${list.br_date}</td>
							<td ><a href="product_register.dj?no=${list.no}" class="btn btn-success">��ǰ�ø���</a></td>
						</tr>
					</c:forEach>
				</c:if>

			</table>
		</div>
	</div>
</body>
</html>