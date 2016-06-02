<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>manager page</title>


</head>
<body>


	<jsp:include page="/WEB-INF/admin-slider.jsp" />

	<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>
						회원 관리  <small>인증, 비인증 회원</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">회원 관리</li>
					</ol>
				</div>
			</div>
			</div>
			<hr>
			</div>
	


		<div class="container">
		
		
					<!-- Small boxes (Stat box) -->
      <div class="row">
      <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <ul class="list-inline text-center">
            	<li>인증 회원 수</li>
            	<li><h3>150</h3></li>
            </ul>
          </div>
        </div>
        <a href="manager_noconfirm.dj">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <ul class="list-inline text-center">
            	<li>인증하지 않은 회원 수</li>
            	<li><h3>150</h3></li>
            </ul>
          </div>
        </div></a>
         
        <!-- ./col -->
		</div>
			<div class="row">
				<div class="box box-primary">
					<div class="box-body">
						<div class="col-sm-12">
							<jsp:include page="/manager/manager_confirm.jsp" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ./container -->
	
	<!-- ./content-wrapper -->
</body>
</html>