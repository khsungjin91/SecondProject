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
<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>
						ȯ�� �ϱ� 
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">ȯ�� �ϱ�</li>
					</ol>
				</div>
			</div>
		</div>
		<hr>
	</div>
<div class="container">
	
	<div>${dto.p_name}(${dto.p_code}) </div>
	<div>ȯ�޹��� �ο��� (${dto.p_people} ��)</div>
	<div> ȯ�޹�� : 
		<c:if test="${dto.p_way eq '0'}">
			������ �յ��ȯ
		</c:if>
	
		<c:if test="${dto.p_way eq '1'}">
			���ݸ��� �Ͻû�ȯ
		</c:if>
	</div>

<div>������ ����</div>
<form action="refunds_money.dj" method="post">
<input type="hidden" name="p_code" value="${dto.p_code}">
<table style="float: left" class="table table-bordered table-responsive table-hover">
	<tr>
		<td>�̸���</td>
		<td>����</td>
		<td>���� �ݾ�</td>
		<td>���� �ð�</td>
		<td>�������</td>
	</tr>
		<c:forEach var="list" items="${list}" varStatus="i">
	<tr>
		<td><input type="text" name="email${i.count-1}" value="${list.email}" disabled="disabled"></td>
		<td>${list.i_memname}</td>
		<td>${list.i_invest}����</td>
		<td>${list.i_date}</td>
		<td>${list.randomacc}</td>
	</tr> 
		</c:forEach>
</table>

<table class="table table-bordered table-responsive table-hover">
		<tr>
			<td>ȯ�ޱݾ�</td>
		</tr>
	<c:forEach var="total" items="${total}" varStatus="i">
		<tr>
			<td><input type="text" name="total${i.count-1}" value="${total}" disabled="disabled" size="10">�� </td>
		</tr> 
	</c:forEach>
</table>

<input type="submit" value="ȯ���ϱ�">
</form>
</div>

</body>
</html>