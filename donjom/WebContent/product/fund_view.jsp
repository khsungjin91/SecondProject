<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Effort', 'Amount given'],
          ['My all',   1000],
        ]);

        var options = {
          colors : ['red','#000000'],
          pieHole: 0.8,
          pieSliceTextStyle: {
            color: 'black',
            fontSize : '20'
          },
          legend: 'none'
        };

        var chart = new google.visualization.PieChart(document.getElementById('donut_single'));
        chart.draw(data, options);
      }
 
function Check(){
	
var price = parseInt($("#p_price").val());
var invest = parseInt($("#p_invest").val());
var limit = parseInt($("#limit").val());
var mi = price - invest;
var amount = parseInt($("#amount").val());

if($("#no").val() == $("#p_memeno").val()){
	alert("대출자는 해당상품에 투자 불가합니다.");
	$("#amount").focus();
	return false;
}
if(!$("#amount").val()){
	alert("투자금액을 입력해 주세요");
	$("#amount").focus();
	return false;
}
if($("#amount").val() == '0'){
	alert("투자금액은 0이 될 수 없습니다.");
	$("#amount").focus();
	return false;
}
if(amount > limit){
	if(limit > mi){
		alert("최대 투자 가능 금액은"+mi+"만원 입니다.");
		$("#amount").focus();
		return false;
	}else{
		alert("최대 투자 가능 금액은"+limit+"만원 입니다.");
		$("#amount").focus();
		return false;
	}
}
if(amount > mi){
	alert("대출가능금액을 초과합니다 \n\n더 낮은 금액으로 투자해주세요.");
	$("#amount").focus();
	return false;
}

}
</script>


</head>
<body>
 <jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container">
		<div class="content-header">
			<h2>${dto.p_name}</h2>
		</div>
		
		<div class="content-body">
		<form action="fund_ready.dj" method="post" name="userinput">
			<input type="hidden" name="email" value="${email}">
			<div class="col-sm-12">
				<div class="box box-primary">
				<table class="table">
					<tr>
						<td>상품코드</td>
						<td>대출목적</td>
						<td>남은시간</td>
					</tr>
					<tr>
						<td>${dto.p_code}</td>
						<td>${dto.p_category}</td>
						<td>Time</td>
					</tr>
				</table>
			</div>
			<div class="row">
			<div class="col-sm-6">
			<div class="box box-success">
				<input type="hidden" value="${dto.p_code}" name="p_code" id="p_code">
				<input type="hidden" value="${dto.p_price}" name="p_price" id="p_price">
				<input type="hidden" value="${dto.p_invest}" name="p_invest" id="p_invest">
				<input type="hidden" value="${limit}" name="limit" id="limit">
				<input type="hidden" value="${no}" name="no" id="no">
				<input type="hidden" value="${dto.p_memeno}" name="p_memeno" id="p_memeno">
		
				대출신청내역
				<table class="table">
					<tr>
						<td>구분</td>
						<td>만기</td>
						<td>수익률</td>
						<td>대출금액</td>
						<td>상환방식</td>
						<td>월상환액</td>
					</tr>
					<tr>
						<td>${dto.p_category}</td>
						<td>${dto.p_term}개월</td>
						<td>${dto.p_rate}%</td>
						<td>${dto.p_price}만원</td>
						<td><c:if test="${dto.p_way == 0}">원리금 균등상환</c:if> 
						<c:if test="${dto.p_way == 1}">원금만기 일시상환</c:if></td>
						<td>${dto.p_mrepay}만원</td>
					</tr>
					<tr>
						<td colspan="6">대출목적</td>
					</tr>
					<tr>
						<td colspan="6">${dto.p_purpose}</td>
					</tr>
					<c:forEach var="conlist" items="${contentlist}">
						<tr>
							<td colspan="6">${conlist.p_content}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6"><c:forEach var="filelist" items="${filelist}">
								<a href="/donjom/file/${filelist.p_file}">${filelist.p_file}/</a>
							</c:forEach></td>
					</tr>

				</table>
				
			</div>
		
</div>
</div>
</div>
<!-- 그래프있는 오른쪽 메뉴 -->
			<div class="col-sm-4 ">
			<div class="box box-success">
				<ul class="list-unstyled">
					<li>
					<div id="donut_single" ></div>
					</li>
					<li>${dto.p_invest}만원/${dto.p_price}만원</li>
					<li>
					<label>투자자 인원수</label>
					<div>${dto.p_people}명</div>
					</li>
					<li>
					<label>상환방식</label>
					<div>
						<c:if test="${dto.p_way == 0}">
							<td>원리금 균등상환</td>
						</c:if>
						<c:if test="${dto.p_way == 1}">
							<td>원금만기 일시상환</td>
						</c:if>
						</div>
					</li>
					<tr>
						<td>수익률</td>
					</tr>
					<tr>
						<td>${dto.p_rate}%</td>
					</tr>
					<tr>
						<td>투자기간</td>
					</tr>
					<tr>
						<td>${dto.p_term}개월</td>
					</tr>
					<c:if
						test="${dto.p_success == 'doing' &&  check == 0 && When.When == 1}">
						<tr>
							<td>투자금액</td>
						</tr>
						<tr>
							<td><input type="text" name="amount" id="amount">만원</td>
						</tr>
					</c:if>
					<tr>
						<td>펀딩기간 : 1주일</td>
					</tr>
					<c:if
						test="${dto.p_success == 'doing' && check == 0 && When.When == 1}">
						<tr>
							<td>최대투자가능금액</td>
						</tr>
						<tr>
							<td>${limit}만원</td>
						</tr>
					</c:if>
					<tr>
						<td>상환일 : 매월${dto.p_repayday}일 + 5일</td>
					</tr>
					<tr>
						<c:if test="${dto.p_success == 'doing' && When.When == 0}">
							<c:if test="${dto.p_success == 'doing' && When.WhenTUS == 2}">
								<script type="text/javascript">
									$(document).ready(function() {
										window.setInterval('callAjax()', 1000); //3초마다한번씩 함수를 실행한다..!! 
									});
									function callAjax() {
										$.ajax({
											type : "post",
											url : "/donjom/timemelee.dj",
											data : {
												p_code : $('#p_code').val(),
											},
											success : test, // 페이지요청 성공시 실행 함수
											error : whenError
										//페이지요청 실패시 실행함수
										});
									}
									function test(aaa) { // 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
										$("#time").html(aaa);
									}
									function whenError() {
										alert("Error");
									}
								</script>

							</c:if>

							<td>
								<div id="time">펀딩개시는 수요일입니다.</div>
							</td>

						</c:if>


						<c:if test="${When.When == 1}">

							<c:if test="${dto.p_success == 'doing' && check == 0}">
								<td><input type="submit" value="투자미리보기"
									onclick="return Check()"></td>
							</c:if>

							<c:if test="${dto.p_success == 'doing' && check != 0}">
								<td><input type="button" value="투자완료"></td>
							</c:if>

						</c:if>

						<c:if
							test="${dto.p_success == 'success' || dto.p_success == 'refunds' || dto.p_success == 'overend' }">
							<td><input type="button" value="펀딩성공"></td>
						</c:if>

						<c:if test="${dto.p_success == 'fail'}">
							<td><input type="button" value="펀딩실패"></td>
						</c:if>

					</tr>

				</ul>
				</div>
			</div>
		</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>