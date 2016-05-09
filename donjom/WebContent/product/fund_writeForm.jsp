<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<h2>고객정보</h2>
<div id="loan-btn-sm">
	<img src="">
</div>
<form action="loan_step2.dj" method="post" class="form-horizontal">
	<div class="form-group">
		<label class="col-sm-2 control-label">이름</label>
		<div class="col-sm-10">
			<input type="text" name="name" value="${sedto.name}" class="form-control" >
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">생년월일</label>
		<div class="col-sm-10">
			<input type="text" name="birth" value="${sedto.birth}" class="form-control"  >
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
			<input type="text" name="email" value="${memdto.email}" class="form-control" >
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">휴대폰 번호</label>
		<div class="col-sm-10">
			<input type="text" name="phone" value="${sedto.mobilenum}" class="form-control" >
		</div>
	</div>
			<div class="form-group">
		<label class="col-sm-2 control-label">희망 대출액</label>
		<div class="col-sm-10">
			<input type="text" name="loan" class="form-control" >
		</div>
	</div>
	
		<div class="form-group">
		<label class="col-sm-2 control-label">상환 방법</label>
		<div class="col-sm-10">
			<input type="text" name="loan" class="form-control" >
		</div>
	</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">희망 대출기간</label>
		<div class="col-sm-10">
			<input type="text" name="loan" class="form-control" >
		</div>
	</div>

<input type="button" value="이자계산기" class="btn btn-success">
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