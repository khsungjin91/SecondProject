<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>




</head>
<body>
 <jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container text-center">
		<div class="content-header"><h2>연습 투자</h2></div>
			<form action="fund_ready.dj" method="post" name="userinput">
				<div class="content-body">
					<input type="hidden" name="email" value="${email}">
						<table class="table">
							<tr>
								<td>상품코드</td>
								<td>대출목적</td>
								<td>남은시간</td>
							</tr>
							<tr>
								<td>16-D-0001</td>
								<td>연습 투자</td>
								<td>Time</td>
							</tr>
						</table>
		
			
		<div class="col-xs-12 col-sm-9">
			<div class="box box-success">
			
		<div class="box-header">
				<h4>연습투자</h4>
				
				</div>
				
				
			</div>
		</div>
	</div>
<!-- 그래프있는 오른쪽 메뉴 -->
			<div class="col-xs-12 col-sm-3 right hidden-xs ">
			<div class="box box-success">
				<ul class="list-unstyled ">
					<li>
					<div class="panel-body easypiechart-panel">
					<div class="easypiechart" id="easypiechart-blue" data-percent="<%-- ${dto.p_invest/dto.p_price*100} --%>92" >
					<span class="percent">92%</span>
						</div>
						</div><!-- 그래프 -->
					</li>
					<li>
					<h3 ><b class="text-green">만원/무제한</b></h3>
					</li>
					
					<li>
					<div>0명 투자완료</div>
					</li>
					
					<li><hr></li>
					
					<li><p class="title">상환방식</p>
					<div><p class="title-con">
						
							<td>원리금 균등상환</td>
						
							<td>원금만기 일시상환</td>
					</p>
						</div>
					</li>
					
					<li><p class="title">수익률</p>
					<p class="title-con">0%</p>
					</li>
					<li><p class="title">투자기간</p>
					<p class="title-con">0개월</p></li>
					
					
						<li><p class="title">투자금액</p></li>
						<li><div class="input-group">
						<input type="text" name="amount" id="amount" class="form-control">
						<div class="input-group-addon">만원</div>
						</div></li>
					
					
						<li><p class="title">펀딩기간 : 1주일</p><br/></li>
					
					
						<li><p class="title">최대투자 가능금액 :</p>
					</div>
			</div>
		</form>
		</div>

	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
		
	<script src="bt/js/easypiechart.js"></script>
	<script src="bt/js/easypiechart-data.js"></script>

	
</body>
</html>