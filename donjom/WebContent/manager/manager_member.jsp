<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>manager page</title>
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
			</div>
			<a href="manager_noconfirm.dj">
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-red">
						<ul class="list-inline text-center">
							<li>인증하지 않은 회원 수</li>
							<li><h3>${m_count}</h3></li>
						</ul>
					</div>
				</div>
			</a>

			<!-- ./col -->
		</div>
		<div class="row">
			<div class="box box-primary">
				<div class="box-body">
					<div class="col-sm-12">

					
						<form action="confirm_search.dj" method="post">
							<select name="confirm">
								<option value="name">회원이름</option>
								<option value="mobilenum">핸드폰번호</option>
								<option value="bankaccnum">계좌번호</option>
								<option value="virtualacc">가상계좌</option>
							</select> <input type="text" align="right" name="search" id="search" /> <input
								type="submit" value="검색" align="right" />
						</form>
						<table class="table table-bordered table-responsive table-hover">
							<tr>
								<td>회원이름</td>
								<td>생년월일</td>
								<td>성 별</td>
								<td>핸드폰번호</td>
								<td>주 소</td>
								<td>가상계좌</td>
								<td>거래은행</td>
								<td>계좌번호</td>
								<td>이메일</td>
								<td>가입날짜</td>
								<td>진행상황</td>

							</tr>
							<c:if test="${setting == 1}">
								<c:forEach var="plist" items="${plist}">
									<tr>
										<td>${plist.name}</td>
										<td>${plist.birth}</td>
										<td>${plist.gender}</td>
										<td>${plist.mobilenum}</td>
										<td>${plist.address}</td>
										<td>${plist.randomacc}</td>
										<td>${plist.bankcode}</td>
										<td>${plist.bankaccnum}</td>
										<td>${plist.email}</td>
										<td>${plist.join}</td>
										<td><input type="button"
											class="btn btn-xs bg-red" value="상세보기"
											onclick="javascript:window.open('manager_view.dj?email=${plist.email}','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=500,width=1000,height=400')" />
										</td>
									</tr>
								</c:forEach>
								<tr><td colspan="11" align="center">${pagingHtml}</td></tr>
							</c:if>

							<c:if test="${setting == 2 }">
								<c:forEach var="plist2" items="${plist}">
									<tr>
										<td>${plist2.name}</td>
										<td>${plist2.birth}</td>
										<td>${plist2.gender}</td>
										<td>${plist2.mobilenum}</td>
										<td>${plist2.address}</td>
										<td>${plist2.randomacc}</td>
										<td>${plist2.bankcode}</td>
										<td>${plist2.bankaccnum}</td>
										<td>${plist2.email}</td>
										<td>${plist2.join}</td>
										<td><input type="button"
											class="btn btn-xs bg-red" value="상세보기"
											onclick="javascript:location.href='manager_view.dj?email=${plist2.email}'" />
										</td>
								</c:forEach>
								<tr><td colspan="11" align="center">${pagingHtml}</td></tr>
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