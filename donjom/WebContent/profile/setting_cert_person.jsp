<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인정보 인증</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	function button() {
		alert("해당 E-mail로 인증번호가 전송 되었습니다. ");
		$.ajax({
			type : "post",
			url : "/donjom/confirm.dj",
			data : { // url 페이지도 전달할 파라미터
				chemail : $('#checkemail').val(),
			},
			success : function test(a) {
				$("#callback").html(a);
			},
			error : function whenError() {
				alert("Error");
			}

		});
	}

	function changeAcc() {

		$.ajax({
			type : "post",
			url : "/donjom/change_bank.dj",
			success : function bank(a) {
				$("#changehere").html(a);
			},
			error : function bankfail() {
				alert("error");
			},
		});
	}

	function confirm() {

		if (!$("#name").val()) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if (!$("#birth").val()) {
			alert("생년월일을 입력해주세요.");
			$("#birth").focus();
			return false;
		}
		if (!$(":input:radio[name=gender]:checked").val()) {
			alert("성별을 선택해주세요.");
			return false;
		}
		if (!$("#mobilenum").val()) {
			alert("전화번호를 입력해주세요.");
			$("#mobilenum").focus();
			return false;
		}
		if (!$("#bankcode").val()) {
			alert("은행명을 입력해주세요.");
			$("#bankcode").focus();
			return false;
		}
		if (!$("#bankaccnum").val()) {
			alert("계좌번호를 입력해주세요.");
			$("#bankaccnum").focus();
			return false;
		}

	}
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<c:if test="${sessionScope.memId == null}">
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
					<h3 class="box-header">개인정보</h3>
					
<div class="box-body">
					<!-- 이름 생년월일 성별 휴대전화 은행 계좌번호 입력구간 -->

					<!-- 입력한 경우 -->

<form class="form-horizontal">
					<c:if test="${dto.name != null}">
						
							<div class="form-group">
								<label class="col-xs-3 control-label">이름 </label>
								<div class="col-sm-5">
									<input type="text" name="name" value="${dto.name}" class="form-control" disabled>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">생년월일</label>
								<div class="col-sm-5">
									<input type="text" name="birth" value="${dto.birth}" class="form-control" disabled>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">성별</label>
								<div class="col-sm-5">
							<c:if test="${dto.gender =='woman'}">
								<input type="text" name="gender" value="여자" class="form-control" disabled>
								
							</c:if>
							<c:if test="${dto.gender == 'men'}">
								<input type="text" name="gender" value="남자" class="form-control" disabled>
								
							</c:if>
							</div>
							</div>
							<c:if test="${memdto.confirm == 1}">
						<div class="col-sm-offset-3"><strong class="text-danger"><i class="fa fa-check"></i> 메일 인증 완료 상태입니다.	</strong></div><br>
							</c:if>
							<div class="form-group">
								<label class="col-sm-3 control-label">휴대폰번호</label>
								<div class="col-sm-5">
								 <input type="text" name="mobilenum" value="${dto.mobilenum}" class="form-control" disabled>
								 </div></div>
							<!-- ajax 사용 은행 정보만 바뀌게 해놨음 -->
							<jsp:include page="/profile/bankbody.jsp"></jsp:include>
						
					</c:if>
</form>

					<!-- 입력안한경우  -->
					<c:if test="${dto.name == null}">

						<form action="setting_cert_pro.dj" method="post" name="userinput" class="form-horizontal">

							<div class="form-group">
							<label class="col-xs-3 control-label">이름</label>
							<div class="col-sm-5">
							<input type="text" name="name" id="name" class="form-control">
							</div>
							</div>
							<div class="form-group">
							<label class="col-xs-3 control-label">생년월일</label>
							<div class="col-sm-5">
							<input type="text" name="birth" id="birth" maxlength="8" class="form-control">
							 &nbsp; <small>예) 20011203</small>
							</div>
							</div>
							<div class="form-group">
							<label class="col-xs-3 control-label">성별 </label>
							<div class="col-sm-5">
							<div class="radio">
							<label><input type="radio" name="gender" id="gender" value="men">남자 </label> &nbsp; &nbsp;
							<label><input type="radio" name="gender" id="gender" value="woman">여자</label>
							</div>
							</div>
							</div>
							
							<c:if test="${memdto.confirm == 0}">
								<div id="callback" class="form-group">
									<label class="col-xs-3 control-label">메일인증하기</label>
									<div class="col-xs-5">
									<input type="text" value="${memdto.email}"  name="checkemail" id="checkemail" class="form-control"> 
									</div>
									<input type="button" value="인증하기" onclick="button()" class="btn bg-red">
								</div>
							</c:if>
							<c:if test="${memdto.confirm == 1}">
							<label class="text-danger"><b>메일인증 완료 상태입니다.</b>	</label>																				<br />
							</c:if>
							<div class="form-group">
							<label class="col-xs-3 control-label">휴대폰번호</label>
							<div class="col-sm-5">
							<input type="text" name="mobilenum" id="mobilenum"
								maxlength="11" class="form-control">
							</div>
							</div>
							 <div class="form-group">
							<label class="col-xs-3 control-label">은행명</label>
							<div class="col-sm-5">  
							<select name="bankcode" id="bankcode" class="form-control">
								<option value="신한은행">신한은행</option>
								<option value="우리은행">우리은행</option>
								<option value="농협은행">농협은행</option>
								<option value="기업은행">기업은행</option>
								<option value="국민은행">국민은행</option>
								<option value="하나은행">하나은행</option>
							</select> 
							</div>
							</div>
							 <div class="form-group">
							<label class="col-xs-3 control-label">계좌번호</label>
							<div class="col-sm-5"> 
							 <input type="text" name="bankaccnum" id="bankaccnum" class="form-control">
							 </div>
							 <input type="submit" value="입력완료" onclick="return confirm()" class="btn bg-green"> 
							 </div>
						</form>

					</c:if>
					※ 23:30~01:00 사이에는 은행 전산망 점검 시간으로 이용에 제한이 있을수 있습니다. <br /> ※ 환급계좌
					변경은 SMS 본인인증 후 가능합니다 <br /> <br />

					<!-- 주민등록번호와 주소 입력 구간 -->
				<div class="well">
					<div class="box-header">
					<h3 >투자자 원천징수 정보 </h3>
					※ 투자를 하시려면 아래 정보를 입력하시기 바랍니다.
					</div>
					
					<!-- 입력한 경우 -->
					<br />
					<c:if test="${dto.socialnum != null}">
					<div class="form-horizontal">
					<div class="form-group">
							<label class="col-sm-3 control-label">주민등록번호</label>
							<div class="col-sm-5">
							<input type="text" name="socialnum" value="${socialnum}" class="form-control" disabled>
							</div>
							</div>
							<div class="form-group">
							<label class="col-sm-3 control-label">주소</label>
							<div class="col-sm-5">
							<input type="text" name="address" value="${dto.address}" class="form-control" disabled>
							</div>
							</div>
							</div>
					</c:if>

					<!-- 입력안한 경우 -->
					<c:if test="${dto.socialnum == null}">
						<form action="setting_detail_pro.dj" method="post" class="form-horizontal">
							<div class="form-group">
							<label class="col-sm-3 control-label">주민등록번호</label>
							<div class="col-sm-5">
							<input type="text" name="socialnum" maxlength="13" class="form-control">
							&nbsp; <small>예)8910121234567 </small>
							</div>
							</div>
							<div class="form-group">
							<label class="col-sm-3 control-label">주소</label>
							<div class="col-sm-5">
							<input type="text" name="address" class="form-control">
							 &nbsp; <small>예) 서울시 강남구 역삼동 230-10 </small>
							</div>
							<input type="submit" value="입력완료" class="btn bg-green">
							</div>
							   
						</form>
					</c:if>

<hr>
					<strong>※ 원천징수정보란? </strong><br>
					<small>빌리의 투자자가 투자 수익이 발생한 경우, 투자자가 국가에 부담할 세액을 빌리가 미리 국가를 대신하여
					징수하고, 투자자의 소득 정보를 신고하기 위해 수집하는 정보 입니다.  원천징수정보 미입력 시 빌리에서
					투자가 불가 합니다.</small>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>