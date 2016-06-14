<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function whatmoney() {

		var checkbox = document.user;
		var i_amount = parseInt($("#i_invest").val()+'0000');
		var mypoint = parseInt($("#point").val());

		if (!$("#confirmed").is(":checked")) {

			alert("����� ���Ǹ� �ϼž� �մϴ�.");
			return false;
		}
		
		if (mypoint < i_amount) {
			alert("���ڱ��� �����ݾ��� �ʰ��մϴ�. �������ּ���");
			return false;
		}

	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp" />
	<div class="container">
		<h2 class="box-header text-center">���� �̸�����</h2>
		<div class="row">
			<div class="panel">
				<div class="box-body">
				<div class="box box-success ">
				
						<table class="table table-hover">
							<tr>
								<td>ȸ��</td>
								<td>��ȯ��</td>
								<td>���Կ���</td>
								<td>����</td>
								<td>������</td>
								<td>����</td>
								<td>�Ǽ��ɾ�</td>
							</tr>
							<tr>
								<td>
									<table>
										<c:forEach var="count" items="${map.count}">
											<tr>
												<td>${count}</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="refunds" items="${map.refunds}">
											<tr>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${refunds}" />��</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="p_price" items="${map.p_price}">
											<tr>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${p_price}" />��</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="interested" items="${map.interested}">
											<tr>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${interested}" />��</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="taxed" items="${map.taxed}">
											<tr>
												<td>0��</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="taxed" items="${map.taxed}">
											<tr>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${taxed}" />��</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="realtotaled" items="${map.realtotaled}">
											<tr>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${realtotaled}" />��</td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
							<tr>
								<td>�հ�</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.totaltotal}" />��</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.orgprice}" />��</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.interesttotal}" />��</td>
								<td>0��</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.taxtotal}" />��</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.supertotal}" />��</td>
							</tr>
						</table></div>

					</div>
					<br /> <br />
					<div>
						�� �ȳ����� <br /> 1. ���� : ������ �ǰ��Ͽ� ���ڼҵ濡 ���� 25%(���ڼҵ漼) + 2.5%(�ֹμ�) = ��
						27.5% �� ������ �����մϴ�. <br /> 2. ������ : 0% (��Ÿ�Ⱓ ������ ����) <br /> 3. ���ž�ü
						: (��)DJ�Ҽȴ�� <br /> �� ���� ���� �ȳ� <br /> ���� ���� �� ������ �������� �ʽ��ϴ�. �ٸ�,
						ä�� �߽ɿ� ������ å���� ���մϴ�. <br /> ��ü �� ��ü���� �ȳ�, ��ü �� ������ �ȳ��� �ּ��� ���ϸ� ���
						��ü�� ä�� �߽�(�Ű� ��)�� �����ڿ��� ����մϴ�. <br />
						<br />
					</div>

					${dto.p_repayday}���� ${dto.p_way}, ��${dto.p_rate}���ͷ��� �����ݼ���ǿ�
					${dto.p_price}��/�� �����մϴ�. <br />
					<form action="invest_start.dj" method="post" name="user">

						<input type="hidden" value="${amount}" name="i_invest" id="i_invest"> 
						<input type="hidden" value="${dto.p_code}" name="i_pcode"> 
						<input type="hidden" value="${dto.p_name}" name="i_pname"> 
						<input type="hidden" value="${mypoint}" name="point" id="point"> 
							<input type="checkbox" name="confirm" id="confirmed"> �����̿��� <a href="manager_investment.dj">[����]</a> �� �����ϸ�,���� ������ Ȯ���ϰ� ���ڸ� Ȯ���ϰڽ��ϴ�. <br />
						<br /> <input type="submit" value="�����ϱ�" onclick="return whatmoney()">

					</form>
					</div>
					</div>
					</div>
</body>
</html>