<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>member page</title>
</head>
<body>
	<jsp:include page="/WEB-INF/admin-slider.jsp" />

	<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>
						회원 관리 <small>인증, 비인증 회원</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">회원 관리</li>
					</ol>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<div class="container">

		<!-- Small boxes (Stat box) -->
		<div class="row">
			<a href="manager_member.dj">
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-aqua">
						<ul class="list-inline text-center">
							<li>인증 회원 수</li>
							<li><h3>${c_count}</h3></li>
						</ul>
					</div>
				</div> <a href="manager_noconfirm.dj">
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-red">
							<ul class="list-inline text-center">
								<li>인증하지 않은 회원 수</li>
								<li><h3>${m_count}</h3></li>
							</ul>
						</div>
					</div>
			</a> <!-- ./col -->
		</div>
		<div class="row">
			<div class="box box-primary">
				<div class="box-body">
					<div class="col-sm-12">





						<form action="noconfirm_search.dj" method="post">
							<select name="noconfirm">
								<option value="nickname">닉네임</option>
								<option value="email">이메일</option>
							</select> <input type="text" align="right" name="search" /> <input
								type="submit" value="검색" align="right" />
						</form>
						<table class="table table-condensed">
							<tr>
								<td>닉네임</td>
								<td>이메일</td>
								<td>가입날짜</td>
							</tr>
							<c:if test="${setting == 1 }">
								<c:forEach var="list" items="${list}">
									<tr>
										<td>${list.nickname}</td>
										<td>${list.email}</td>
										<td>${list.join}</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="11" align="center">${pagingHtml}</td>
								</tr>
							</c:if>
							<c:if test="${setting == 2}">
								<c:forEach var="list" items="${list}">
									<tr>
										<td>${list.nickname}</td>
										<td>${list.email}</td>
										<td>${list.join}</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="11" align="center">${pagingHtml}</td>
								</tr>
							</c:if>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ./container -->

	<!-- ./content-wrapper -->
</body>
</html>




