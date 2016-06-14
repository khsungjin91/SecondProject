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
								<h2>�츮��� �𿩼� </h2>
								<p><h2>�����ִ� ������ ����</h2>
								<p>���� ������ ���� 1�� ���ο� ���ڰ� ���۵˴ϴ�.</p>
								<br>
								<p><a href="manager_investguide.dj" type="button" class="btn bg-green">���ھȳ�����</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('image/slider-5.jpg');">
					<div class=" col-sm-6 col-md-4 col-sm-offset-2">
						
						<h2>������ ���ݸ� �ô��� <p>���ο� ���ڴ���� �����մϴ�.</h2>
						<p>������ �������� ��ü �ɻ� �ý����� ���� ���� ��ǰ�� �����մϴ�. �װ��, ������� ��ü�� �� �ε���, ���νſ� ���� ���� ����� ��û ���� �������� �޼��ϰ� �ֽ��ϴ�.</p>
						<br>
						<p><input type="button" class="btn btn-default" value="���ھȳ�����"></p>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('image/slider-3.jpg');">
					<div class=" col-sm-6 col-md-4 col-sm-offset-2">
						<h2>���ο� P2P ������ �������!!</h2>
						<p>���ĳ��� ��������� �� ���� ������ �߿� �츮 ������ ���� ���� �����ϴ�. �������� ������ ���ѵ帮�� ���氰�� �ٰ����� ������ �йڿ��� ���ѵ帮�ڽ��ϴ�. </p>
						<br>
						<p><input type="button" class="btn btn-default" value="���ھȳ�����"></p>
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
			<div class="title-main">���������(��)</div> ${avg_interest}%</li>
			<li><div class="title-main">���� �����</div><fmt:formatNumber value="${accumulate_loan}" pattern="#,###" /> ��</li>
			<li><div class="title-main">������ȯ��</div><fmt:formatNumber value="${refunds_price}" pattern="#,###" />��</li>
			<li><div class="title-main">�ε���</div> ${fail_avg}%</li>
		</ul>
	</div>

	<!-- Page Content -->
	<div class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">���ڻ�ǰ</h1>
			</div>
			<!-- card section part -->
			<c:if test="${maincount == 0}">
			<h2 align="center">��ϵ� ��ǰ�� �����ϴ�.</h2>
			</c:if>
			
			<c:if test="${maincount != 0 }">
			<c:forEach var="list" items="${list}">
				<div class="col-md-4">
					<div class="box box-solid box-primary ">
					<c:if test="${list.p_success == 'success' || list.p_success == 'refunds' || list.p_success == 'overend'}">
									<div class="title-fin text-center">
									�ݵ����� <br>(${list.p_enddate }) 
									<p style="padding-top:10px;"><a href="fundView.dj?p_code=${list.p_code}" type="button" class="btn btn-lg bg-aqua">�ڼ�������</a></p>
										</div>
									</c:if> 
						<div class="box-header with-border text-center">
						<c:if test="${list.p_category == 'b'}">�����</c:if> 
						<c:if test="${list.p_category == 'c'}">����㺸</c:if> 
						<c:if test="${list.p_category == 'p'}">����</c:if> 
						<c:if test="${list.p_category == 'r'}">�ε���</c:if> 
							
						</div>
						
							<div class="box-body link-aa">
							 
							<a href="fundView.dj?p_code=${list.p_code}"></a>
								
								<div class="title-pr">
								${list.p_name}
								</div>
								<div class="title-pr-con"> <p>${list.p_purpose}</div>
							
								
								<span class="title-con text-green">
								��ǥ ${list.p_price} </span><span class="title"> ����</span> 
								<span class="title-con text-green">�� ${list.p_rate}% </span><span class="title"> ���ͷ�</span>
							
								<ul class="rate text-uppercase">
									<li><span class="text-green"> ${list.p_category}</span> ���� </li>
									<li><span class="text-green">${list.p_term}</span> ����</li>
									<li>��� <span class="text-green"> D1</span></li>
								</ul>
						<div class=" progress progress-sm">
							<div class="progress-bar progress-bar-info" role="progressbar" style="width:${list.p_invest/list.p_price*100}%"></div>
						</div>
						<div class="progress-detail">
							<ul class="list-inline">
								<li><fmt:formatNumber value="${list.p_invest/list.p_price}" type="percent"/>����</li>
								<li>(${list.p_people}��)</li>
								<li><c:if test="${list.p_success == 'doing'}">
										<b class="text-aqua">�ݵ�������</b>
									</c:if> 
									<c:if test="${list.p_success == 'success' || list.p_success == 'refunds' || list.p_success == 'overend'}">
									<span class="">${list.p_enddate }</span>
										<b class="text-green">�ݵ�����</b>
									</c:if> 
									<c:if test="${list.p_success == 'fail'}">
										<b class="text-danger">�ݵ�����</b>
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
							<h4><strong>�߱ݸ� ���ŷ�</strong></h4>
							<p><small>���� ��������� ���� ���, �ΰǺ�, ����� ���� ����� �¶��� �߱ݸ� ���ŷ��� ���� ȹ��������
								������ϴ�. ���� ���� �ո����� ���� ���ڿ� ���� ������ �����ϼ���.</small></p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio" src="image/icon-main-1.jpg" alt="">
						<div class=" text-center">
							<h4><strong>������ �ſ���</strong></h4>
							<p><small>���� ��������� �ſ��� ����� ���� �ո������� ���� ���� �ֽ��ϴ�. ����� ������ ���յ� ������
								�������� �ſ��� �ý����� ���� ���� �ſ��� ���� ��������.</small></p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio" src="image/icon-main-3.jpg" alt="">
						<div class=" text-center">
							<h4><strong>�پ��� ���� ��Ʈ������</strong></h4>
							<p><small>�Ѱ��� ī�װ����� ���ڰ� �� �Ҿ� �Ͻôٰ��? ���������� ���� �� ����� ä�ǻӸ� �ƴ϶� �ε��� �㺸,
								����㺸 ���� �پ��� ī�װ��� ä�ǿ� �л����� ����������.</small></p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 ">
						<img class="img-responsive img-portfolio " src="image/icon-main-4.jpg" alt="">
						<div class=" text-center">
							<h4><strong>���ü�� ��� �۱�</strong></h4>
							<p><small>����������, ��Ƽ�꿢�� ���� �����Ѱ�, ����� �������� ��!! ��Ʈ���� �۱ݽ� ���Ǵ� ���ü��
								���ȱ���� ���� ���ڽý��ۿ� �������� ��������, ���� ���� �ƴϴ� ������ ����ȯ���� ��⼼��!!</small></p>
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
	<h3 class="box-header text-center">���� ����̾߱�</h3>
	</div>
	</div> -->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="box-header text-center">���� ��ǥ ����� </h3>
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