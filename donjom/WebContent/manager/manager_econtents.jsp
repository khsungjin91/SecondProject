<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>대출심사</title>

</head>
<body>
	<jsp:include page="/WEB-INF/admin-slider.jsp" />

	<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>대출심사</h1>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<div class="container">
		<div class="row">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">대출 심사</h3>
					<div class="box-tools">
						<form action="manager_evaluation_search.dj" method="post"
							class="form-inline">
							<select name="evaluation" class="form-control">
								<option value="e_memid">아이디</option>
								<option value="e_memname">이름</option>
								<option value="e_result">심사 결과</option>
							</select> <input type="text" align="right" name="search"
								class="form-control" /> <input type="submit" value="검색"
								align="right" class="btn btn-info btn-flat" />
						</form>
					</div>

				</div>
			
					<table class="table table-bordered">
						<tr>
							<td>아이디</td>
							<td width="80">이름</td>
							<td>서류</td>
							<td>사업체 유무</td>
							<td>사업체 등기부등록</td>
							<td width="50">서류 개수</td>
							<td width="600">심사 내용</td>
							<td>심사 결과</td>
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