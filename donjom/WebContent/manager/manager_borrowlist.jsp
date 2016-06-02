<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>평가 완료 리스트</title>
</head>
<body>
	<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>
						평가 완료 리스트 
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">평가완료리스트</li>
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
					<td>회원이메일</td>
					<td width="90">회원이름</td>
					<td>대출목적</td>
					<td width="110">대출등록일자</td>
					<td></td>
				</tr>

				<c:if test="${count == 0}">
					<tr>
						<td colspan="3">평가가 끝난 대출이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${count != 0}">
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.mememail}</td>
							<td>${list.memname}</td>
							<td>${list.br_object}</td>
							<td>${list.br_date}</td>
							<td ><a href="product_register.dj?no=${list.no}" class="btn btn-success">상품올리기</a></td>
						</tr>
					</c:forEach>
				</c:if>

			</table>
		</div>
	</div>
</body>
</html>