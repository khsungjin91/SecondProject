<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>manager page</title>
</head>
<body>


<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
    <div class="container">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          ���� ������ ������ 
          <small>DONJOM admin page </small>
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li><a href="#">DONJOM</a></li>
          <li class="active">ADMIN PAGE</li>
        </ol>
      </section>
</div>
<hr>
</div>
	<!-- Main content -->
	<div class="container">
		<div class="col-md-3 ">
			<a href="main.dj">
				<div class="info-box">
					<span class="info-box-icon bg-blue"> <img alt=""
						src="image/home-page.png">
					</span>
					<div class="info-box-content">
						<span class="info-box-text">DONJOM MAIN</span> <span
							class="info-box-number">���� ���������� </span>
					</div>
					<!-- /.info-box-content -->
				</div>
			</a>
			<!-- /.info-box -->
		</div>

		<div class="row">
			<a href="manager_borrowmn.dj">
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-aqua">
						<ul class="list-inline text-center">
							<li>�̽ɻ� ����</li>
							<li><h3>${borrow_count}</h3></li>
							<li>��</li>
						</ul>
					</div>
				</div> <a href="manager_evaluation.dj">
					<div class="col-lg-3 ">
						<!-- small box -->
						<div class="small-box bg-red">
							<ul class="list-inline text-center">
								<li>�ɻ�Ϸ���Ȳ</li>
								<li><h3>${eval_count}</h3></li>
								<li>��</li>
							</ul>
						</div>
					</div>
			</a> <a href="manager_borrowlist.dj">
					<div class="col-lg-3 ">
						<!-- small box -->
						<div class="small-box bg-green">
							<ul class="list-inline text-center">
								<li>�� ��ϻ�ǰ</li>
								<li><h3>${none_register}</h3></li>
								<li>��</li>
							</ul>
						</div>
					</div>
			</a> <a href="#">
					<div class="col-lg-3">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<ul class="list-inline text-center">
								<li>�� �����</li>
								<li><h3>
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${total_borrow}" />
									</h3></li>
								<li>����</li>
							</ul>
						</div>
					</div>
			</a> <!-- ./col -->
		</div>


		<div class="col-md-4 ">
			<div class="box box-solid  box-primary ">
				<div class="box-header">
					<h3 class="box-title">�۱ݾ˸�</h3>
					<div class="box-tools">
						<a class="btn btn-sm" href="manager_remittance.dj" type="button">������</a>
					</div>
				</div>
				<div class="box-body">
					<c:if test="${rm_count == 0 }">
						<div class="timeline-off-box">
							<span>�޼����� �����ϴ�.</span>
						</div>
					</c:if>
					<c:if test="${rm_count != 0 }">
						<c:forEach var="rm_list" items="${rm_list}">
							<div class="timeline-body">${rm_list.p_code}</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<!-- //�˸� �޼��� -->

			<div class="box box-solid  box-primary ">
				<div class="box-header">
					<h3 class="box-title">ȯ�޾˸�</h3>
					<div class="box-tools">
						<a class="btn btn-sm" href="manager_refunds.dj" type="button">������</a>
					</div>
				</div>
				<div class="box-body">
					<c:if test="${rf_count == 0 }">
						<div class="timeline-off-box">
							<span>ȯ���� ��ǰ�� �����ϴ�.</span>
						</div>
					</c:if>
					<c:if test="${rf_count != 0 }">
						<table class="table table-bordered table-responsive table-hover">
							<c:forEach var="rf_list" items="${rf_list}">
								<tr>
									<td class="timeline-body">${rf_list.p_code}</td>
									<td class="timeline-body">${rf_list.p_people}��</td>
									<td class="timeline-body">ȯ���� ${rf_list.p_repayday}��</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>
			</div>
			<!-- //�˸� �޼��� -->
		</div>
		<!-- ���� -->
		<div class="col-sm-6">
			<div class="box box-solid  box-primary ">
				<div class="box-header">
					<h3 class="box-title">��������</h3>
					<div class="box-tools">
						<a class="btn btn-sm" href="noticeForm.dj" type="button">�۾���</a>
					</div>
				</div>
				<div class="box-body">
					<table class="table text-center">
					<tr>
						<td>no</td>
						<td>����</td>
						<td>�ۼ���</td>
					</tr>
					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.n_num }</td>
							<td><a href="notice_view.dj?no=${list.n_num}">${list.n_subject }</td>
							<td>${list.n_reg }</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>