<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>대출신청 추가정보</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container">
		<div class="col-lg-12 col-md-8 col-sm-offset-2">
			<div class="col-xs-8">
	<h2>고객상세정보</h2>
	<hr>
	
	<div id="fund-form" class="box box-success">
	<div class="box-header"></div>
		<form action="loan_writePro.dj" method="post" class="form-horizontal">

			<input type="hidden" value="${br_sum}" name="br_sum"> <input
				type="hidden" value="${br_way}" name="br_way"> <input
				type="hidden" value="${br_term}" name="br_term">

			<div class="form-group">
				<label class="col-sm-4 control-label">대출 구분</label>
				<div class="col-sm-6">
					<select class="form-control" name="br_category">
						<option value="p">개인</option>
						<option value="b">사업자</option>
						<option value="r">부동산</option>
						<option value="c">매출담보</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">직장 구분</label>
				<div class="col-sm-6">
					<select class="form-control" name="br_work">
						<option>직장 구분을 선택해 주세요.</option>
						<option value="사업자">사업자</option>
						<option value="중소기업">중소기업</option>
						<option value="스타트업">스타트업</option>
						<option value="기타">기타</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">업종</label>
				<div class="col-sm-6">
					<select class="form-control" name="br_job">
						<option>업종을 선택해 주세요.</option>
						<option value="제조업">제조업</option>
						<option value="금융업">금융업</option>
						<option value="서비스업">서비스업</option>
						<option value="소프트웨어">소프트웨어</option>
						<option value="마케팅">마케팅</option>
						<option value="건설업">건설업</option>
						<option value="외식업">외식업</option>
						<option value="유통업">유통업</option>
						<option value="의약산업">의약산업</option>
						<option value="농림축산업">농림축산업</option>
						<option value="어업">어업</option>
						<option value="기타">기타</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">고용 형태</label>
				<div class="col-sm-6">
					<select class="form-control" name="br_employ">
						<option>고용 형태를 선택해 주세요.</option>
						<option value="정규직">정규직</option>
						<option value="계약직(비정규직)">계약직(비정규직)</option>
						<option value="프리랜서">프리랜서</option>
						<option value="기타">기타</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">연소득(세전)</label>
				<div class="col-sm-6">
				<div class="input-group">
					<input type="text" name="br_ycomein" class="form-control">
<div class="input-group-addon">만원</div>
</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">월 평균 소득</label>
				<div class="col-sm-6">
				<div class="input-group">
					<input type="text" name="br_mavg" class="form-control">
<div class="input-group-addon">만원</div>
</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">월 부채 상환액</label>
				<div class="col-sm-6">
				<div class="input-group">
					<input type="text" name="br_mrepay" class="form-control">
<div class="input-group-addon">만원</div>
</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">월 고정 지출비용</label>
				<div class="col-sm-6">
				<div class="input-group">
					<input type="text" name="br_mlockpay" class="form-control">
<div class="input-group-addon">만원</div>
</div>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-4 control-label">대출목적</label>
				<div class="col-sm-6">
					<textarea name="br_object" class="form-control" cols="50" rows="10"></textarea>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-4 control-label">희망 상환기간</label>
				<div class="col-sm-4">
					<select name="br_hopeday" class="form-control">
						<option value="1">매월 1일 상환</option>
						<option value="5">매월 5일 상환</option>
						<option value="10">매월 10일 상환</option>
						<option value="15">매월 15일 상환</option>
						<option value="20">매월 20일 상환</option>
						<option value="25">매월 25일 상환</option>
					</select>
					</div>
					<div class="col-sm-2">
					<input type="button" value="이자계산기" class="btn btn-sm bg-green" data-target="#loan-cal"  data-toggle="modal" >
				</div>
			</div>

			<hr>
			<div class="text-center">
			계속하시면 <a href="#">여신거래부속약관</a>에 동의하게 됩니다. 
			<input type="hidden" value="${memname}" name="memname"> 
				<input type="hidden" value="${membirth}" name="membirth"> 
				<input type="hidden" value="${mememail}" name="mememail"> 
				<input type="hidden" value="${memphone}" name="memphone"> 
			<div class="box-header">
				<input type="submit" value="대출신청" class="btn btn-lg bg-orange" name="loan-btn">
				</div>
			</div>
		</form>
	</div>
	
			</div>
		</div>
	</div>





	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>