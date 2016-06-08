<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
function Refunds(){
	$.ajax({
		type : "post",
		url : "/donjom//manager_remittanced.dj",
		success : test,
		error : whenerror
	});
}

function test(a){
	$("#callback").html(a);	
}

function whenerror(){
	alert("Error");
}

function paging(current){
	
	$.ajax({
		type : "post",
		url:"/donjom/manager_remittanced.dj",
		data: {
			pagecurrent : current
		},
		success: test,
		error: whenerror
		
	});
	
}

</script>
</head>
<body onload="Refunds()">

<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>
						송금 관리 
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">송금 관리</li>
					</ol>
				</div>
			</div>
		</div>
		<hr>
	</div>
	
	<div class="container">
<div class="row">
			<div class="box box-primary">
				<div class="box-body">
					<div class="col-sm-12">
						<div>송금상품</div>
						<table class="table table-bordered table-responsive table-hover">
							<tr>
								<td>상품코드</td>
								<td>상품제목</td>
								<td>투자된금액</td>
								<td>총투자인원</td>
								<td>대출자이름</td>
								<td>대출자정보</td>
								<td>성공여부</td>
								<td>송금</td>
							</tr>
								<c:forEach var="list" items="${list}">
									<tr>
										<td>${list.p_code}</td>
										<td><a href="fundView.dj?p_code=${list.p_code}">${list.p_name}</a></td>
										<td>${list.p_invest}만원/${list.p_price}만원</td>
										<td>${list.p_people}명</td>
										<td>${list.name}</td>
										<td><a href="confirm_search.dj?confirm=i.no&search=${list.p_memeno}">상세정보</a></td>
										<td>${list.p_success}</td>
										<td>
										<c:if test="${list.p_success eq 'success'}">
										<input type="button" value="송금미리보기" onclick="javascript:window.location='Money_check.dj?p_code=${list.p_code}'">
										</c:if>
										<c:if test="${list.p_success eq 'fail' || list.p_success eq 'doing'}">
										송금불가
										</c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
							<div align="center" style="margin-bottom: 50px">${pagingHtml}</div>
					<div id="callback"></div>

			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>