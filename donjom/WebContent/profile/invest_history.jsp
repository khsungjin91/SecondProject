<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
</script>

<script>

var coun;
  function callAjax(count){
	  coun = count;
      $.ajax({
	        type: "post",
	        url : "/donjom/calculStart.dj" ,
	        data: {	// url 페이지도 전달할 파라미터
	        	investmoney : $('#money'+count).val(),
	        	term : $('#term'+count).val(),
	        	way : $('#way'+count).val(),
	        	rate : $('#rate'+count).val()
	        },
	        success: test,// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
   	});    
  }
  
  function test(count){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
      $("#callback"+coun).html(count);
      console.log(resdata);
  }
  
  function whenError(){
      alert("Error");
  }
</script>



<c:forEach var="list" items="${list}" varStatus="i">
<input type="hidden" id="money${i.count}" value="${list.i_invest}">
<input type="hidden" id="way${i.count}" value="${list.i_way}">
<input type="hidden" id="term${i.count}" value="${list.i_times}">
<input type="hidden" id="rate${i.count}" value="${list.i_profit}">
<div style="width: 800px; height: 200px; border: 1px solid black;">
<div>
<div>상품코드 : ${list.i_pcode}</div>
<div style="float: right;">상환기간 : 대출금 지급전</div>
</div>
<div>
<div>${list.i_pname}</div>
<div></div>
</div>
<table border="1">
<tr>
<td>상환예정일</td><td>회차</td><td>수익률(연)</td><td>투자금액</td><td rowspan="1">펀딩진행중</td>
</tr>
<tr>
<td>매월${list.i_repayday}일</td><td>0회/${list.i_times}회</td><td>${list.i_profit}%</td><td>${list.i_invest}만원</td>
<td>
<c:if test="${list.i_success == 'success'}">
펀딩성공!
</c:if>
<c:if test="${list.i_success == 'refunds'}">
상환중...
</c:if>
<c:if test="${list.i_success == 'doing'}">
펀딩진행중...
</c:if>
</td>
</tr>
</table>


<input type="button" id="${list.no}" onclick="callAjax('${i.count}')" value="상환플랜 보기">

<div><input type="button" id="refundHistory" value="상환내역 보기"></div>

</div>
<div id="callback${i.count}"></div>
</c:forEach>



</body>
</html>