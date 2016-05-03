<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../style/css/herb.css" rel="stylesheet">
<link href="../bt/css/bootstrap.min.css" rel="stylesheet">
 <link href="../bt/css/bootstrap-theme.min.css" rel="stylesheet">
<title>main page</title>
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
          <a class="navbar-brand" href="#"><img alt="brand" src="../image/brand.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="loan.dj" ><b>대출JOM</b></a></li>
			<li><a href="/product/fund_list.dj" ><b>투자JOM</b></a></li>
			<li><a href="DJlive.dj" ><b>상태JOM</b></a></li>
			<li><a href="/product/DJex.dj" ><b>연습JOM</b></a></li>
			<li><a href="DJcalculator.dj" ><b>계산기JOM</b></a></li>
        
          </ul>
          <ul class="nav navbar-nav navbar-right">
           	
		
			<c:if test="${sessionScope.memId == null}">
			<li><a href="signUp.dj">회원가입</a></li>
			<li><a href="signIn.dj">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.memId != null}">
			<li>알림</li>
			<li>예치금 0원</li>
			<li>
				<ul>
				<li>내정보</li>	
				<li><a href="dashboard.dj">대시보드</a></li>
				<li><a href="invest_history.dj">투자내역</a></li>
				<li><a href="laon_history.dj">대출내역</a></li>
				<li><a href="point.dj">충전/환급</a></li>
				<li><a href="notification.dj">알림메세지</a></li>
				<li><a href="setting.dj">설정</a></li>
				<li><a href="helf.dj">도움말</a></li>	
				<li><a href="logout.dj">로그아웃</a></li>			
				</ul>
			</li>	
			</c:if>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>



<%-- 중간메뉴 --%>
<div class="jumbotron">
	<div id="top_menu">
	
메인문구
<ul>
<li><a href="/profile/dashboard.dj" >대시보드</a></li>
<li><a href="/profile/invest.history.dj" >투자내역</a></li>
<li><a href="/profile/point.dj" >충전/환급</a></li>
<li><a href="press.dj" >언론기사</a></li>
<li><a href="/guide/loan.dj" >대출안내</a></li>
<li><a href="/guide/invest.dj" >투자안내</a></li>

</ul>

<%-- 매출및 부도 상태 --%>

<table>
<tr>
<td>평균이자율(연)</td><td>누적 대출액</td><td>누적 상환액</td><td>부도율 </td>
</tr>
<tr>
<%-- 
<td>${avgiza}</td><td>${totalloan}</td><td>${totalgive}</td><td>${break}</td>
--%>
</tr>
</table>

 </div>
   </div>

<div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="../image/main-bn.jpg" alt="...">
      <div class="caption">
        <h3 >연습투자</h3>
      
        <p>'돈좀'연습 투자는 신규 가입자를 위한 체험형 투자 상품입니다. 대출기간, 연이율, 상환방식 설정을 통해</p>
        
        <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
    <span class="sr-only">40% Complete (success)</span>
  </div>
</div>
        
        
      </div>
    </div>
  </div>
</div>



<%-- 펀딩메뉴 --%>
펀딩이 끝나지 않은 펀딩상품만 꺼내 놓기
<br/>
<c:forEach var="mainlist" items="${mainlist}">


</c:forEach>
<br/>

<%-- 기타정보 --%>

옆으로 슬라이드 가능한 script 가능하면 하기
안되면 최대 4개
<br/>
<c:forEach var="guidelist" items="${guidelist}">

</c:forEach>
<br/>

<%-- 관련 기사 --%>

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

<%-- 하위메뉴 --%>
<a href="compony.dj">회사소개</a>
<a href="/terms/agreement.dj">이용약관</a>
<a href="/terms/privacy_policy.dj">개인정보취급방침</a>
<a href="/terms/useinvest.dj">투자이용약관</a>
<a href="interview.dj">인터뷰</a>
<a href="notice.dj">공지사항</a>
<a href="help.dj">도움말</a>

<%-- 간단한회사정보 --%>
${companyinformation}


<%-- sns정보 및 사용가능한 sns --%>
	</div>
</div>



<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>