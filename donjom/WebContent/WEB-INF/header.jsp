<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "point.bean.PointDto" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
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
<body  class="hold-transition skin-green-light layout-top-nav">
<script type="text/javascript">

$('#loan-cal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})
</script>

<%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@masterkh.iptime.org:7000:orcl","donjom","donjom");
 
    PreparedStatement pstmt = null;
    
    ResultSet rs = null;
    												
 	String email = (String)session.getAttribute("memId");
 	String profile = "";
 	long total = 0;
 	int no = 0;
 	PointDto dto = new PointDto();
 	
	if(session.getAttribute("memId") != null){
		
		pstmt = conn.prepareStatement("select no from member where email=?");
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			no = rs.getInt("no");
		}
		
		pstmt = conn.prepareStatement("select profile from member where email=?");
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
		profile = rs.getString("profile");		
		}
		
		pstmt = conn.prepareStatement("select total_ch,total_re from memprice where no=?");
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			
			long total_ch = rs.getLong("total_ch");
			long total_re = rs.getLong("total_re");
			
			total = total_ch - total_re;
		}
	}
%>

<div class="wrapper">

   <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
         <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="main.dj">
          <img alt="brand" src="image/brand.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="loan_step1.dj" class="navbar-link"><b>대출JOM</b></a></li>
			<li><a href="fundList_total.dj" ><b>투자JOM</b></a></li>
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
             <c:if test="${count != 0}">
             <!-- 석모형 알람이미지 -->
             <span class="label label-danger"><i class="fa fa-fw fa-check-circle"></i></span>	
             </c:if>
            <i class="fa fa-bell fa-lg" aria-hidden="true" id="alram-icon-main"></i></a>
           </li>
             <li><a href="#" class="hidden-sm">예치금 
           <fmt:formatNumber value="<%=total %>" pattern="#,###" />원</a></li>
           
       <li class="dropdown user user-menu">
              <!-- Menu Toggle Button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
                <!-- The user image in the navbar-->
                <img src="/donjom/save/<%=profile %>" class="user-image" >
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
            <li><a href="#">도움말</a></li>
            <li><a href="logout.dj">로그아웃</a></li>
          </ul>
        </li>
          </ul>
          </c:if>
      </div><!--/.nav-collapse
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
        <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>