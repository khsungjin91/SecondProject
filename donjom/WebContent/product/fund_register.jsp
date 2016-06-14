<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$("#addText")
									.click(
											function() {
												var textindex = $(
														"#textarray tr")
														.children().length;
												$("#textarray")
														.append(
																"<tr><td>"
																		+ "<textarea rows='10' cols='80' name='content["+textindex+"]'></textarea> <a href='#this' name='delete'>삭제</a>"
																		+ "</td></tr>");
												$("#textindex").val(textindex);
												$("a[name='delete']")
														.on(
																"click",
																function(e) {
																	e
																			.preventDefault();
																	fn_deleteText($(this));
																});
											});
						});

		$(document)
				.ready(
						function() {
							$("#filebutton")
									.click(
											function() {
												var fileindex = $(
														"#fileupload tr")
														.children().length;
												$("#fileupload")
														.append(
																"<tr><td>"
																		+ "<input type='file' name='upfile["+fileindex+"]'> <a href='#this' name='delete'>삭제</a>"
																		+ "</td></tr>");
												$("#fileindex").val(fileindex);
												$("a[name='delete']")
														.on(
																"click",
																function(e) {
																	e
																			.preventDefault();
																	fn_deleteText($(this));
																});
											});
						});

		function fn_deleteText(obj) {

			obj.parent().remove();
		}

		function calculrator(userinput) {

			var term = document.userinput.p_term.value;
			var sum = document.userinput.p_price.value;
			var rate = $("#rate").val();

			if (document.userinput.p_way.value == "1") {
				var total = parseInt(parseFloat(sum) * (parseFloat(rate / 12))
						/ 100);

				$("#p_avg").val(total);

			} else if (document.userinput.p_way.value == "0") {

				var total = parseInt(parseFloat(sum) / parseFloat(term))
						+ parseInt(parseFloat(sum) * (parseFloat(rate / 12))
								/ 100);

				$("#p_avg").val(total);

			}

		}
	</script>

	<jsp:include page="/WEB-INF/admin-slider.jsp" />
	<div class="container">
	
	<div class="box-header">
	 	<h3>상품올리기 작성 테이블</h3>
	 	</div>
	 <form action="registerPro.dj" method="post" enctype="multipart/form-data" name="userinput" class="form-horizontal">
			<input type="hidden" value="${no}" name="p_brno" class="form-control" />  	
	<div class="col-sm-4">
	<div class="box box-danger">
	 		<div class="box-body ">
	 		<dl >
	 			<dt>구분</dt>
	 			<dd><select name="p_category" class="form-control">
					<option value="${dto.br_category}">
						<c:if test="${dto.br_category == 'b'}">
						사업자(대출자희망)
						</c:if>
						<c:if test="${dto.br_category == 'p'}">
						개인(대출자희망)
						</c:if>
						<c:if test="${dto.br_category == 'r'}">
						부동산(대출자희망)
						</c:if>
						<c:if test="${dto.br_category == 'c'}">
						매출담보(대출자희망)
						</c:if>
							</option>
							<option value="b">사업자</option>
							<option value="p">개인</option>
							<option value="r">부동산</option>
							<option value="c">매출담보</option>
					</select></dd>
	 		<dt>만기</dt>
	 		<dd><div class="input-group">
						<input type="text" value="${dto.br_term}" name="p_term" class="form-control">
						<div class="input-group-addon">개월</div>
						</div></dd>
	 		<dt>수익율</dt>
	 		<dd><div class="input-group">
				<div class="input-group-addon">연</div>
				<input type="text" name="p_rate" id="rate" onkeyup="calculrator(this.target)" class="form-control">
				<div class="input-group-addon">%</div>
				</div></dd>
	 		
	 		<dt>대출금액</dt>
	 		<dd><div class="input-group">
			<input type="text" value="${dto.br_sum}" name="p_price"	id="p_price" class="form-control">
			<div class="input-group-addon">만원</div>
			</div></dd>
	 		<dt>상환방식</dt>
	 		<dd><select name="p_way" class="form-control">
							<option value="${dto.br_way}">
							<c:if test="${dto.br_way == '0'}">
							원리금 균등 상환(대출자희망)
							</c:if>
							<c:if test="${dto.br_way == '1'}">
							원금만기 일시상환(대출자희망)
							</c:if>
							</option>
							<option value="0">원리금 균등상환</option>
							<option value="1">원금만기 일시상환</option>
					</select></dd>
	 		<dt>월상환액</dt>
	 		<dd><div class="input-group">
			<input type="text" name="p_mrepay" id="p_avg" class="form-control">
			<div class="input-group-addon">만원</div>
			</div></dd>
	 		
	 		</dl>
	 		
	 		
	 		</div>
	 	</div>
	</div>
	 <div class="col-sm-8">
	 	<div class="box box-danger">
	 		<div class="box-body ">
			<dl>
				<dt>제목</dt>
				<dd><input type="text" name="p_name" class="form-control"></dd>
				<dt>대출목적</dt>
				<dd><input type="text" value="${dto.br_object}" name="p_purpose" class="form-control"></dd>
				<dt>DJ 평가 한마디</dt>
				<dd><div class="col-sm-10">
				<input type="text" name="" class="form-control">
				</div>
				<input type="button" value="내용추가" id="addText" class="btn btn-md bg-yellow"></dd>
				<dd><table id="textarray" class="table">
			</table></dd>
			
			<dd><input type="button" value="서류추가" id="filebutton" class="btn btn-block bg-yellow"></dd>
			<dd><table id="fileupload">
			</table></dd>
			<dt>상환일</dt>
			<dd><select name="p_repayday" class="form-control">
				<option value="${dto.br_hopeday}">
				매월${dto.br_hopeday}일 상환(대출자희망)</option>
				<option value="1">매월 1일 상환</option>
				<option value="5">매월 5일 상환</option>
				<option value="10">매월 10일 상환</option>
				<option value="15">매월 15일 상환</option>
				<option value="20">매월 20일 상환</option>
				<option value="25">매월 25일 상환</option>
			</select></dd>
			
			</dl>
			</div>
			<div class="text-center box-header">
			<input type="submit" value="펀딩시작" class="btn btn-lg bg-green "></div>
			</div>
			</div>
			<div>
				<input type="hidden" name="indexno" value="0" id="textindex">
				<input type="hidden" name="fileindex" value="0" id="fileindex">
			</div>
			<input type="hidden" name="br_category" value="${dto.br_category}">

		<input type="hidden" value="${dto.memno}" name="p_memeno">
			
		</form>
		
		</div>
	
</body>
</html>