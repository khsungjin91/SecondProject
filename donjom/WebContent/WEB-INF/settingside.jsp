<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- warp시작 -->
		<div class="col-sm-3">
			<div class="text-center">	
		<c:if test="${hd.profile == null}">
			<img src="image/default.jpg" class="img-circle" width="150"  >
		</c:if>
		<c:if test="${hd.profile != null}">				
				<img src="/donjom/save/${hd.profile}" class="img-circle" width="150"  >
		</c:if>
		
				<p class="user-nick">${hd.nickname}</p>
				<p >${hd.email}</p>
				<p >가입일  ${hd.join}</p>
				<div class=" hidden-xs">
					<button type="button" class="btn btn-flat bg-orange" onclick="location.href='setting.dj'"><i class="fa fa-cog"></i> 기본정보 수정</button>
				</div>
			</div>
			<hr>
			<ul class=" dash-menu list-unstyled ">
				<li ><a href="dashboard.dj"><i class="fa fa-fw fa-tachometer fa-lg"></i>대시보드</a></li>
				<li><a href="invest_history.dj"><i class="fa fa-fw fa-bar-chart fa-lg"></i>투자내역</a></li>
				<li><a href="laon_history.dj">
				<i class="fa fa-fw fa-tasks fa-lg"></i>대출내역</a></li>
				<li><a href="point_deposit.dj">
				<i class="fa fa-fw fa-money fa-lg"></i>충전/환급</a></li>
				<li><a href="notification.dj">
				<i class="fa fa-fw fa-bullhorn fa-lg"></i>알림메세지</a></li>
				<li><a href="setting.dj">
				<i class="fa fa-fw fa-gear fa-lg"></i>설정</a></li>
			</ul>
		</div>
</body>
</html>