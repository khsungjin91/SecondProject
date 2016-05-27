<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- ��Ÿ�±� ����  -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
<!-- css �� js ���� ��Ŭ���  -->
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />

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

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="main.dj"><img
						src="image/brand.png"> ADMIN</a></li>
				<li><a href="manager_member.dj" type="button">ȸ�� ���� ���� </a></li>
				<li><a href="manager_page.dj" type="button">����������</a></li>
				<li><a href="manager_board.dj" type="button">�Խù�����</a></li>
				<li><a href="manager_repaymn.dj" type="button">���� ����</a></li>
				<li><a href="manager_borrowmn.dj" type="button">���� ����</a></li>
				<li><a href="manager_borrowlist.dj" type="button">�ݵ� ��� ����</a></li>
				<li><a href="manager_evaluation.dj" type="button">����ɻ�</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-sm-9">
							<!-- notice box start -->
							<div class="box-header">
								<div class="box-title">�Ϲ�ȸ�� ����Ʈ</div>
							</div>
							<div id="noconfirm_mem"></div>
							</div>
							<div class="col-sm-12">
							<!-- notice box start -->
							<div class="box-header">
								<div class="box-title">����ȸ�� ����Ʈ</div>
							</div>
							<div id="confirm_mem"></div>
							</div>
							
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="button" value="����ȸ��" onclick="javascript:location.href='manager_confirm.dj'">
	<input type="button" value="�Ϲ�ȸ��" onclick="javascript:location.href='manager_noconfirm.dj'">
	

</head>
<body>
</body>
</html>