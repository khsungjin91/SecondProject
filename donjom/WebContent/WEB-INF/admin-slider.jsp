<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- 메타태그 시작  -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
<!-- css 및 js 파일 인클루드  -->
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <jsp:include page="/WEB-INF/header.jsp" />
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
          <ul class="sidebar-nav">
            <li class="sidebar-brand">
            	<a href="manager_main.dj">
				관리자 페이지</a></li>
            <li><a href="manager_member.dj" type="button">회원 정보 관리 </a></li>
			<li><a href="manager_page.dj" type="button">페이지관리</a></li>
			<li><a href="manager_board.dj" type="button" >게시물관리</a></li>
			<li><a href="manager_investmn2.dj" type="button">투자 관리</a></li>
			<li><a href="manager_borrowmn.dj" type="button">대출 현황</a></li>
			<li><a href="manager_borrowlist.dj" type="button">펀딩 등록 관리</a></li>
			<li><a href="manager_evaluation.dj" type="button">대출심사</a></li>
			<li><a href="manager_remittance.dj" type="button">충전/환급</a></li>
		</ul>
        </div>
        <!-- /#sidebar-wrapper -->
