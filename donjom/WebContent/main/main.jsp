<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

<title>welcome to DonJom</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"/>
	<!-- Header Carousel -->
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill" style="background-image: url('image/slider-1.jpg');">
					<div class="col-sm-12">
						<div class="row">
							<div class=" col-sm-6 col-md-4 col-sm-offset-2">
								<h2>우리모두 모여서 </h2>
								<p><h2>빌려주는 따뜻한 금융</h2>
								<p>매주 수요일 오후 1시 새로운 투자가 시작됩니다.</p>
								<br>
								<p><a href="manager_investguide.dj" type="button" class="btn bg-green">투자안내보기</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('image/slider-5.jpg');">
					<div class=" col-sm-6 col-md-4 col-sm-offset-2">
						
						<h2>돈좀은 저금리 시대의 <p>새로운 투자대안을 제공합니다.</h2>
						<p>돈좀은 전문적인 자체 심사 시스템을 통해 대출 상품을 선별합니다. 그결과, 현재까지 연체율 및 부도율, 개인신용 대출 기중 편균이 엄청 낮은 수익율을 달성하고 있습니다.</p>
						<br>
						<p><input type="button" class="btn btn-default" value="투자안내보기"></p>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('image/slider-3.jpg');">
					<div class=" col-sm-6 col-md-4 col-sm-offset-2">
						<h2>새로운 P2P 대출의 히어로즈!!</h2>
						<p>넘쳐나는 대출업계의 수 많은 수익율 중에 우리 돈좀이 제일 낮고 좋습니다. 여러분의 월급을 지켜드리고 공룡같이 다가오는 대출의 압박에서 지켜드리겠습니다. </p>
						<br>
						<p><input type="button" class="btn btn-default" value="투자안내보기"></p>
					</div>
				</div>
				
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>
	<div class="container-fulid text-center bg-yellow">
		<ul class="title-conul list-inline">
			<li>
			<div class="title-main">평균이자율(연)</div> ${avg_interest}%</li>
			<li><div class="title-main">누적 대출액</div><fmt:formatNumber value="${accumulate_loan}" pattern="#,###" /> 원</li>
			<li><div class="title-main">누적상환액</div><fmt:formatNumber value="${refunds_price}" pattern="#,###" />원</li>
			<li><div class="title-main">부도율</div> ${fail_avg}%</li>
		</ul>
	</div>

	<!-- Page Content -->
	<div class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">투자상품</h1>
			</div>
			<!-- card section part -->
			<c:if test="${maincount == 0}">
			<h2 align="center">등록된 상품이 없습니다.</h2>
			</c:if>
			
			<c:if test="${maincount != 0 }">
			<c:forEach var="list" items="${list}">
				<div class="col-md-4">
					<div class="box box-solid box-primary ">
					<c:if test="${list.p_success == 'success' || list.p_success == 'refunds' || list.p_success == 'overend'}">
									<div class="title-fin text-center">
									펀딩성공 <br>(${list.p_enddate }) 
									<p style="padding-top:10px;"><a href="fundView.dj?p_code=${list.p_code}" type="button" class="btn btn-lg bg-aqua">자세히보기</a></p>
										</div>
									</c:if> 
						<div class="box-header with-border text-center">
						<c:if test="${list.p_category == 'b'}">사업자</c:if> 
						<c:if test="${list.p_category == 'c'}">매출담보</c:if> 
						<c:if test="${list.p_category == 'p'}">개인</c:if> 
						<c:if test="${list.p_category == 'r'}">부동산</c:if> 
							
						</div>
						
							<div class="box-body link-aa">
							 
							<a href="fundView.dj?p_code=${list.p_code}"></a>
								
								<div class="title-pr">
								${list.p_name}
								</div>
								<div class="title-pr-con"> <p>${list.p_purpose}</div>
							
								
								<span class="title-con text-green">
								목표 ${list.p_price} </span><span class="title"> 만원</span> 
								<span class="title-con text-green">연 ${list.p_rate}% </span><span class="title"> 수익률</span>
							
								<ul class="rate text-uppercase">
									<li><span class="text-green"> ${list.p_category}</span> 만기 </li>
									<li><span class="text-green">${list.p_term}</span> 개월</li>
									<li>등급 <span class="text-green"> D1</span></li>
								</ul>
						<div class=" progress progress-sm">
							<div class="progress-bar progress-bar-info" role="progressbar" style="width:${list.p_invest/list.p_price*100}%"></div>
						</div>
						<div class="progress-detail">
							<ul class="list-inline">
								<li><fmt:formatNumber value="${list.p_invest/list.p_price}" type="percent"/>진행</li>
								<li>(${list.p_people}명)</li>
								<li><c:if test="${list.p_success == 'doing'}">
										<b class="text-aqua">펀딩진행중</b>
									</c:if> 
									<c:if test="${list.p_success == 'success' || list.p_success == 'refunds' || list.p_success == 'overend'}">
									<span class="">${list.p_enddate }</span>
										<b class="text-green">펀딩성공</b>
									</c:if> 
									<c:if test="${list.p_success == 'fail'}">
										<b class="text-danger">펀딩실패</b>
									</c:if></li>
							</ul>
						</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>

		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- Portfolio Section -->
	<div class="container-fluid backcolor ">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="col-md-3 col-sm-6">
						<img class="img-responsive img-portfolio" src="image/icon-main-2.jpg" alt="">
							<div class=" text-center">
							<h4><strong>중금리 직거래</strong></h4>
							<p><small>기존 금융기관의 지점 운영비, 인건비, 광고비 등의 비용을 온라인 중금리 직거래를 통해 획기적으로
								낮췄습니다. 이제 가장 합리적인 대출 이자와 투자 수익을 경험하세요.</small></p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio" src="image/icon-main-1.jpg" alt="">
						<div class=" text-center">
							<h4><strong>기술기반 신용평가</strong></h4>
							<p><small>기존 금융기관의 신용평가 방식은 때론 합리적이지 못할 때가 있습니다. 기술과 금융이 결합된 돈좀의
								혁신적인 신용평가 시스템을 통해 나의 신용을 재평가 받으세요.</small></p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio" src="image/icon-main-3.jpg" alt="">
						<div class=" text-center">
							<h4><strong>다양한 투자 포트폴리오</strong></h4>
							<p><small>한가지 카테고리만의 투자가 좀 불안 하시다고요? 돈좀에서는 개인 및 사업자 채권뿐만 아니라 부동산 담보,
								매출담보 등의 다양한 카테고리의 채권에 분산투자 가능하지요.</small></p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio " src="image/icon-main-4.jpg" alt="">
						<div class=" text-center">
							<h4><strong>블록체인 기반 송금</strong></h4>
							<p><small>공인인증서, 엑티브엑스 등의 복잡한고, 어려운 보안툴은 좀!! 비트코인 송금시 사용되는 블록체인
								보안기술을 돈좀 투자시스템에 적용하진 못했지만, 실제 돈이 아니니 안전한 투자환경을 즐기세요!!</small></p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- /.row -->

	<!-- Features Section -->
	<div class="container">
	<!-- <div class="row">
	<div class="col-lg-12">
	<h3 class="box-header text-center">돈좀 언론이야기</h3>
	</div>
	</div> -->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="box-header text-center">돈좀 대표 고객사들 </h3>
				<hr>
			</div>
			
            <div id="myCarousel1" class="carousel slide justhi">
                <!-- Carousel items -->
                
                <div class="carousel-inner">
                
                <br>
                    <div class="item active">
                        <div class="row">
                             <div class="col-xs-3">
                     			 <img src="image/ta-logo-1.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-3">
                     			 <img src="image/ta-logo-2.gif" alt="Image" class="img-responsive">
							 </div>
							  <div class="col-xs-3">
                     			 <img src="image/ta-logo-3.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-3">
                     			 <img src="image/ta-logo-4.gif" alt="Image" class="img-responsive">
							 </div>
						</div>
                        <!--/row-->
                    </div>
                    <!--/item-->
                    <div class="item">
                        <div class="row">
                           
							 <div class="col-xs-3">
                     			 <img src="image/ta-logo-2.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-3">
                     			 <img src="image/ta-logo-3.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-3">
                     			 <img src="image/ta-logo-4.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-3">
                     			 <img src="image/ta-logo-5.gif" alt="Image" class="img-responsive">
							 </div>
							 
                            
                        </div>
                        <!--/row-->
                    </div>
                    <!--/item-->
                </div>
                <!--/carousel-inner--> 
                <a class="left carousel-control" href="#myCarousel1" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
 				<a class="right carousel-control" href="#myCarousel1" data-slide="next"><i class="fa fa-chevron-right"></i></a>
 

            </div>
            <!--/myCarousel-->
        </div>
        
      
		</div>
		<!-- /.row -->

	<hr>

	<!-- Call to Action Section -->
  <div class="container">
                        <div class="row justhi">
                             <div class="col-xs-2">
                     			 <img src="image/cooperate_escrow.png" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/cooperate_linewalks.png" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/cooperate_paygate.png" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/cooperate_ssl.png" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/top_logo.jpg" alt="Image" class="img-responsive">
							 </div>
							 
                            
                        </div>
                        <!--/row-->
                    </div>



	<jsp:include page="/WEB-INF/footer.jsp"/>




	<!-- Script to Activate the Carousel -->
	<script>
					$('.carousel').carousel({
						interval : 5000
					//changes the speed
					})
					</script>


</body>
</html>