<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>대출신청</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<c:if test="${sessionScope.memId == null }">
		<script type="text/javascript">
			window.location = "signIn.dj";
		</script>
	</c:if>

	<div class="container">
		<div class="col-xs-12">
			<div class="col-xs-12 col-sm-8 col-sm-offset-2 ">
				<h2 class="text-center">고객정보</h2>
				<hr>
				<div class="col-xs-12 col-sm-9 col-md-offset-2">
					<ul class="list-inline" id="icon-padding">
						<li><i class="fa fa-pencil-square-o fa-4x"></i></li>
						<li><i class="fa fa-angle-right fa-4x"></i></li>
						<li><i class="fa fa-folder-open-o fa-4x"></i></li>
						<li><i class="fa fa-angle-right fa-4x"></i></li>
						<li><i class="fa fa-file-text-o fa-4x"></i></li>
						<li><i class="fa fa-angle-right fa-4x"></i></li>
						<li><i class="fa  fa-desktop fa-4x"></i></li>
					</ul>
				
					<ul class="list-inline" id="text-padding">
					<li>고객 정보</li>
					<li>대출 신청 정보</li>
					<li>서류 제출</li>
					<li>펀딩 실행</li>
					</ul>
					

			</div>
		
			<div class="col-xs-12  ">
			
				<form action="loan_step2.dj" method="post" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">이름</label>
						<div class="col-sm-8">
							<input type="text" name="memname" value="${sedto.name}"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">생년월일</label>
						<div class="col-sm-8">
							<input type="text" name="membirth" value="${sedto.birth}"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">성별</label>
						<div class="col-sm-8">
							<input type="text" name="sex" value="${sedto.gender}"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">이메일 주소</label>
						<div class="col-sm-8">
							<input type="text" name="mememail" value="${dto.email}"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">휴대폰 번호</label>
						<div class="col-sm-8">
							<input type="text" name="memphone" value="${sedto.mobilenum}"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">희망 대출액</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="br_sum" class="form-control">
								<div class="input-group-addon">만원</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">상환 방법</label>
						<div class="col-sm-8">
							<select name="br_way" class="form-control">
								<option value="0">원리금 균등상환</option>
								<option value="1">원금만기 일시상환</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">희망 대출기간</label>
						<div class="col-sm-8">
							<select name="br_term" class="form-control">
								<option value="1">1개월</option>
								<option value="2">2개월</option>
								<option value="3">3개월</option>
								<option value="4">4개월</option>
								<option value="5">5개월</option>
								<option value="6">6개월</option>
								<option value="12">12개월</option>
								<option value="18">18개월</option>
								<option value="24">24개월</option>
								<option value="36">36개월</option>
							</select> 
						</div>
					</div>
					<hr>
					<div class="col-sm-12 col-sm-8 col-md-offset-3">
					<input type="button" value="이자계산기" class="btn btn-success">
					
					</div>
					

					계속하시면 <a href="#">여신거래부속약관</a>에 동의하게 됩니다. <input type="submit"
						value="대출신청" class="btn btn-primary" name="loan-btn">
				</form>

			</div>


		</div>
	</div>


</body>
</html>