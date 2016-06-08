<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<title>회사 정보 변경</title>
</head>
<body>

<div class="col-sm-12 col-sm-6 ">
	<div class="row">
	<form action="manager_companyPro.dj" method="post" class="form-horizontal">
	
			<div class="form-group">
				<label class="col-sm-4 control-label">회사 명 :</label>
				<div class="col-sm-10 col-sm-6">
					<input type="text" name="company" value="${list.company}" class="form-control">
				</div>
			</div>
			<div class="form-group">
					<label class="col-sm-4 control-label">대표이사 : </label>
				<div class="col-sm-10 col-sm-6">
					<input type="text" name="ceo" value="${list.ceo}" class="form-control"> 
				</div>
			</div>
	<div class="form-group">
					<label class="col-sm-4 control-label">사업자등록번호 :</label>
					<div class="col-sm-10 col-sm-6">
					 <input type="text" name="licensee"value="${list.licensee}" class="form-control">
		</div>
	</div>
	<div class="form-group">
					<label class="col-sm-4 control-label">주소 :	</label>
					<div class="col-sm-10 col-sm-6">
					<input type="text" name="address"value="${list.address}" class="form-control"> </div></div>
	<div class="form-group">
					<label class="col-sm-4 control-label">회사대표번호 :</label> 
					<div class="col-sm-10 col-sm-6">
					<input type="text" name="companynum"value="${list.companynum}" class="form-control"></div></div>
	<div class="form-group">
					<label class="col-sm-4 control-label">팩스 번호 : </label>
					<div class="col-sm-10 col-sm-6">
					<input type="text" name="fax"value="${list.fax}" class="form-control"> </div></div>
	<div class="form-group">
					<label class="col-sm-4 control-label">이메일 : 	</label>
					<div class="col-sm-10 col-sm-6">
					<input type="text" name="email"value="${list.email}" class="form-control"> </div></div>
	<br/>
	<div class="form-group">
					<label class="col-sm-4 control-label">대출 금리 :</label>
					
					 최고 <input type="text" name="max"value="${list.max}"> <br/>
		(연체금리 최고  <input type="text" name="overdue"value="${list.overdue}">) 
		과도한 빚, 개고생의 시작입니다. <p/>
		</div>
		<hr>
		<div class="text-center">
		이자 외 별도로 중계수수료를 수취하는 것은 불법입니다. <br/>
		취급수수료등 기타 부대비용 없습니다.
		<br/>
		2016 DonJom Inc.
		</div>
	
	<hr>
	<div class="col-sm-12 col-sm-8 col-sm-offset-4">
	<input type="submit" value="저장" class="btn btn-success btn-lg">
	<input type="button" name="modify" value="수정"onclick="javascript:location.href='manager_companyModify.dj'"
	class="btn btn-default btn-lg">
	<input type="reset" value="취소" onclick="javascript:location.href='manager_page.dj'" class="btn btn-default btn-lg"> 
		</div>
		
	</form>
	</div>
</div>

	</body>
</html>