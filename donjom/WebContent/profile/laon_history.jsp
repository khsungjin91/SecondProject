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
	  		 <li><h3>���⳻��</h3></li>
	  		</ol>
	  	</div>
	  	
<c:if test="${loancount == 0 }">
	<h2>���� ������ �����ϴ�.</h2>
</c:if>
<div class="text-center">
<i class="fa fa-hourglass-half fa-5x text-gray"></i>
	<h2>���� �ɻ簡 �������Դϴ�.</h2>
	</div>

<c:if test="${loancount == 0 }">

		<c:forEach var="list" items="${list}" varStatus="i">
			<input type="hidden" id="no${i.count}" name="no" value="${list.no}">
			<div style="width: 800px; height: 200px; border: 1px solid black;">
			<div>
			<div>������ �̸� : ${list.memname}</div>
			</div>
			<div>
			<div>���� ���� :${fn:substring(list.br_object,0,30)}...</div>
			<div>���� ���� : ${list.br_date}</div>
			</div>
			<table border="1">
			<tr>
			<td>��ȯ�����</td><td>��ȯȸ��</td><td>����ݾ�</td><td>�ɻ�</td>
			</tr>
			<tr>
			<td>�ſ�${list.br_hopeday}��</td><td>0ȸ/${list.br_term}ȸ</td><td>${list.br_sum}����</td>
			<td>
			<c:if test="${list.success == 'success'}">
			�ɻ�Ϸ�
			</c:if>
			<c:if test="${list.success == 'fail'}">
			�ɻ����
			</c:if>
			<c:if test="${list.success == 'none'}">
			�ɻ���
			</c:if>
			</td>
			</tr>
			</table>
			
			<input type="button" onclick="callAjax('${i.count}')" value="����̸�����">
			
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