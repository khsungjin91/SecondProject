<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>공지사항</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script>
$(document).ready(function(){
        $("#notice").load("notice.dj");
        $("#help").load("help_faq.dj");
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />
	<div id="wrapper">

	

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-sm-9">
							<!-- notice box start -->
							<div class="box-header">
								<div class="box-title">공지사항 NOTICE</div>
							</div>
							<div id="notice"></div>
							<div id="help"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="button" value="공지사항" onclick="javascript:location.href='manager_notice.dj'" >
	<input type="button" value="도움말"  onclick="javascript:location.href='manager_help.dj'" >
	<input type="button" value="뉴스" onclick="javascript:location.href='news_manager.dj'">
</body>
</html>