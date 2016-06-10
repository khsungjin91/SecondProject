<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 메타태그 시작  -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
<!-- css 및 js 파일 인클루드  -->
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<body class="hold-transition skin-green-light layout-top-nav">
<c:if test="${sessionScope.adminId==null}">
<script>
alert("접근 권한이 없습니다.");
window.location="admin_login.dj";
</script>
</c:if>

<div class="wrapper">

  <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="manager_main.dj" class="navbar-brand"><b>DONJOM</b>관리자</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="manager_member.dj" type="button">회원 관리 </a></li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">돈좀수정<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
				<li><a href="manager_page.dj" type="button">페이지관리</a></li>
				<li><a href="manager_board.dj" type="button" >게시물관리</a></li>
				</ul>
				</li>
			<li><a href="manager_investmn2.dj" type="button">투자 현황</a></li>
			<li><a href="manager_borrowmn.dj" type="button">대출 현황</a></li>
			<li><a href="manager_borrowlist.dj" type="button">평가 업로드</a></li>
			<li><a href="manager_evaluation.dj" type="button">대출심사</a></li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">송금/환급<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
				<li><a href="manager_remittance.dj" type="button">송금하기</a></li>
				<li><a href="manager_refunds.dj" type="button">환급하기</a></li>
				</ul>
				</li>
        
          </ul>
          
        </div>
        <!-- /.navbar-collapse -->
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
           
           
            <!-- /.messages-menu -->

            <!-- Notifications Menu -->
            <li class="dropdown notifications-menu">
             
            <c:if test="${sessionScope.adminId!=null}">
            <!-- User Account Menu -->
            <li class="dropdown user user-menu">
              <!-- Menu Toggle Button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="hidden-xs">${id }</span>
              </a>
             <ul class="dropdown-menu" >
          	<li >
          	<a href="main.dj">
          	<i class="fa fa-fw fa-tachometer fa-lg"></i>돈좀메인</a></li>
				
            <li><a href="admin_logout.dj">로그아웃</a></li>
            </c:if>
          </ul>
          
            </li>
          </ul>
        </div>
        <!-- /.navbar-custom-menu -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>
  <!-- Full Width Column -->
  
       

     