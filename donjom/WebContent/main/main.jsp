<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />


<title>welcome to DonJom</title>

</head>
<body>

   <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><img alt="brand" src="image/brand.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="loan.dj" >대출JOM</a></li>
			<li><a href="fundList_total.dj" >투자JOM</a></li>
			<li><a href="DJlive.dj" >상태JOM</a></li>
			<li><a href="DJex.dj" class="hidden-sm" >연습JOM</a></li>
			<li><a href="DJcalculator.dj" class="hidden-sm" data-target="#mymodal">이자계산기</a></li>
        
          </ul>
           <c:if test="${sessionScope.memId == null}">
          <ul class="nav navbar-nav navbar-right">
           	<li><a href="signUp.dj">회원가입</a></li>
			<li><a href="signIn.dj">로그인</a></li>
          </ul>
          </c:if>
         <c:if test="${sessionScope.memId != null}">
            
            <ul class="nav navbar-nav navbar-right">
             <li><a href="">
             <i class="fa fa-bell fa-lg" aria-hidden="true"></i></a>
           </li>
             <li><a href="#" class="hidden-sm">예치금 0원</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
          ${memId}<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="dashboard.dj">대시보드</a></li>
            <li><a href="">대출내역</a></li>
            <li><a href="#">투자내역</a></li>
            <li><a href="point_deposit.dj">충전/환급</a></li>
            <li><a href="#">알림메세지</a></li>
            <li><a href="setting.dj">설정</a></li>
            
            <li class="divider"></li>
            <li><a href="#">도움말</a></li>
            <li><a href="logout.dj">로그아웃</a></li>
          </ul>
        </li>
          </ul>
          </c:if>
      </div><!--/.nav-collapse -->
   
      </div>
    </nav>



<div class="jumbotron">
	<div id="mcontent" style="background-image:url(image/main-bn.jpg)">

			<div class="container">
				<div class="row">
				<div class="col-md-6">
					<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="image/con-1.jpg" style="width:100%; height: 240px;" alt="First slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 1</h1>
					<p>텍스트 1</p>
				</div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg" style="width:100%" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 2</h1>
					<p>텍스트 2</p>
				</div>
			</div>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 3</h1>
					<p>텍스트 3</p>
				</div>
			</div>
		</div>
		<!--슬라이드3-->
	</div>
	
	<!--이전, 다음 버튼-->
	<!-- <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>  -->
</div>





					</div>
				<div class="col-md-6">	
		
		<ul class="list-inline">
			<li><a href="dashboard.dj">
			<img src="image/icon/1463134285_speedometer.png"><br>대시보드</a></li>
			<li><a href="invest.history.dj"><img src="image/icon/1463134252_trends.png" ><br>투자내역</a></li>
			<li><a href="point.dj"><img src="image/icon/1463134258_money.png" ><br>충전/환급</a></li>
			</ul>
			
			<ul class="list-inline">
			
			<li><a href="press.dj"><img src="image/icon/1463134237_clipboard.png" ><br>언론기사</a></li>
			<li><a href="/guide/loan.dj"><img src="image/icon/1463134285_speedometer.png" ><br>대출안내</a></li>
			<li><a href="/guide/invest.dj"><img src="image/icon/1463134285_speedometer.png" ><br>투자안내</a></li>
		</ul>
		</div>
					</div>
				</div>
			</div><!-- product end -->
			
	
	</div>
		<table>
			<tr>
				<td>평균이자율(연)</td>
				<td>누적 대출액</td>
				<td>누적 상환액</td>
				<td>부도율</td>
			</tr>
			<tr>
				
				<%-- 
<td>${avgiza}</td><td>${totalloan}</td><td>${totalgive}</td><td>${break}</td>
--%>
			</tr>
		</table>
</div>

	<div class="col-sm-6 col-md-4">
		<h4>
			부동산<a href="#">자세히보기</a>
		</h4>
		<div class="thumbnail">
			<div id="thum_image" class="img-rounded" style="background-image: url(image/con-2.jpg)">
				<h4>펀딩성공</h4>
				<br>(5분 소요)
			</div>
			<div class="caption">
				<h3>연습투자</h3>
				<p>'돈좀'연습 투자는 신규 가입자를 위한 체험형 투자 상품입니다. 대출기간, 연이율, 상환방식 설정을 통해</p>
				<p class="money">
					목표 7,000 <span class="txt-sub">만원</span> <span class="txt-point">연
						12.80%</span> <span class="txt-sub">수익률</span>
				</p>
			</div>

			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">
					<span class="sr-only">success</span>
				</div>

			</div>
			<div class="progress-detail">
				<p>
					<span class="txt-point">100%</span> 진행 
					<span class="progress-invest-people">(34명)</span>
				</p>
				<p class="d-day">
					<span class="txt-point">D-6일</span>
				</p>
			</div>
		</div>
	</div>
	<div class="col-sm-6 col-md-4">
		<h4>
			부동산<a href="#">자세히보기</a>
		</h4>
		<div class="thumbnail">
			<div id="thum_image" class="img-rounded" style="background-image: url(image/con-2.jpg)">
				<h4>펀딩성공</h4>
				<br>(5분 소요)
			</div>
			<div class="caption">
				<h3>연습투자</h3>
				<p>'돈좀'연습 투자는 신규 가입자를 위한 체험형 투자 상품입니다. 대출기간, 연이율, 상환방식 설정을 통해</p>
				<p class="money">
					목표 7,000 <span class="txt-sub">만원</span> <span class="txt-point">연
						12.80%</span> <span class="txt-sub">수익률</span>
				</p>
			</div>

			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">
					<span class="sr-only">success</span>
				</div>

			</div>
			<div class="progress-detail">
				<p>
					<span class="txt-point">100%</span> 진행 
					<span class="progress-invest-people">(34명)</span>
				</p>
				<p class="d-day">
					<span class="txt-point">D-6일</span>
				</p>
			</div>
		</div>
	</div>
	<div class="col-sm-6 col-md-4">
		<h4>
			부동산<a href="#">자세히보기</a>
		</h4>
		<div class="thumbnail">
			<div id="thum_image" class="img-rounded" style="background-image: url(image/con-2.jpg)">
				<h4>펀딩성공</h4>
				<br>(5분 소요)
			</div>
			<div class="caption">
				<h3>연습투자</h3>
				<p>'돈좀'연습 투자는 신규 가입자를 위한 체험형 투자 상품입니다. 대출기간, 연이율, 상환방식 설정을 통해</p>
				<p class="money">
					목표 7,000 <span class="txt-sub">만원</span> <span class="txt-point">연
						12.80%</span> <span class="txt-sub">수익률</span>
				</p>
			</div>

			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">
					<span class="sr-only">success</span>
				</div>

			</div>
			<div class="progress-detail">
				<p>
					<span class="txt-point">100%</span> 진행 
					<span class="progress-invest-people">(34명)</span>
				</p>
				<p class="d-day">
					<span class="txt-point">D-6일</span>
				</p>
			</div>
		</div>
	</div>
		<%-- 펀딩메뉴 --%>
		
		<div id="funding">
		<div class="owl-carousel">
    <div class="item"><h4>1</h4></div>
    <div class="item"><h4>2</h4></div>
    <div class="item"><h4>3</h4></div>
    <div class="item"><h4>4</h4></div>
    <div class="item"><h4>5</h4></div>
    <div class="item"><h4>6</h4></div>
    <div class="item"><h4>7</h4></div>
    <div class="item"><h4>8</h4></div>
    <div class="item"><h4>9</h4></div>
    <div class="item"><h4>10</h4></div>
    <div class="item"><h4>11</h4></div>
    <div class="item"><h4>12</h4></div>
</div>
		펀딩이 끝나지 않은 펀딩상품만 꺼내 놓기 <br />
		<c:forEach var="mainlist" items="${mainlist}">


		</c:forEach>
		<br />

	</div>
		
		<%-- 기타정보 --%>
<div id="guide">
옆으로 슬라이드 가능한 script 가능하면 하기
안되면 최대 4개
<br/>
<c:forEach var="guidelist" items="${guidelist}">

</c:forEach>
<br/>


</div>

<%-- 관련 기사 --%>

<div id="news">
언론 속 DJ
옆으로 슬라이드 가능한 script 가능하면 하기
<br/>
<c:forEach var="newslist" items="${newslist}">


</c:forEach>
<br/>

DJ대표고객사들
옆으로 슬라이드 가능한 script 가능하면 하기
<br/>
<c:forEach var="newslist" items="${newslist}">


</c:forEach>
<br/>
</div>


<%-- 하위메뉴 --%>
<footer>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 company-link">
				<a href="compony.dj">회사소개</a>
				<a href="/terms/agreement.dj">이용약관</a>
				<a href="/terms/privacy_policy.dj">개인정보취급방침</a>
				<a href="/terms/useinvest.dj">투자이용약관</a>
				<a href="interview.dj">인터뷰</a>
				<a href="notice.dj">공지사항</a>
				<a href="help.dj">도움말</a>

			</div>
		</div>
		
		<div class="row company-info">
			<div class="col-xs-12 col-sm-4">
				<h5>(주)돈좀</h5>
				<p>대표이사 : 마현경, 박성진, 박주완, 윤석모, 장재은</p>
				<p>사업자등록번호 533-86-00012</p>
				
			</div>
		</div>
	</div>
	
	
</footer>


</body>
</html>