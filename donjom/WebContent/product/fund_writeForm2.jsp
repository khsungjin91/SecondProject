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
 	<title>대출신청 추가정보</title>
</head>
<body>
<h2>고객상세정보</h2>
<div id="fund-form">
<form action="loan_writPro.dj" method="post" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label">대출 구분</label>
			<div class="col-sm-7">
				<select class="form-control" name="part">
					<option>개인</option>
					<option>사업자</option>
					<option>부동산</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">직장 구분</label>
			<div class="col-sm-7">
				<select class="form-control" name="part">
					<option>직장 구분을 선택해 주세요.</option>
					<option>사업자</option>
					<option>중소기업</option>
					<option>스타트업</option>
					<option>기타</option>
				</select>
			</div>
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">업종</label>
		<div class="col-sm-7">
			<select class="form-control" name="part">
				<option>업종을 선택해 주세요.</option>
				<option>제조업</option>
				<option>금융업</option>
				<option>서비스업</option>
				<option>소프트웨어</option>
				<option>마케팅</option>
				<option>건설업</option>
				<option>외식업</option>
				<option>유통업</option>
				<option>의약산업</option>
				<option>농림축산업</option>
				<option>어업</option>
				<option>기타</option>
			</select>
		</div>
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">고용 형태</label>
		<div class="col-sm-7">
			<select class="form-control" name="part">
				<option>고용 형태를 선택해 주세요.</option>
				<option>정규직</option>
				<option>계약직(비정규직)</option>
				<option>프리랜서</option>
				<option>기타</option>
			</select>
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">연소득(세전)</label>
		<div class="col-sm-8">
			<input type="text" name="loan" class="form-control" >만원
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">월 평균 소득</label>
		<div class="col-sm-8">
			<input type="text" name="loan" class="form-control" >만원
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">월 부채 상환액</label>
		<div class="col-sm-8">
			<input type="text" name="loan" class="form-control" >만원
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label">월 고정 비용</label>
		<div class="col-sm-8">
			<input type="text" name="loan" class="form-control" >만원
		</div>
		</div>
		
		
		<div class="form-group">
		<label class="col-sm-2 control-label">대출목적</label>
		<div class="col-sm-8">
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
</div>






<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>