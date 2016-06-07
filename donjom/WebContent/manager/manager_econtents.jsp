<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>����ɻ�</title>

</head>
<body>
	<jsp:include page="/WEB-INF/admin-slider.jsp" />

	<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>����ɻ�</h1>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<div class="container">
		<div class="row">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">���� �ɻ�</h3>
					<div class="box-tools">
						<form action="manager_evaluation_search.dj" method="post"
							class="form-inline">
							<select name="evaluation" class="form-control">
								<option value="e_memid">���̵�</option>
								<option value="e_memname">�̸�</option>
								<option value="e_result">�ɻ� ���</option>
							</select> <input type="text" align="right" name="search"
								class="form-control" /> <input type="submit" value="�˻�"
								align="right" class="btn btn-info btn-flat" />
						</form>
					</div>

				</div>
			
					<table class="table table-bordered">
						<tr>
							<td>���̵�</td>
							<td width="80">�̸�</td>
							<td>����</td>
							<td>���ü ����</td>
							<td>���ü ���ε��</td>
							<td width="50">���� ����</td>
							<td width="600">�ɻ� ����</td>
							<td>�ɻ� ���</td>
						</tr>
					
								<tr>
									<td>${dto.e_memid}</td>
									<td>${dto.e_memname}</td>
									<td>${dto.e_document}</td>
									<td>${dto.e_cphave}</td>
									<td>${dto.e_cpfile}</td>
									<td>${dto.e_doccount}</td>
									<td>${dto.e_content}">
									<td><label class="badge bg-olive"> <i
											class="fa fa-check fa-lg "></i><br>${dto.e_result}</label></td>
								</tr>
							
					


			</div>
		</div>
	</div>
</body>
</html>