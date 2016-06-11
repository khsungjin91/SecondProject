<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

var coun;
var coun2;

  function callAjax(count){
	  coun = count;
      $.ajax({
	        type: "post",
	        url : "/donjom/loanBack.dj" ,
	        data :{
	        	br_no : $("#no"+count).val()
	        },
	        success: test,
	        error: whenError	
   	});    
  }
  
  function test(count){	
      $("#callback"+coun).html(count);
  }
  
  function whenError(){
      alert("Error");
  }

</script>
</head>
<body>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<div class="warpper dash-body">
		<div class="container">
<jsp:include page="/WEB-INF/settingside.jsp"></jsp:include>
	<div class="col-xs-12 col-sm-9 contetns-warp right">
		<div class="panel-heading">
	  		<ol class="breadcrumb contents-menu hidden-xs">
	  		 <li><h3>대출내역</h3></li>
	  		</ol>
	  	</div>
	  	
<c:if test="${loancount == 0 }">
	<h2>대출 내역이 없습니다.</h2>
</c:if>
<div class="text-center">
<i class="fa fa-hourglass-half fa-5x text-gray"></i>
	<h2>대출 심사가 진행중입니다.</h2>
	</div>

<c:if test="${loancount == 0 }">

		<c:forEach var="list" items="${list}" varStatus="i">
			<input type="hidden" id="no${i.count}" name="no" value="${list.no}">
			<div style="width: 800px; height: 200px; border: 1px solid black;">
			<div>
			<div>대출자 이름 : ${list.memname}</div>
			</div>
			<div>
			<div>대출 목적 :${fn:substring(list.br_object,0,30)}...</div>
			<div>대출 일자 : ${list.br_date}</div>
			</div>
			<table border="1">
			<tr>
			<td>상환희망일</td><td>상환회차</td><td>대출금액</td><td>심사</td>
			</tr>
			<tr>
			<td>매월${list.br_hopeday}일</td><td>0회/${list.br_term}회</td><td>${list.br_sum}만원</td>
			<td>
			<c:if test="${list.success == 'success'}">
			심사완료
			</c:if>
			<c:if test="${list.success == 'fail'}">
			심사실패
			</c:if>
			<c:if test="${list.success == 'none'}">
			심사중
			</c:if>
			</td>
			</tr>
			</table>
			
			<input type="button" onclick="callAjax('${i.count}')" value="대출미리보기">
			
			</div>
			
			<div id="callback${i.count}"></div>
		</c:forEach>
</c:if>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/footer.jsp"/>
</body>
</html>