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
<script>

function checkprice(){
	
	var f1 = document.userinput;
	var receive = f1.re_price.value;
	var total = ${total}
	
	if(!f1.re_price.value){
		
		alert("환급액을 입력해주시기 바랍니다.");
		f1.re_price.focus();
		return false;
	}
	
	if(total < receive){
		
		alert("환급금액이 초과되었습니다");
		f1.re_price.focus();
		return false;
	}
	
}

</script>

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
					 <li><i class="fa fa-check text-olive"></i> 환급 수수료 : 무료</li>
					 <li><i class="fa fa-check text-olive"></i>  환급 최소 금액 : 1 원	 </li>
					 <li><i class="fa fa-check text-olive"></i>  환급 최대 금액 (1일 기준) : 무제한  </li>
					 <li><i class="fa fa-check text-olive"></i>  환급 시각 : 신청 후 약 20분 이내에 계좌이체 <small>(단, 서버 작업이 진행중일 때에는 반영금액이 지체될 수 있습니다.)</small>	 </li>
					 <li><i class="fa fa-check text-olive"></i>환급 신청시 고객님의 휴대폰으로 수신된 환급 요청 동의번호를 확인 후, 해당 번호를 0000 형식으로 답변하면 환급이 완료됩니다.</li>
					 </ul> 



<c:if test="${dto.socialnum == null && dto.bankaccnum == null}">

-환급을 진행하시려면 회원인증이 필요합니다.			<br/>
-원천징수 정보까지 입력하셔야 최종인증이 완료됩니다.		<br/>
(회원인증 후에도 환급 진행이 불가하다면, 이메일 또는 전화로 문의 바랍니다.) <br/>

<input type="button" value="인증하러가기" onclick="javascript:window.location='setting_cert_person.dj'">

</c:if>
<br>
<div class="well">
					<c:if test="${dto.socialnum != null && dto.bankaccnum != null}">
								<form action="point_refunds.dj" method="post" name="userinput">
					
								<dl class="dl-horizontal ">
									<dt>환급가능액</dt>
									<dd> ${total}원	</dd>
									<dt>1일 환급한도 여분액</dt>
									<dd>무제한</dd>
									<dt>환급액</dt>
									<dd> <input type="text" name="re_price"/>원	</dd>
									<dt>은행명</dt>
									<dd>${dto.bankcode}		</dd>
									<dt>환급계좌번호</dt>
									<dd>${dto.bankaccnum}		</dd>
									<dt>예금주</dt>
									<dd>${dto.name}		</dd>
									</dl>

	<div class="list-inline text-center">		
	<input type="button" value="환급알아보기" onclick="" class="btn btn-default btn-lg disabled">			
<input type="submit" value="환급하기" onclick="return checkprice()" class="btn btn-lg bg-green">	
</div>						
</form>

	
	
</c:if>	
</div>
				</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>