<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>




</head>
<body>
 <jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container text-center">
		<div class="content-header"><h2>���� ����</h2></div>
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
								<td>16-D-0001</td>
								<td>���� ����</td>
								<td>Time</td>
							</tr>
						</table>
		
			
		<div class="col-xs-12 col-sm-9">
			<div class="box box-success">
			
		<div class="box-header">
				<h4>��������</h4>
				
				</div>
				
				
			</div>
		</div>
	</div>
<!-- �׷����ִ� ������ �޴� -->
			<div class="col-xs-12 col-sm-3 right hidden-xs ">
			<div class="box box-success">
				<ul class="list-unstyled ">
					<li>
					<div class="panel-body easypiechart-panel">
					<div class="easypiechart" id="easypiechart-blue" data-percent="<%-- ${dto.p_invest/dto.p_price*100} --%>92" >
					<span class="percent">92%</span>
						</div>
						</div><!-- �׷��� -->
					</li>
					<li>
					<h3 ><b class="text-green">����/������</b></h3>
					</li>
					
					<li>
					<div>0�� ���ڿϷ�</div>
					</li>
					
					<li><hr></li>
					
					<li><p class="title">��ȯ���</p>
					<div><p class="title-con">
						
							<td>������ �յ��ȯ</td>
						
							<td>���ݸ��� �Ͻû�ȯ</td>
					</p>
						</div>
					</li>
					
					<li><p class="title">���ͷ�</p>
					<p class="title-con">0%</p>
					</li>
					<li><p class="title">���ڱⰣ</p>
					<p class="title-con">0����</p></li>
					
					
						<li><p class="title">���ڱݾ�</p></li>
						<li><div class="input-group">
						<input type="text" name="amount" id="amount" class="form-control">
						<div class="input-group-addon">����</div>
						</div></li>
					
					
						<li><p class="title">�ݵ��Ⱓ : 1����</p><br/></li>
					
					
						<li><p class="title">�ִ����� ���ɱݾ� :</p>
					</div>
			</div>
		</form>
		</div>

	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
		
	<script src="bt/js/easypiechart.js"></script>
	<script src="bt/js/easypiechart-data.js"></script>

	
</body>
</html>