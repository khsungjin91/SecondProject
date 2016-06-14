<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">


 
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
 <jsp:include page="/WEB-INF/header.jsp"/>
	<div class="container text-center">
		<div class="content-header"><h2>${dto.p_name}</h2></div>
			<form action="fund_ready.dj" method="post" name="userinput">
				<div class="content-body">
					<input type="hidden" name="email" value="${email}">
						<table class="table">
							<tr>
								<td>��ǰ�ڵ�</td>
								<td>�������</td>
								<td>�����ð�</td>
							</tr>
							<tr>
								<td>${dto.p_code}</td>
								<td><c:if test="${dto.p_category == 'b'}">�����</c:if> 
						<c:if test="${dto.p_category == 'c'}">����㺸</c:if> 
						<c:if test="${dto.p_category == 'p'}">����</c:if> 
						<c:if test="${dto.p_category == 'r'}">�ε���</c:if></td>
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
				<h4>�����û����</h4>
				
				</div>
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
						<td >�������</td>
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
						<td colspan="6"><h3>����</h3>
						<c:forEach var="filelist" items="${filelist}">
								<div style="float: left;"><a href="/donjom/file/${filelist.p_file}">
								<img src="/donjom/file/${filelist.p_file}" style="margin-left: 50px" width="150" height="200"/></a></div>
						</c:forEach></td>
						
					</tr>
				</table>
			</div>
		
</div>

</div>
<!-- �׷����ִ� ������ �޴� -->
			<div class="col-xs-12 col-sm-3 right hidden-xs ">
			<div class="box box-success">
				<ul class="list-unstyled">
					<li>
						<div class="panel-body easypiechart-panel">
					<div class="easypiechart" id="easypiechart-blue" data-percent="${dto.p_invest/dto.p_price*100}" >
					<span class="percent"><fmt:formatNumber value="${dto.p_invest/dto.p_price*100}" pattern="##" />%</span>
						</div>
						</div><!-- �׷��� -->
					</li>
					<li>
					<h3 ><b class="text-green">${dto.p_invest}����/${dto.p_price}����</b></h3>
					</li>
					
					<li>
					<div>${dto.p_people}�� ���ڿϷ�</div>
					</li>
					
					<li><hr></li>
					
					<li><p class="title">��ȯ���</p>
					<div><p class="title-con">
						<c:if test="${dto.p_way == 0}">
							<td>������ �յ��ȯ</td>
						</c:if>
						<c:if test="${dto.p_way == 1}">
							<td>���ݸ��� �Ͻû�ȯ</td>
						</c:if></p>
						</div>
					</li>
					
					<li><p class="title">���ͷ�</p>
					<p class="title-con">${dto.p_rate}%</p>
					</li>
					<li><p class="title">���ڱⰣ</p>
					<p class="title-con">${dto.p_term}����</p></li>
					
					<c:if test="${dto.p_success == 'doing' &&  check == 0 && When.When == 1}">
						<li><p class="title">���ڱݾ�</p></li>
						<li><div class="input-group">
						<input type="text" name="amount" id="amount" class="form-control">
						<div class="input-group-addon">����</div>
						</div></li>
					</c:if>
					
						<li><p class="title">�ݵ��Ⱓ : 1����</p><br/></li>
					
					<c:if test="${dto.p_success == 'doing' && check == 0 && When.When == 1}">
						<li><p class="title">�ִ����� ���ɱݾ� :</p>
						<span class="text-green"> ${limit}</span>����</li><br/>
					</c:if>
					<li><p>��ȯ�� : �ſ�${dto.p_repayday}�� + 5��</p></li>
					
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
								<li><input type="submit" value="���ڹ̸�����" class="btn btn-lg bg-green"	onclick="return Check()"></li>
							</c:if>

							<c:if test="${dto.p_success == 'doing' && check != 0}">
								<li><input type="button" value="���ڿϷ�" class="btn btn-lg bg-red"></li>
							</c:if>

						</c:if>

						<c:if
							test="${dto.p_success == 'success' || dto.p_success == 'refunds' || dto.p_success == 'overend' }">
							<li><input type="button" value="�ݵ�����" class="btn btn-lg bg-green"></li>
						</c:if>

						<c:if test="${dto.p_success == 'fail'}">
							<li><input type="button" value="�ݵ�����" class="btn btn-lg bg-red"></li>
						</c:if>
</ul>
				</div>
			</div>
		</form>
		</div>

	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	<script src="bt/js/easypiechart.js"></script>
	<script src="bt/js/easypiechart-data.js"></script>
</body>
</html>