<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../style/css/herb.css" rel="stylesheet">
	<link href="../bt/css/bootstrap.min.css" rel="stylesheet">
 	<link href="../bt/css/bootstrap-theme.min.css" rel="stylesheet">
 	<title>대출신청</title>
</head>
<body>
<c:if test="${sessionScope.memId == null }">
<script type="text/javascript">
window.location="signIn.dj";
</script>
</c:if>


<h2>고객정보</h2>
<div id="loan-btn-sm">
	<img src="">
</div>
<form action="loan_step2.dj" method="post" class="form-horizontal">
	<div class="form-group">
		<label class="col-sm-2 control-label">이름</label>
		<div class="col-sm-10">
			<input type="text" name="memname" value="${sedto.name}" class="form-control" >
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">생년월일</label>
		<div class="col-sm-10">
			<input type="text" name="membirth" value="${sedto.birth}" class="form-control"  >
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">성별</label>
		<div class="col-sm-10">
			<input type="text" name="sex" value="${sedto.gender}" class="form-control" >
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">이메일 주소</label>
		<div class="col-sm-10">
			<input type="text" name="mememail" value="${memdto.email}" class="form-control" >
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">휴대폰 번호</label>
		<div class="col-sm-10">
			<input type="text" name="memphone" value="${sedto.mobilenum}" class="form-control" >
		</div>
	</div>
			<div class="form-group">
		<label class="col-sm-2 control-label">희망 대출액</label>
		<div class="col-sm-10">
			<input type="text" name="br_sum" class="form-control" >만원
		</div>
	</div>
	
		<div class="form-group">
		<label class="col-sm-2 control-label">상환 방법</label>
		<div class="col-sm-10">
			<select name="br_way" class="form-control">
				<option value="원리금 균등 상환">원리금 균등 상환</option>
				<option value="원금만기 일시상환">원금만기 일시상환</option>
			</select>
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">희망 대출기간</label>
		<div class="col-sm-10">
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
			<input type="button" value="이자계산기" class="btn btn-success">
		</div>
	</div>


계속하시면 <a href="#">여신거래부속약관</a>에 동의하게 됩니다.
<input type="submit" value="대출신청" class="btn btn-primary" name="loan-btn">
</form>



<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>