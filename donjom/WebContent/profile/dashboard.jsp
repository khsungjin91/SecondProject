<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../style/css/herb.css" rel="stylesheet">
	<link href="../bt/css/bootstrap.min.css" rel="stylesheet">
 	<link href="../bt/css/bootstrap-theme.min.css" rel="stylesheet">
 	<title>대시보드</title>
</head>
<body>
	<section class="profile-detail">
	<div class="container profile-wrap">
		<div class="col-sm-3 mobile-profile-nav">
			<div class="user-info text-center radius">						
				<img src="../image/default.png" class="radius-circle" width="75"  >
				<p class="name txt-cut-line user-nick">User Name</p>
				<p class="email txt-cut-line">user@donjom.net</p>
				<p class="date">가입일 16.04.20</p>
				<div class="btn-profile-edit hidden-xs">
					<button type="button" class="btn" onclick="location.href='/profile/setting'"><i class="fa fa-cog"></i> 기본정보 수정</button>
				</div>
			</div>
			<ul class="menu menu-dashboard radius">
				<li class="dashboard"><a href="dashboard.dj" class="active"><span class="glyphicon glyphicon-dashboard"></span> 대시보드</a></li>
				<li class="invest"><a href="invest_history.dj" class=""> 투자내역</a></li>
				<li class="lend"><a href="laon_history.dj" class=""> 대출내역</a></li>
				<li class="moeny"><a href="point_deposit.dj" class=""> 충전/환급</a></li>
				<li class="moeny hidden-xs"><a href="notification.dj" class="">알림 메세지</a></li>
				<li class="setting"><a href="setting.dj" class="">설정</a></li>
			</ul>
		</div>
		<div class="col-xs-12 col-sm-9 contents-warp right">
			
			
			<!-- 좌측 -->
			<div class="col-sm-12 col-md-8 contents-left">
				<!-- 투자요약 -->
				<div class="panel panel-default contents">
					<div class="panel-heading">
					<h3 class="panel-title">투자요약</h3>
					</div>
					<div class="panel-body">
						<ul class="col-xs-6">
							<li>
								<p class="title-edge">누적 투자금</p>
							    <p class="title-other">0원</p>
							</li>
							<li class="line">
								<p>누적 투자 회수금<span>0원</span></p>
							</li>
							<li class="line">
								<p>누적 투자 회수 원금<span>0원</span></p>
							</li>
							<li class="line">
								<p>누적 수익금<span>0원</span></p>
							</li>
							<li>
								<p>잔여 상환 원금<span>0원</span></p>
							</li>
						</ul>
						<ul class="col-xs-6 table-wrap">
						    <li>
						        <p class="title-edge">평균 수익률(연)</p>
							    <p class="title-other">0.00%</p>
						    </li>
							<li class="line">
								<p>상환중인 투자<span>0건</span></p>
							</li>
							<li class="line">
								<p>상환 완료된 투자<span>0건</span></p>
							</li>
							<li class="line">
								<p>연체 건수<span>0건</span></p>
							</li>
							<li>
								<p>채권 발생 건수<span>0건</span></p>
							</li>
						</ul>
					</div>
				</div>
				<!-- //투자요약 -->
									
				<!-- 대출요약 -->
				<div class="panel panel-default contents">
					<div class="panel-heading">
					<h3 class="panel-title">대출요약</h3>
					</div>
					<div class="panel-body">
						<ul class="col-xs-6">
							<li>
								<p class="title-edge">누적 대출금</p>
								<p class="title-other">0원</p>
							</li>
							<li class="line">
								<p>누적 대출 상환금<span>0원</span></p>
							</li>
							<li class="line">
								<p>누적 이자금<span>0원</span></p>
							</li>
							<li>
								<p>잔여 상환 원금<span>0원</span></p>
							</li>
						</ul>
						<ul class="col-xs-6 table-wrap">
							<li>
								<p class="title-edge">평균 이자율(연)</p>
								<p class="title-other">0.00%</p>
							</li>
							<li class="line">
								<p>상환중인 대출<span>0건</span></p>
							</li>
							<li class="line">
								<p>상환 완료된 대출<span>0건</span></p>
							</li>
							<li class="line">
								<p>연체 건수<span>0건</span></p>
							</li>
							<li>
								<p>채권 발생 건수<span>0건</span></p>
							</li>
						</ul>

					</div>
				</div>
				<!-- //대출요약 -->		
			</div>
			<!-- //좌측-->	
			<!-- 우측 -->
			<div class="col-sm-12 col-md-4 contents-aside">
				<!-- 가상계좌정보 -->
				<div class="panel panel-default contents contents-right">
					<div class="panel-heading">
						<h3 class="panel-title">가상계좌 정보</h3>
					</div>
					<div class="panel-body body-margin-bank text-center">
						<button class="btn deposit" onclick="location.href='../profile/point.jsp'">가상계좌 생성하기</button>							
					</div>
				</div>
				<!-- //가상게좌정보 -->
                                          
                <!-- 알림 메세지 -->
				<div class="panel panel-default contents contents-right">
					<div class="panel-heading">
					<h3 class="panel-title">알림 메세지<a class="btn-box-more radius right" href="/profile/notification">더보기</a></h3>
					</div>
					<div class="panel-body timeline timeline-off">
					    <div class="timeline-off-box"><span>메세지가 없습니다.</span></div>
					</div>
					</div>
				<!-- //알림 메세지 -->	
			</div>
			<!-- 우측 -->		
		</div>
</div>		
</section>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>