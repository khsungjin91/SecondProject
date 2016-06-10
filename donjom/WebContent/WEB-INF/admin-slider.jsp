<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- ��Ÿ�±� ����  -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
<!-- css �� js ���� ��Ŭ���  -->
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<body class="hold-transition skin-green-light layout-top-nav">
<c:if test="${sessionScope.adminId==null}">
<script>
alert("���� ������ �����ϴ�.");
window.location="admin_login.dj";
</script>
</c:if>

<div class="wrapper">

  <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="manager_main.dj" class="navbar-brand"><b>DONJOM</b>������</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="manager_member.dj" type="button">ȸ�� ���� </a></li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">��������<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
				<li><a href="manager_page.dj" type="button">����������</a></li>
				<li><a href="manager_board.dj" type="button" >�Խù�����</a></li>
				</ul>
				</li>
			<li><a href="manager_investmn2.dj" type="button">���� ��Ȳ</a></li>
			<li><a href="manager_borrowmn.dj" type="button">���� ��Ȳ</a></li>
			<li><a href="manager_borrowlist.dj" type="button">�� ���ε�</a></li>
			<li><a href="manager_evaluation.dj" type="button">����ɻ�</a></li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">�۱�/ȯ��<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
				<li><a href="manager_remittance.dj" type="button">�۱��ϱ�</a></li>
				<li><a href="manager_refunds.dj" type="button">ȯ���ϱ�</a></li>
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
          	<i class="fa fa-fw fa-tachometer fa-lg"></i>��������</a></li>
				
            <li><a href="admin_logout.dj">�α׾ƿ�</a></li>
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
  
       

     