<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>투자하기</title>
</head>
<body>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<div class="warpper">
	<div class="container">
		 <section class="content-header">
					 <a href="fundList_total.dj" type="button" class="btn btn-lg">전체</a>
					 <a href="fundList_total.dj" type="button" class="btn btn-lg">사업자</a>
					 <a href="fundList_total.dj" type="button" class="btn btn-lg">개인신용</a>
					 <a href="fundList_total.dj" type="button" class="btn btn-lg">부동산</a>
					 <a href="fundList_total.dj" type="button" class="btn btn-lg">담보대출</a>
		</section>
		
				<hr>
				<div class="content-header">
					<ul class="list-inline text-center">
					<li><h4>총 ${fundcount } 개의 상품이 있습니다.</h4></li>
					<li><div class="btn-group " >
						<button type="button" class="btn btn-default btn-flat" data-toggle="dropdown" aria-expended="false">
						전체<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li class="active"><a href="#">전체 <span class="badge bg-aqua">${fundcount }</span></a> </li>
							 <li ><a href="#">상환중 <span class="badge">0</span></a></li>
							<li><a href="#">상환완료<span class="badge bg-green">0</span></a></li>
							<li><a href="#">연체<span class="badge bg-yellow">0</span></a></li>
							<li><a href="#">부도<span class="badge bg-red">0</span></a></li>
							
						</ul>
						</div>
						</li>
						</ul>
					
					<br/>
				
				</div>
				<div class="content-body">
					<c:forEach var="list" items="${list}">
				<div class="col-md-4">
					<div class="box box-success">
						<div class="box-header with-border">
							<a href="fundView.dj?p_code=${list.p_code}" type="button" class="btn btn-block btn-lg">${list.p_name}</a>
						</div>
						<a href="fundView.dj?p_code=${list.p_code}" >
						<div class="box-body" >
							<strong>${list.p_name}</strong><br> ${list.p_purpose}
							<hr>
							<p class="money">
								목표 ${list.p_price}<span>만원</span> 연 ${list.p_rate}%<span>수익률</span>
							</p>
							<p class="rate">
								<span class="txt-point purpose"> ${list.p_category}</span> <span
									class="day">만기</span> <span class="txt-point">${list.p_term}개월</span>
								<span class="level">등급 <span class="txt-point">D1</span></span>
							</p>
						</div>
						</a>
						<div class="progress progress-sm">
							<div class="progress-bar progress-bar-warning" role="progressbar"
								style="width:${list.p_invest/list.p_price*100}%"></div>
						</div>
						<div class="progress-detail">
							<ul class="list-inline">
								<li>${list.p_invest/list.p_price*100}%진행</li>
								<li>(${list.p_people}명)</li>
								<li><c:if test="${list.p_success == 'doing'}">
										<strong>펀딩진행중</strong>
									</c:if> <c:if test="${list.p_success == 'success' || list.p_success == 'refunds'|| list.p_success == 'overend'}">
										<strong>펀딩성공</strong>
									</c:if> <c:if test="${list.p_success == 'fail'}">
										<strong>펀딩실패</strong>
									</c:if></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
	
				</div>
		</div>
</div>
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>

</body>
</html>