<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/themes/fusioncharts.theme.fint.js?cacheBust=56"></script>
<script type="text/javascript">

FusionCharts.ready(function(){
    var fusioncharts = new FusionCharts({
    type: 'hled',
    renderAt: 'chart',
    width: '250',
    height: '100',
    dataFormat: 'json',
    dataSource: {
        "chart": {
            "lowerLimit": "0",
            "upperLimit": "100",
            "lowerLimitDisplay": "Empty",
            "upperLimitDisplay": "Full",
            "numberSuffix": "%",
            "origW": "200",
            "origH": "100",
            "theme": "fint"
        },
        //All annotations are grouped under this element
        "annotations": {
            "showbelow": "1",
        },
        "colorRange": {
            "color": [{
                "minValue": "0",
                "maxValue": "100",
                "code": "#68D168"
            }]
        },
        "value": "50"
    },
    "events": {
        "drawComplete": function(evt, arg) {
            var i,
                //Annotation
                annotations = evt.sender.annotations,
                //Value
                val = evt.sender.getData(),
                //Color Range Array
                crArr = evt.sender.args.dataSource.colorRange.color;

            for (i = crArr.length - 1; i >= 0; i--) {
                //When value falls within the color range
                if (val >= crArr[i].minValue && val <= crArr[i].maxValue) {
                    annotations.update('bgRectAngle', {
                        "fillColor": crArr[i].code
                    });
                }
            }

        }
    }

}
);
    fusioncharts.render();
});

FusionCharts.ready(function(){
	    var fusioncharts = new FusionCharts({
	    type: 'angulargauge',
	    renderAt: 'chart-container',
	    width: '250',
	    dataFormat: 'json',
	    dataSource: {
	        "chart": {
	            "lowerLimit": "0",
	            "upperLimit": "100",
	            "gaugeStartAngle": "90",
	            "gaugeEndAngle": "-630",
	            "theme": "fint"
	        },
	        "colorRange": {
	            "color": [{
	                "minValue": "0",
	                "maxValue": "100",
	                "code": "#ffffff"
	            }]
	        },
	        "dials": {
	            "dial": [{
	                "value": "50"
	            }]
	        }
	    }
	}
	);
	    fusioncharts.render();
	});
 
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
	<div class="container text-center">
		<div class="content-header"><h2>${dto.p_name}</h2></div>
			<form action="fund_ready.dj" method="post" name="userinput">
				<div class="content-body">
					<input type="hidden" name="email" value="${email}">
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
		
			
		<div class="col-xs-12 col-sm-9">
			<div class="box box-success">
				<input type="hidden" value="${dto.p_code}" name="p_code" id="p_code">
				<input type="hidden" value="${dto.p_price}" name="p_price" id="p_price">
				<input type="hidden" value="${dto.p_invest}" name="p_invest" id="p_invest">
				<input type="hidden" value="${limit}" name="limit" id="limit">
				<input type="hidden" value="${no}" name="no" id="no">
				<input type="hidden" value="${dto.p_memeno}" name="p_memeno" id="p_memeno">
		<div class="box-header">
				<h4>대출신청내역</h4>
				
				</div>
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
						<td >대출목적</td>
					</tr>
					<tr>
						<td colspan="6">${dto.p_purpose}</td>
					</tr>
					<c:forEach var="conlist" items="${contentlist}">
						<tr>
							<td colspan="6"><h3>컨텐츠</h3>${conlist.p_content}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6"><h3>서류</h3>
						<c:forEach var="filelist" items="${filelist}">
								<a href="/donjom/file/${filelist.p_file}">${filelist.p_file}/</a>
							</c:forEach></td>
					</tr>

				</table>
				
			</div>
		
</div>

</div>
<!-- 그래프있는 오른쪽 메뉴 -->
			<div class="col-xs-12 col-sm-3 right hidden-xs ">
			<div class="box box-success">
				<ul class="list-unstyled">
					<li>
					 <div id="chart-container"></div>
					  <div id="chart"></div>
					</li>
					<li>
					<h3 ><b class="text-green">${dto.p_invest}만원/${dto.p_price}만원</b></h3>
					</li>
					
					<li>
					<div>${dto.p_people}명 투자완료</div>
					</li>
					
					<li><hr></li>
					
					<li><p class="title">상환방식</p>
					<div><p class="title-con">
						<c:if test="${dto.p_way == 0}">
							<td>원리금 균등상환</td>
						</c:if>
						<c:if test="${dto.p_way == 1}">
							<td>원금만기 일시상환</td>
						</c:if></p>
						</div>
					</li>
					
					<li><p class="title">수익률</p>
					<p class="title-con">${dto.p_rate}%</p>
					</li>
					<li><p class="title">투자기간</p>
					<p class="title-con">${dto.p_term}개월</p></li>
					
					<c:if test="${dto.p_success == 'doing' &&  check == 0 && When.When == 1}">
						<li><p class="title">투자금액</p></li>
						<li><div class="input-group">
						<input type="text" name="amount" id="amount" class="form-control">
						<div class="input-group-addon">만원</div>
						</div></li>
					</c:if>
					
						<li><p class="title">펀딩기간 : 1주일</p><br/></li>
					
					<c:if test="${dto.p_success == 'doing' && check == 0 && When.When == 1}">
						<li><p class="title">최대투자 가능금액 :</p>
						<span class="text-green"> ${limit}</span>만원</li><br/>
					</c:if>
					<li><p>상환일 : 매월${dto.p_repayday}일 + 5일</p></li>
					
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
								<li><input type="submit" value="투자미리보기" class="btn btn-lg bg-green"	onclick="return Check()"></li>
							</c:if>

							<c:if test="${dto.p_success == 'doing' && check != 0}">
								<li><input type="button" value="투자완료" class="btn btn-lg bg-red"></li>
							</c:if>

						</c:if>

						<c:if
							test="${dto.p_success == 'success' || dto.p_success == 'refunds' || dto.p_success == 'overend' }">
							<li><input type="button" value="펀딩성공" class="btn btn-lg bg-green"></li>
						</c:if>

						<c:if test="${dto.p_success == 'fail'}">
							<li><input type="button" value="펀딩실패" class="btn btn-lg bg-red"></li>
						</c:if>
</ul>
				</div>
			</div>
		</form>
		</div>

	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>