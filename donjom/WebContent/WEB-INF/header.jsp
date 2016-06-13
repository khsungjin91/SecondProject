<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<script >
        // 페이스북 SDK 초기화
        window.fbAsyncInit = function () {
            FB.init({
                appId: '1206601269351179'    // Website with Facebook Login 사이트 : 일단 test 용으로 용퓌 계정상에서 app 생성
                , status: true   // check login status
                , cookie: true   // enable cookies to allow the server to access the session
                , xfbml: true    // parse XFBML
                //,oauth: true
            });
                 
        };
               
// 페이스북 SDK(js) 로딩 (페이지 로딩 속도 향상을 위해 사용)
        (function (d) {
            var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement('script');
            js.id = id;
            js.async = true;
            //js.src = "//connect.facebook.net/en_US/all.js";
            js.src = "http://connect.facebook.net/ko_KR/all.js";
            ref.parentNode.insertBefore(js, ref);
        }(document));

        
  </script>
<title>welcome to DonJom</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body  class="hold-transition skin-yellow-light layout-top-nav">
<script type="text/javascript">

$('#loan-cal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})
</script>

<div class="wrapper">

   <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
         <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar bg-gray"></span>
            <span class="icon-bar bg-gray"></span>
            <span class="icon-bar bg-gray"></span>
          </button>
          <a class="navbar-brand" href="main.dj">
          <img alt="brand" src="image/brand.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="loan_step1.dj" class="navbar-link"><b>대출JOM</b></a></li>
			<li><a href="fundList.dj" ><b>투자JOM</b></a></li>
			<li><a href="DJlive.dj" ><b>상태JOM</b></a></li>
			<li><a href="ex.dj" class="hidden-sm"><b>연습JOM</b></a></li>
			<li><a href="#" data-target="#loan-cal"  data-toggle="modal" class="hidden-sm"><b>계산기JOM</b></a></li>
        
          </ul>
           <c:if test="${sessionScope.memId == null}">
          <ul class="nav navbar-nav navbar-right">
           	<li><a href="signUp.dj">회원가입</a></li>
			<li><a href="signIn.dj">로그인</a></li>
          </ul>
          </c:if>
         <c:if test="${sessionScope.memId != null}">
            <ul class="nav navbar-nav navbar-right">
             <li>
             <a href="notification.dj">
         <c:if test="${hd.count != 0}">
             <!-- 석모형 알람이미지 -->
         <span class="label label-danger"><i class="fa fa-fw fa-check-circle"></i></span>	
         </c:if>
            <i class="fa fa-bell fa-lg" aria-hidden="true" id="alram-icon-main"></i></a>
           	</li>
             <li><a href="point_deposit.dj" class="hidden-sm">예치금 
           <fmt:formatNumber value="${hd.total}" pattern="#,###" />원</a></li>
           
       <li class="dropdown user user-menu">
              <!-- Menu Toggle Button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
                <!-- The user image in the navbar-->
               <c:if test="${hd.profile == null}">
                <img src="image/default.jpg" class="user-image" >
               </c:if>
               <c:if test="${hd.profile != null}">
                <img src="/donjom/save/${hd.profile}" class="user-image" >
               </c:if>
                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                <span >${memId}</span>
              </a>
          <ul class="dropdown-menu" role="menu">
          	<li ><a href="dashboard.dj">
          		<i class="fa fa-fw fa-tachometer fa-lg"></i>대시보드</a></li>
				<li><a href="invest_history.dj"><i class="fa fa-fw fa-bar-chart fa-lg"></i>투자내역</a></li>
				<li><a href="laon_history.dj">
				<i class="fa fa-fw fa-tasks fa-lg"></i>대출내역</a></li>
				<li><a href="point_deposit.dj">
				<i class="fa fa-fw fa-money fa-lg"></i>충전/환급</a></li>
				<li><a href="notification.dj">
				<i class="fa fa-fw fa-bullhorn fa-lg"></i>알림메세지</a></li>
				<li><a href="setting.dj">
				<i class="fa fa-fw fa-gear fa-lg"></i>설정</a></li>
            
            <li class="divider"></li>
            <li><a href="help_faq.dj">도움말</a></li>
            <li><a href="logout.dj">로그아웃</a></li>
          </ul>
        </li>
          </ul>
          </c:if>
      </div><!--/.nav-collapse-->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>

    
    <!-- Modal -->
<div class="modal fade" id="loan-cal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="text-center" id="myModalLabel">이자 계산기</h4>
      </div>
      <div class="modal-body">
		<jsp:include page="/calculator/calculatorinput.jsp" />
	 </div>
      <div class="modal-footer">
      <div class="text-center">
        <button type="button" class="btn btn-lg bg-red" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>