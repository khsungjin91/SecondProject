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
	if(confirm("���ڸ� ��� �Ͻðڽ��ϱ�?")){
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

  function callAjax(count){
	  coun = count;
      $.ajax({
	        type: "post",
	        url : "/donjom/calculStart.dj" ,
	        data: {	// url �������� ������ �Ķ����
	        	investmoney : $('#money'+count).val(),
	        	term : $('#term'+count).val(),
	        	way : $('#way'+count).val(),
	        	rate : $('#rate'+count).val(),
	        	p_code:$("#code"+count).val(),
	        	split : 1
	        },
	        success: test,// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
   	});    
  }
  
  function test(count){	
      $("#callback"+coun).html(count);
  }
  
  function whenError(){
      alert("Error");
  }
  
  function test2(a)
  {  $("#loanback"+coun2).html(a);}
  
  
  function refundsCall(count){
	  coun2 = count;

	  $.ajax({
		  type : "post",
		  url : "/donjom/refundsresult.dj",
		  data:{
			  p_code:$("#code"+count).val()	  
		  },
		  success: test2,
		  error: whenError
	  });

  }
  
</script>

<c:forEach var="list" items="${list}" varStatus="i">
<input type="hidden" id="money${i.count}" value="${list.i_invest}">
<input type="hidden" id="way${i.count}" value="${list.i_way}">
<input type="hidden" id="term${i.count}" value="${list.i_times}">
<input type="hidden" id="rate${i.count}" value="${list.i_profit}">
<input type="hidden" id="code${i.count}" value="${list.i_pcode}">
<div style="width: 800px; height: 200px; border: 1px solid black;">
<div>
<div>��ǰ�ڵ� : ${list.i_pcode}</div>
<div style="float: right;">��ȯ�Ⱓ : ����� ������</div>
</div>
<div>
<div>��ǰ �̸� : <a href="fundView.dj?p_code=${list.i_pcode}">${list.i_pname}</a></div>
<div>���� ���� : ${list.i_date}</div>
</div>
<table border="1">
<tr>
<td>��ȯ������</td><td>ȸ��</td><td>���ͷ�(��)</td><td>���ڱݾ�</td><td>�ݵ������Ȳ</td>
</tr>
<tr>
<td>�ſ�${list.i_repayday}��</td><td>${list.p_funding}ȸ/${list.i_times}ȸ</td><td>${list.i_profit}%</td><td>${list.i_invest}����</td>
<td>
<c:if test="${list.i_success == 'success'}">
�ݵ�����!
</c:if>
<c:if test="${list.i_success == 'refunds'}">
��ȯ��...
</c:if>
<c:if test="${list.i_success == 'overend'}">
��ȯ�Ϸ�
</c:if>
<c:if test="${list.i_success == 'doing'}">
�ݵ�������...
</c:if>
<c:if test="${list.i_success == 'fail'}">
�ݵ�����
</c:if>
</td>
</tr>
</table>


<input type="button" id="${list.no}" onclick="callAjax('${i.count}')" value="��ȯ�÷� ����">

<div><input type="button" id="refundHistory" value="��ȯ���� ����" onclick="refundsCall('${i.count}')"></div>

</div>
<div id="loanback${i.count}"></div>
<div id="callback${i.count}"></div>

<input type="button" value="�������" onclick="AreuSure('${list.i_pcode}')">
</c:forEach>



</body>
</html>