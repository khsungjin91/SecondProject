<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>DJ관리자 환급관리</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
function Remittance(){
	$.ajax({
		type : "post",
		url : "/donjom/manager_refunded.dj",
		success : test,
		error : whenerror
	});
}

function test(a){
	$("#callback").html(a);
}

function whenerror(){
	alert("error");
}

</script>
</head>
<body onload="Remittance()">

<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>
						환급 관리 
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">환급 관리</li>
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
						<div>환급상품</div>
						<table style="float: left" class="table table-bordered table-responsive table-hover">
							<tr>
							<td>상품코드</td><td>상품제목</td><td>대출한금액</td><td>대출이자</td><td>상환회차</td><td>상환일</td><td>총투자인원</td><td>대출자이름</td><td>대출자정보</td><td>이자환급</td>
							</tr>
							<c:if test="${ing_count == 0 }">
							<tr><td colspan="10" align="center">상환 가능 한 상품이 없습니다.</td></tr>
							</c:if>
							<c:if test="${ing_count != 0 }">
							
							<c:forEach var="listrt" items="${listrt}" varStatus="z">
								<tr>
								<td>${listrt.p_code}</td>
								<td><a href="fundView.dj?p_code=${listrt.p_code}">${listrt.p_name}</a></td>
								<td>${listrt.p_price}만원</td>
								<td>${listrt.p_rate}%</td>
								<td>${listrt.p_funding}회/${listrt.p_term}회</td>
								<td>매월${listrt.p_repayday}일</td>
								<td>${listrt.p_people}명</td>
								<td>${listrt.name}</td>
								<td><a href="confirm_search.dj?confirm=i.no&search=${listrt.p_memeno}">상세정보</a></td>
								<td><input type="button" value="이자환급" onclick="javascript:window.location='Money_check_f.dj?p_code=${listrt.p_code}'"></td>
								</tr>
								</c:forEach>
							</c:if>
								</table>

					
			</div>
		</div>
	</div>
</div>
<div id="callback"></div>
</div>

</body>
</html>