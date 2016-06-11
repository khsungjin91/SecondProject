<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp" />

	<c:if test="${sessionScope.memId == null }">

		<script type="text/javascript">
			alert("로그인 후 사용가능합니다.");
			window.location = "signIn.dj";
		</script>

	</c:if>
	<div class="warpper dash-body">
		<div class="container">
			<jsp:include page="/WEB-INF/settingside.jsp" />
			<div class="col-xs-12 col-sm-8 contetns-warp right">
				<!-- 좌측 전체 -->
				<div class="col-sm-12 contents-left">
					<!-- 설정부분전체 -->
					<div class="box box-default contents">
						<div class="box-header">
							<ol class="breadcrumb contents-menu hidden-xs">
								<li><h3>설정</h3></li>
								<li><a href="setting.dj">기본정보</a></li>
								<li><a href="setting_cert_person.dj">인증센터</a></li>
								<li><a href="setting_session_history.dj">로그인내역</a>
							</ol>
						</div>
						<div class="box-body">
								<h3>로그인내역</h3>

							<table class="table table-striped">
								<tr>
									<td>시각</td>
									<td>활동</td>
									<td>IP주소</td>
									<td>위치</td>
								</tr>
								<c:forEach var="session" items="${session}">
									<tr>
										<td>${session.time}</td>
										<td>${session.move}</td>
										<td>${session.ip}</td>
										<td>${session.place}</td>
									</tr>
								</c:forEach>
							</table>

							<div class="text-center">${pagingHtml}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/footer.jsp"/>
</body>
</html>