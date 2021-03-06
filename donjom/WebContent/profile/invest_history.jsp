<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

function AreuSure(code){
	if(confirm("투자를 취소 하시겠습니까?")){
		window.location="fund_investcancle.dj?code="+code;
	}else{
		self.close;
	}
	
}
</script>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

var coun;
var coun2;

  function callplan(count){
	  coun = count;
      $.ajax({
	        type: "post",
	        url : "/donjom/calculStart.dj" ,
	        data: {	// url 페이지도 전달할 파라미터
	        	investmoney : $('#money'+count).val(),
	        	term : $('#term'+count).val(),
	        	way : $('#way'+count).val(),
	        	rate : $('#rate'+count).val(),
	        	p_code:$("#code"+count).val(),
	        	split : 1
	        },
	        success:   function plan(count){	$("#callplan"+coun).html(count);},
	        error: whenError	//페이지요청 실패시 실행함수
   	});    
  }
  
  function whenError(){
      alert("Error");
  }
  
  
  function refundsCall(count){
	  coun2 = count;

	  $.ajax({
		  type : "post",
		  url : "/donjom/refundsresult.dj",
		  data:{
			  p_code:$("#code"+count).val()	  
		  },
		  success:   function test2(a){  $("#loanback"+coun2).html(a);},
		  error: whenError
	  });

  }
  
</script>

<jsp:include page="/WEB-INF/header.jsp"/>

	<div class="warpper dash-body">
		<div class="container">
<jsp:include page="/WEB-INF/settingside.jsp"/>
	<div class="col-xs-12 col-sm-9 contetns-warp right">
		<div class="panel-heading">
	  		<ol class="breadcrumb contents-menu hidden-xs">
	  		 <li><h3>투자내역</h3></li>
	  		</ol>
	  	</div>
<c:if test="${investcount == 0 }">
<h2>투자 내역이 없습니다.</h2>
</c:if>

<c:if test="${investcount != 0 }">
<c:forEach var="list" items="${list}" varStatus="i">
<input type="hidden" id="money${i.count}" value="${list.i_invest}">
<input type="hidden" id="way${i.count}" value="${list.i_way}">
<input type="hidden" id="term${i.count}" value="${list.i_times}">
<input type="hidden" id="rate${i.count}" value="${list.i_profit}">
<input type="hidden" id="code${i.count}" value="${list.i_pcode}">
<div style="width: 800px; height: 200px;">
<div>
	<div>상품코드 : ${list.i_pcode}</div>
	<div style="float: right;">상환기간 : 대출금 지급전</div>
</div>
<div>
	<div>상품 이름 : <a href="fundView.dj?p_code=${list.i_pcode}">${list.i_pname}</a></div>
	<div>투자 일자 : ${list.i_date}</div>
</div>
		<table class="table table-bordered table-responsive table-hover">
			<tr>
				<td>상환예정일</td>
				<td>회차</td>
				<td>수익률(연)</td>
				<td>투자금액</td>
				<td>펀딩진행상황</td>
			</tr>
			<tr>
				<td>매월${list.i_repayday}일</td>
				<td>${list.p_funding}회/${list.i_times}회</td>
				<td>${list.i_profit}%</td>
				<td>${list.i_invest}만원</td>
				<td>
				<c:if test="${list.i_success == 'success'}">
				펀딩성공!
				</c:if>
				<c:if test="${list.i_success == 'refunds'}">
				상환중...
				</c:if>
				<c:if test="${list.i_success == 'overend'}">
				상환완료
				</c:if>
				<c:if test="${list.i_success == 'doing'}">
				펀딩진행중...
				</c:if>
				<c:if test="${list.i_success == 'fail'}">
				펀딩실패
				</c:if>
				</td>
			</tr>
		</table>


<input type="button" id="${list.no}" onclick="callplan('${i.count}')" value="상환플랜 보기">

<div><input type="button" id="refundHistory" value="상환내역 보기" onclick="refundsCall('${i.count}')"></div>

</div>
<div id="loanback${i.count}"></div>
<div id="callplan${i.count}"></div>

<input type="button" value="투자취소" onclick="AreuSure('${list.i_pcode}')">
</c:forEach>
</c:if>
		</div>
	</div>	
</div>
	<jsp:include page="/WEB-INF/footer.jsp"/>
</body>
</html>