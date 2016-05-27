<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<title>manager page</title>
</head>
<body>
	 <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
          <ul class="sidebar-nav">
            <li class="sidebar-brand"><a href="#">DONJOM ADMIN</a></li>
            <li><a href="manager_member.dj" type="button">회원 정보 관리 </a></li>
			<li><a href="manager_page.dj" type="button">페이지관리</a></li>
			<li><a href="manager_board.dj" type="button" >게시물관리</a></li>
			<li><a href="manager_investmn2.dj" type="button">투자 관리</a></li>
			<li><a href="manager_borrowmn.dj" type="button">대출 관리</a></li>
			<li><a href="manager_borrowlist.dj" type="button">펀딩 등록 관리</a></li>
			<li><a href="manager_evaluation.dj" type="button">대출심사</a></li>
			<li><a href="manager_remittance.dj" type="button">충전/환급</a></li>
		</ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>DONJOM ADMIN</h1>
                       
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">메뉴 가리기/열기</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->


    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
	
</body>
</html>