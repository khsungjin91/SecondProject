<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />

<title>��������</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp" />
	<div class="container">
		<h3 class="box-header text-center">��������</h3>
		<div class="row">
			<div class="box box-success">
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
			<!-- 	<input type="button"
					onclick="javascript:location.href='noticeForm.dj'" value="�۾���"
					class="btn btn-default"> -->
			</div>
		</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/footer.jsp" />
</body>
</html>