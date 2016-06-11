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

<c:if test="${sessionScope.memId == null }">

<script type="text/javascript">
alert("로그인 후 사용가능합니다.");
window.location="signIn.dj";
</script>

</c:if>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="warpper dash-body">
		<div class="container">
			<jsp:include page="/WEB-INF/settingside.jsp" />
			<!-- 오른쪽 충전환급 레이어 -->
			<div class="col-sm-12 col-md-8 ">
				<div class="box box-solid panel-body">
					<div class="box-header">
						<ul class="breadcrumb">
							<li><h2 class="box-title">충전환급</h2></li>
							<li><a href="point_deposit.dj">충전</a></li>
							<li><a href="point_withdrow.dj">환급</a></li>
							<li><a href="point_history.dj">충전/환급내역</a></li>
						</ul>
					</div>

					<div class="box-body text-center title">
						<i class="fa fa-cogs fa-5x"></i>
						<h3>오픈 준비중 입니다.</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>

</body>
</html>