<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<ul class="breadcrumb">
					<li><h2 class="box-title">충전환급</h2></li>
						<li><a href="point_deposit.dj">충전</a></li>
						<li><a href="point_withdrow.dj">환급</a></li>
						<li><a href="point_history.dj">충전/환급내역</a></li>
					</ul>
					</div>
					
					<div class="box-body">
					<h4 class="box-title">충전하기</h4>
					 <h3 class="title-con text-aqua">보유예치금:  <fmt:formatNumber value="${total }" pattern="#,###" />원 </h3>
					 <ul class="list-unstyled text-lineheight">
					 <li><i class="fa fa-check text-olive"></i> 계좌이체 후 충전 반영 시간은 <b>약 1~10분</b> 사이 입니다.</li>
					 <li><i class="fa fa-check text-olive"></i> 충전을 위해 <b>본인인증</b>과 <b>은행정보</b> 등록이 필요합니다. </li>
					 <li><i class="fa fa-check text-olive"></i> 예치금은 가상 계좌에 원화를 <b>충전한 만큼 1:1</b>로 이루어집니다.  </li>
					 <li><i class="fa fa-check text-olive"></i> 23:00 ~ 00:30분 사이에는 <b>은행망 점검 시간</b>으로 이체가 불가할 수 있습니다. </li>
					 </ul> 


					<c:if test="${dto.socialnum == null && dto.bankaccnum == null}">

-가상계좌를 할당받으려면 회원인증이 필요합니다.	<br />
-원천징수 정보까지 입력하셔야 최종인증이 완료됩니다.	<br />
(회원인증 후에도 가상계좌 생성이 불가하다면, 이메일 또는 전화로 문의 바랍니다.) <br />

						<input type="button" value="인증하러가기"
							onclick="javascript:window.location='setting_cert_person.dj'">

					</c:if>
<br>
<div class="well">
					<c:if test="${dto.socialnum != null && dto.bankaccnum != null}">
								<h3>충전계좌정보</h3>
								<dl class="dl-horizontal ">
									<dt>은행명</dt>
									<dd>${dto.bankcode}</dd>
									<dt>예금주</dt>
									<dd>${dto.name}</dd>
									<dt>계좌번호</dt>
									<dd>${dto.randomacc}</dd>
									<dt>입금자명</dt>
									<dd>${dto.name}	</dd>
									</dl>

						<form action="point_charging.dj" method="post">
						<div class="col-sm-6">
							<input type="text" name="ch_price" class="form-control"> 
							</div>
							<input type="submit" value="충전하기" class="btn btn-md bg-green">
						</form>
<hr>
※ 위 가상계좌 번호로 투자금을 이체하시면 충전된 예치금으로 투자가 가능합니다.
</c:if></div>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>