<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>manager page</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script>
$(document).ready(function(){
        $("#noconfirm_mem").load("manager_noconfirm.dj");
        $("#confirm_mem").load("manager_confirm.dj");
});
</script>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="/WEB-INF/admin-slider.jsp" />

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-sm-9">
							<!-- notice box start -->
							<div class="box-header">
								<div class="box-title">일반회원 리스트</div>
							</div>
							<div id="noconfirm_mem"></div>
							</div>
							<div class="col-sm-12">
							<!-- notice box start -->
							<div class="box-header">
								<div class="box-title">인증회원 리스트</div>
							</div>
							<div id="confirm_mem"></div>
							</div>
							
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="button" value="인증회원" onclick="javascript:location.href='manager_confirm.dj'">
	<input type="button" value="일반회원" onclick="javascript:location.href='manager_noconfirm.dj'">
	


</body>
</html>