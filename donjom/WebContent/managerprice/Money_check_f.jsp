<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>
						환급 하기 
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">환급 하기</li>
					</ol>
				</div>
			</div>
		</div>
		<hr>
	</div>
<div class="container">
	
	<div>${dto.p_name}(${dto.p_code}) </div>
	<div>환급받을 인원수 (${dto.p_people} 명)</div>
	<div> 환급방법 : 
		<c:if test="${dto.p_way eq '0'}">
			원리금 균등상환
		</c:if>
	
		<c:if test="${dto.p_way eq '1'}">
			원금만기 일시상환
		</c:if>
	</div>

<div>투자자 정보</div>
<form action="refunds_money.dj" method="post">
<input type="hidden" name="p_code" value="${dto.p_code}">
<table style="float: left" class="table table-bordered table-responsive table-hover">
	<tr>
		<td>이메일</td>
		<td>성함</td>
		<td>투자 금액</td>
		<td>투자 시간</td>
		<td>가상계좌</td>
	</tr>
		<c:forEach var="list" items="${list}" varStatus="i">
	<tr>
		<td><input type="text" name="email${i.count-1}" value="${list.email}" disabled="disabled"></td>
		<td>${list.i_memname}</td>
		<td>${list.i_invest}만원</td>
		<td>${list.i_date}</td>
		<td>${list.randomacc}</td>
	</tr> 
		</c:forEach>
</table>

<table class="table table-bordered table-responsive table-hover">
		<tr>
			<td>환급금액</td>
		</tr>
	<c:forEach var="total" items="${total}" varStatus="i">
		<tr>
			<td><input type="text" name="total${i.count-1}" value="${total}" disabled="disabled" size="10">원 </td>
		</tr> 
	</c:forEach>
</table>

<input type="submit" value="환급하기">
</form>
</div>

</body>
</html>