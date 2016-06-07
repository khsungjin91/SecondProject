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
								<h2>Mother of ������</h2>
								<p><h2>���� �����ົ DONJOM</h2>
								<p>���ĳ��� ��������� ��������������� ��ġ�� �������� <br> ���� �����޶�� �غ�����~!!</p>
								<br>
								<p><input type="button" class="btn btn-default" value="���ھȳ�����"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('image/slider-5.jpg');">
					<div class=" col-sm-6 col-md-4 col-sm-offset-2">
						<h2>Mother of ������</h2>
						<p><h2>���� �����ົ DONJOM</h2>
						<p>���ĳ��� ��������� ��������������� ��ġ�� �������� <br> ���� �����޶�� �غ�����~!!</p>
						<br>
						<p><input type="button" class="btn btn-default" value="���ھȳ�����"></p>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('image/slider-3.jpg');">
					<div class=" col-sm-6 col-md-4 col-sm-offset-2">
						<h2>Mother of ������</h2>
						<p><h2>���� �����ົ DONJOM</h2>
						<p>���ĳ��� ��������� ��������������� ��ġ�� �������� <br> ���� �����޶�� �غ�����~!!</p>
						<br>
						<p><input type="button" class="btn btn-default" value="���ھȳ�����"></p>
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
<li>���������(��) : ${avg_interest}%</li>
<li>���� ����� : ${accumulate_loan}��</li>
<li>������ȯ�� : 0��</li>
<li>�ε��� : ${fail_avg}%</li>
</ul>
	<!-- Page Content -->
	<div class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">���ڻ�ǰ</h1>
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
								��ǥ ${list.p_price}<span>����</span> �� ${list.p_rate}%<span>���ͷ�</span>
								</p>
								<p class="rate">
									<span class="txt-point purpose"> ${list.p_category}</span> <span
										class="day">����</span> <span class="txt-point">${list.p_term}����</span>
									<span class="level">��� <span class="txt-point">D1</span></span>
								</p>
							</div>
						</a>
						<div class="progress progress-sm">
							<div class="progress-bar progress-bar-warning" role="progressbar" style="width:${list.p_invest/list.p_price*100}%"></div>
						</div>
						<div class="progress-detail">
							<ul class="list-inline">
								<li>${list.p_invest/list.p_price*100}%����</li>
								<li>(${list.p_people}��)</li>
								<li><c:if test="${list.p_success == 'doing'}">
										<strong>�ݵ�������</strong>
									</c:if> 
									<c:if test="${list.p_success == 'success' || list.p_success == 'refunds' || list.p_success == 'overend'}">
										<strong>�ݵ�����</strong>
									</c:if> 
									<c:if test="${list.p_success == 'fail'}">
										<strong>�ݵ�����</strong>
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
							<h4><strong>�߱ݸ� ���ŷ�</strong></h4>
							<p>���� ��������� ���� ���, �ΰǺ�, ����� ���� ����� �¶��� �߱ݸ� ���ŷ��� ���� ȹ��������
								������ϴ�. ���� ���� �ո����� ���� ���ڿ� ���� ������ �����ϼ���.</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio" src="image/icon-main-1.jpg" alt="">
						<div class=" text-center">
							<h4><strong>������ �ſ���</strong></h4>
							<p>���� ��������� �ſ��� ����� ���� �ո������� ���� ���� �ֽ��ϴ�. ����� ������ ���յ� ������
								�������� �ſ��� �ý����� ���� ���� �ſ��� ���� ��������.</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio" src="image/icon-main-3.jpg" alt="">
						<div class=" text-center">
							<h4><strong>�پ��� ���� ��Ʈ������</strong></h4>
							<p>�Ѱ��� ī�װ����� ���ڰ� �� �Ҿ� �Ͻôٰ��? ���������� ���� �� ����� ä�ǻӸ� �ƴ϶� �ε��� �㺸,
								����㺸 ���� �پ��� ī�װ��� ä�ǿ� �л����� ����������.</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio " src="image/icon-main-4.jpg" alt="">
						<div class=" text-center">
							<h4><strong>���ü�� ��� �۱�</strong></h4>
							<p>����������, ��Ƽ�꿢�� ���� �����Ѱ�, ����� �������� ��!! ��Ʈ���� �۱ݽ� ���Ǵ� ���ü��
								���ȱ���� ���� ���ڽý��ۿ� �������� ��������, ���� ���� �ƴϴ� ������ ����ȯ���� ��⼼��!!</p>
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
	<h3 class="box-header text-center">���� ����̾߱�</h3>
	</div>
	</div>
		<div class="row">
			<div class="col-lg-12">
				<h3 class="box-header text-center">���� ��ǥ ����� </h3>
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
                     			 <div class="title-con text-center radius" style="width: 190px; height: 120px; border:1px solid; "> <br><p>5��<br> �����</p></div>
							 </div>
							 <div class="col-xs-2">
                     			 <div class="title-con text-center radius" style="width: 190px; height: 120px; border:1px solid; "> <br><p>4��<br> ȭ��ä��</p></div>
							 </div>
							 <div class="col-xs-2">
                     			 <div class="title-con text-center radius" style="width: 190px; height: 120px; border:1px solid; "> <br><p>1��<br> ������</p></div>
							 </div>
							 <div class="col-xs-2">
                     			 <div class="title-con text-center radius" style="width: 190px; height: 120px; border:1px solid; "> <br><p>3��<br> ���ﰡ��</p></div>
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
                     			 <div class="title-con text-center radius" > <p>2�� DONJOM</p></div>
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