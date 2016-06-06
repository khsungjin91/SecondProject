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

<c:if test="${sessionScope.memId == null}">
<script>
alert("로그인 후 사용가능합니다.");
window.location="signIn.dj";
</script>
</c:if>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="warpper dash-body">
		<div class="container">
			<div class="col-sm-3">
				<div class="text-center">
					<img src="/donjom/save/${mdto.profile}" class="img-circle"
						width="150">
					<p class="user-nick">${mdto.nickname}</p>
					<p>${mdto.email}</p>
					<p>가입일 ${mdto.join}</p>
					<div class=" hidden-xs">
						<button type="button" class="btn btn-flat bg-orange"
							onclick="location.href='setting.dj'">
							<i class="fa fa-cog"></i> 기본정보 수정
						</button>
					</div>
				</div>
				<hr>
				<ul class=" dash-menu list-unstyled ">
					<li><a href="dashboard.dj"><i
							class="fa fa-fw fa-tachometer fa-lg"></i>대시보드</a></li>
					<li><a href="invest_history.dj"><i
							class="fa fa-fw fa-bar-chart fa-lg"></i>투자내역</a></li>
					<li><a href="laon_history.dj"> <i
							class="fa fa-fw fa-tasks fa-lg"></i>대출내역
					</a></li>
					<li><a href="point_deposit.dj"> <i
							class="fa fa-fw fa-money fa-lg"></i>충전/환급
					</a></li>
					<li><a href="notification.dj"> <i
							class="fa fa-fw fa-bullhorn fa-lg"></i>알림메세지
					</a></li>
					<li><a href="setting.dj"> <i
							class="fa fa-fw fa-gear fa-lg"></i>설정
					</a></li>
				</ul>
			</div>
			<!-- 오른쪽 충전환급 레이어 -->
			<div class="col-sm-12 col-md-8 ">
				<div class="box box-solid panel-body">
					<div class="box-header">
					<h2>알림메세지</h2>
					</div>
					
					<div class="box-body">
					<hr>
						<table class="table table-condensed">
		<tr>
			<td>메세지</td>
			<td>시간</td>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.m_content}</td>
				<td>${list.m_time}</td>
			</tr>
		</c:forEach>
	</table>
	<p class="text-center">${pagingHtml}</p>
	</div>
	</div>
	</div>
	</div>
	</div>










</body>
</html>