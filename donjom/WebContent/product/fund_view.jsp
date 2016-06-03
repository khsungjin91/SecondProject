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
	alert("�����ڴ� �ش��ǰ�� ���� �Ұ��մϴ�.");
	$("#amount").focus();
	return false;
}
if(!$("#amount").val()){
	alert("���ڱݾ��� �Է��� �ּ���");
	$("#amount").focus();
	return false;
}
if($("#amount").val() == '0'){
	alert("���ڱݾ��� 0�� �� �� �����ϴ�.");
	$("#amount").focus();
	return false;
}
if(amount > limit){
	if(limit > mi){
		alert("�ִ� ���� ���� �ݾ���"+mi+"���� �Դϴ�.");
		$("#amount").focus();
		return false;
	}else{
		alert("�ִ� ���� ���� �ݾ���"+limit+"���� �Դϴ�.");
		$("#amount").focus();
		return false;
	}
}
if(amount > mi){
	alert("���Ⱑ�ɱݾ��� �ʰ��մϴ� \n\n�� ���� �ݾ����� �������ּ���.");
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
						<td>��ǰ�ڵ�</td>
						<td>�������</td>
						<td>�����ð�</td>
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
		
				�����û����
				<table class="table">
					<tr>
						<td>����</td>
						<td>����</td>
						<td>���ͷ�</td>
						<td>����ݾ�</td>
						<td>��ȯ���</td>
						<td>����ȯ��</td>
					</tr>
					<tr>
						<td>${dto.p_category}</td>
						<td>${dto.p_term}����</td>
						<td>${dto.p_rate}%</td>
						<td>${dto.p_price}����</td>
						<td><c:if test="${dto.p_way == 0}">������ �յ��ȯ</c:if> 
						<c:if test="${dto.p_way == 1}">���ݸ��� �Ͻû�ȯ</c:if></td>
						<td>${dto.p_mrepay}����</td>
					</tr>
					<tr>
						<td colspan="6">�������</td>
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
<!-- �׷����ִ� ������ �޴� -->
			<div class="col-sm-4 ">
			<div class="box box-success">
				<ul class="list-unstyled">
					<li>
					<div id="donut_single" ></div>
					</li>
					<li>${dto.p_invest}����/${dto.p_price}����</li>
					<li>
					<label>������ �ο���</label>
					<div>${dto.p_people}��</div>
					</li>
					<li>
					<label>��ȯ���</label>
					<div>
						<c:if test="${dto.p_way == 0}">
							<td>������ �յ��ȯ</td>
						</c:if>
						<c:if test="${dto.p_way == 1}">
							<td>���ݸ��� �Ͻû�ȯ</td>
						</c:if>
						</div>
					</li>
					<tr>
						<td>���ͷ�</td>
					</tr>
					<tr>
						<td>${dto.p_rate}%</td>
					</tr>
					<tr>
						<td>���ڱⰣ</td>
					</tr>
					<tr>
						<td>${dto.p_term}����</td>
					</tr>
					<c:if
						test="${dto.p_success == 'doing' &&  check == 0 && When.When == 1}">
						<tr>
							<td>���ڱݾ�</td>
						</tr>
						<tr>
							<td><input type="text" name="amount" id="amount">����</td>
						</tr>
					</c:if>
					<tr>
						<td>�ݵ��Ⱓ : 1����</td>
					</tr>
					<c:if
						test="${dto.p_success == 'doing' && check == 0 && When.When == 1}">
						<tr>
							<td>�ִ����ڰ��ɱݾ�</td>
						</tr>
						<tr>
							<td>${limit}����</td>
						</tr>
					</c:if>
					<tr>
						<td>��ȯ�� : �ſ�${dto.p_repayday}�� + 5��</td>
					</tr>
					<tr>
						<c:if test="${dto.p_success == 'doing' && When.When == 0}">
							<c:if test="${dto.p_success == 'doing' && When.WhenTUS == 2}">
								<script type="text/javascript">
									$(document).ready(function() {
										window.setInterval('callAjax()', 1000); //3�ʸ����ѹ��� �Լ��� �����Ѵ�..!! 
									});
									function callAjax() {
										$.ajax({
											type : "post",
											url : "/donjom/timemelee.dj",
											data : {
												p_code : $('#p_code').val(),
											},
											success : test, // ��������û ������ ���� �Լ�
											error : whenError
										//��������û ���н� �����Լ�
										});
									}
									function test(aaa) { // ��û������ ������������ aaa ������ �ݹ�ȴ�. 
										$("#time").html(aaa);
									}
									function whenError() {
										alert("Error");
									}
								</script>

							</c:if>

							<td>
								<div id="time">�ݵ����ô� �������Դϴ�.</div>
							</td>

						</c:if>


						<c:if test="${When.When == 1}">

							<c:if test="${dto.p_success == 'doing' && check == 0}">
								<td><input type="submit" value="���ڹ̸�����"
									onclick="return Check()"></td>
							</c:if>

							<c:if test="${dto.p_success == 'doing' && check != 0}">
								<td><input type="button" value="���ڿϷ�"></td>
							</c:if>

						</c:if>

						<c:if
							test="${dto.p_success == 'success' || dto.p_success == 'refunds' || dto.p_success == 'overend' }">
							<td><input type="button" value="�ݵ�����"></td>
						</c:if>

						<c:if test="${dto.p_success == 'fail'}">
							<td><input type="button" value="�ݵ�����"></td>
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