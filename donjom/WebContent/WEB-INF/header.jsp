<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>welcome to DonJom</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />

</head>
<body>
<div class="warpper">
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
          <a class="navbar-brand" href="main.dj">
          <img alt="brand" src="image/brand.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="loan_step1.dj" ><b>����JOM</b></a></li>
			<li><a href="fundList_total.dj" ><b>����JOM</b></a></li>
			<li><a href="DJlive.dj" class="hidden-sm"><b>����JOM</b></a></li>
			<li><a href="ex.dj" class="hidden-sm"><b>����JOM</b></a></li>
			<li><a href="#" data-target="#loan-cal"  data-toggle="modal" class="hidden-sm"><b>����JOM</b></a></li>
        
          </ul>
           <c:if test="${sessionScope.memId == null}">
          <ul class="nav navbar-nav navbar-right">
           	<li><a href="signUp.dj">ȸ������</a></li>
			<li><a href="signIn.dj">�α���</a></li>
          </ul>
          </c:if>
         <c:if test="${sessionScope.memId != null}">
            
            <ul class="nav navbar-nav navbar-right">
             <li>
              <a href="notification.dj">
             <c:if test="${count != 0}">
             <!-- ������ �˶��̹��� --><div id="alram-icon"><i class="fa fa-fw fa-check-circle"></i>	</div> 
             </c:if>
            <i class="fa fa-bell fa-lg" aria-hidden="true" id="alram-icon-main"></i></a>
           </li>
             <li><a href="#" class="hidden-sm">��ġ�� ${total}��</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
          <img src="/donjom/save/${dto.profile}" class="user-image" width="25"  >
          ${memId}<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
          		<li><a href="dashboard.dj">��ú���</a></li>
				<li><a href="invest_history.dj">���ڳ���</a></li>
				<li><a href="laon_history.dj">���⳻��</a></li>
				<li><a href="point_deposit.dj">����/ȯ��</a></li>
				<li><a href="notification.dj">�˸��޼���</a></li>
				<li><a href="setting.dj">����</a></li>
            
            <li class="divider"></li>
            <li><a href="#">����</a></li>
            <li><a href="logout.dj">�α׾ƿ�</a></li>
          </ul>
        </li>
          </ul>
          </c:if>
      </div><!--/.nav-collapse -->
   
      </div>
    </nav>
    
    <!-- Modal -->
<div class="modal fade" id="loan-cal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="text-center" id="myModalLabel">���� ����</h4>
      </div>
      <div class="modal-body">
		<jsp:include page="/calculator/calculatorinput.jsp" />
	 </div>
      <div class="modal-footer">
      <div class="text-center">
        <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">�ݱ�</button>
        </div>
      </div>
    </div>
  </div>
</div>