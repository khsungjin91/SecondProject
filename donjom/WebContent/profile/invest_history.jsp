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
	        data: {	// url �������� ������ �Ķ����
	        	investmoney : $('#money'+count).val(),
	        	term : $('#term'+count).val(),
	        	way : $('#way'+count).val(),
	        	rate : $('#rate'+count).val()
	        },
	        success: test,// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
   	});    
  }
  
  function test(count){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
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
<div>��ǰ�ڵ� : ${list.i_pcode}</div>
<div style="float: right;">��ȯ�Ⱓ : ����� ������</div>
</div>
<div>
<div>${list.i_pname}</div>
<div></div>
</div>
<table border="1">
<tr>
<td>��ȯ������</td><td>ȸ��</td><td>���ͷ�(��)</td><td>���ڱݾ�</td><td rowspan="1">�ݵ�������</td>
</tr>
<tr>
<td>�ſ�${list.i_repayday}��</td><td>0ȸ/${list.i_times}ȸ</td><td>${list.i_profit}%</td><td>${list.i_invest}����</td>
<td>
<c:if test="${list.i_success == 'success'}">
�ݵ�����!
</c:if>
<c:if test="${list.i_success == 'refunds'}">
��ȯ��...
</c:if>
<c:if test="${list.i_success == 'doing'}">
�ݵ�������...
</c:if>
</td>
</tr>
</table>


<input type="button" id="${list.no}" onclick="callAjax('${i.count}')" value="��ȯ�÷� ����">

<div><input type="button" id="refundHistory" value="��ȯ���� ����"></div>

</div>
<div id="callback${i.count}"></div>
</c:forEach>



</body>
</html>