<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<title>welcome to DonJom</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
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
								<h2>Mother of 금융권</h2>
								<p><h2>돈좀 빌려줘본 DONJOM</h2>
								<p>넘쳐나는 대출업계의 마덜오브금융권을 외치는 돈좀에게 <br> 돈좀 빌려달라고 해보세요~!!</p>
								<br>
								<p><input type="button" class="btn btn-default" value="투자안내보기"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('image/slider-5.jpg');">
					<div class=" col-sm-6 col-md-4 col-sm-offset-2">
						<h2>Mother of 금융권</h2>
						<p><h2>돈좀 빌려줘본 DONJOM</h2>
						<p>넘쳐나는 대출업계의 마덜오브금융권을 외치는 돈좀에게 <br> 돈좀 빌려달라고 해보세요~!!</p>
						<br>
						<p><input type="button" class="btn btn-default" value="투자안내보기"></p>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('image/slider-3.jpg');">
					<div class=" col-sm-6 col-md-4 col-sm-offset-2">
						<h2>Mother of 금융권</h2>
						<p><h2>돈좀 빌려줘본 DONJOM</h2>
						<p>넘쳐나는 대출업계의 마덜오브금융권을 외치는 돈좀에게 <br> 돈좀 빌려달라고 해보세요~!!</p>
						<br>
						<p><input type="button" class="btn btn-default" value="투자안내보기"></p>
					</div>
				</div>
				<div class="carousel-caption">
					<h2>Caption 3</h2>
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
<ul>
<li>평균이자율(연) : ${avg_interest}%</li>
<li>누적 대출액 : ${accumulate_loan}원</li>
<li>누적상환액 : 0원</li>
<li>부도율 : ${fail_avg}%</li>
</ul>
	<!-- Page Content -->
	<div class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">투자상품</h1>
			</div>
			<!-- card section part -->
			<c:forEach var="list" items="${list}">
				<div class="col-md-4">
					<div class="box box-success">
						<div class="box-header with-border">
							<a href="fundView.dj?p_code=${list.p_code}" type="button"
								class="btn btn-block btn-lg">${list.p_name}</a>
						</div>
						<a href="fundView.dj?p_code=${list.p_code}">
							<div class="box-body">
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
							<div class="progress-bar progress-bar-warning" role="progressbar" style="width:${list.p_invest/list.p_price*100}%"></div>
						</div>
						<div class="progress-detail">
							<ul class="list-inline">
								<li>${list.p_invest/list.p_price*100}%진행</li>
								<li>(${list.p_people}명)</li>
								<li><c:if test="${list.p_success == 'doing'}">
										<strong>펀딩진행중</strong>
									</c:if> 
									<c:if test="${list.p_success == 'success' || list.p_success == 'refunds' || list.p_success == 'overend'}">
										<strong>펀딩성공</strong>
									</c:if> 
									<c:if test="${list.p_success == 'fail'}">
										<strong>펀딩실패</strong>
									</c:if></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- Portfolio Section -->
	<div class="container-fluid backcolor ">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio" src="image/icon-main-2.jpg" alt="">
							<div class=" text-center">
							<h4><strong>중금리 직거래</strong></h4>
							<p>기존 금융기관의 지점 운영비, 인건비, 광고비 등의 비용을 온라인 중금리 직거래를 통해 획기적으로
								낮췄습니다. 이제 가장 합리적인 대출 이자와 투자 수익을 경험하세요.</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio" src="image/icon-main-1.jpg" alt="">
						<div class=" text-center">
							<h4><strong>기술기반 신용평가</strong></h4>
							<p>기존 금융기관의 신용평가 방식은 때론 합리적이지 못할 때가 있습니다. 기술과 금융이 결합된 돈좀의
								혁신적인 신용평가 시스템을 통해 나의 신용을 재평가 받으세요.</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio" src="image/icon-main-3.jpg" alt="">
						<div class=" text-center">
							<h4><strong>다양한 투자 포트폴리오</strong></h4>
							<p>한가지 카테고리만의 투자가 좀 불안 하시다고요? 돈좀에서는 개인 및 사업자 채권뿐만 아니라 부동산 담보,
								매출담보 등의 다양한 카테고리의 채권에 분산투자 가능하지요.</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio " src="image/icon-main-4.jpg" alt="">
						<div class=" text-center">
							<h4><strong>블록체인 기반 송금</strong></h4>
							<p>공인인증서, 엑티브엑스 등의 복잡한고, 어려운 보안툴은 좀!! 비트코인 송금시 사용되는 블록체인
								보안기술을 돈좀 투자시스템에 적용하진 못했지만, 실제 돈이 아니니 안전한 투자환경을 즐기세요!!</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- /.row -->

	<!-- Features Section -->
	<div class="container">
	<div class="row">
	<div class="col-lg-12">
	<h3 class="box-header text-center">돈좀 언론이야기</h3>
	</div>
	</div>
		<div class="row">
			<div class="col-lg-12">
				<h3 class="box-header text-center">돈좀 대표 고객사들 </h3>
				<hr>
			</div>
			
            <div id="myCarousel1" class="carousel slide">
                <!-- Carousel items -->
                
                <div class="carousel-inner">
                <br>
                    <div class="item active">
                        <div class="row">
                             <div class="col-xs-2">
                     			 <img src="image/ta-logo-1.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/ta-logo-2.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <div class="title-con text-center radius" style="width: 190px; height: 120px; border:1px solid; "> <br><p>5조<br> 어벤져스</p></div>
							 </div>
							 <div class="col-xs-2">
                     			 <div class="title-con text-center radius" style="width: 190px; height: 120px; border:1px solid; "> <br><p>4조<br> 화상채팅</p></div>
							 </div>
							 <div class="col-xs-2">
                     			 <div class="title-con text-center radius" style="width: 190px; height: 120px; border:1px solid; "> <br><p>1조<br> 마이웹</p></div>
							 </div>
							 <div class="col-xs-2">
                     			 <div class="title-con text-center radius" style="width: 190px; height: 120px; border:1px solid; "> <br><p>3조<br> 서울가유</p></div>
							 </div>
							 
                        </div>
                        <!--/row-->
                    </div>
                    <!--/item-->
                    <div class="item">
                        <div class="row">
                             <div class="col-xs-2">
                     			 <img src="image/ta-logo-1.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/ta-logo-2.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/ta-logo-3.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/ta-logo-4.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/ta-logo-5.gif" alt="Image" class="img-responsive">
							 </div>
							 <div class="col-xs-2">
                     			 <img src="image/ta-logo-4.gif" alt="Image" class="img-responsive">
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
                        <div class="row">
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
							 <div class="col-xs-2">
                     			 <div class="title-con text-center radius" > <p>2조 DONJOM</p></div>
							 </div>
                            
                        </div>
                        <!--/row-->
                    </div>



	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>




	<!-- Script to Activate the Carousel -->
	<script>
					$('.carousel').carousel({
						interval : 5000
					//changes the speed
					})
					</script>


</body>
</html>