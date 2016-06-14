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

			alert("약관에 동의를 하셔야 합니다.");
			return false;
		}
		
		if (mypoint < i_amount) {
			alert("투자금이 보유금액을 초과합니다. 충전해주세요");
			return false;
		}

	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp" />
	<div class="container">
		<h2 class="box-header text-center">투자 미리보기</h2>
		<div class="row">
			<div class="panel">
				<div class="box-body">
				<div class="box box-success ">
				
						<table class="table table-hover">
							<tr>
								<td>회차</td>
								<td>상환금</td>
								<td>납입원금</td>
								<td>이자</td>
								<td>수수료</td>
								<td>세금</td>
								<td>실수령액</td>
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
														maxFractionDigits="3" value="${refunds}" />원</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="p_price" items="${map.p_price}">
											<tr>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${p_price}" />원</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="interested" items="${map.interested}">
											<tr>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${interested}" />원</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="taxed" items="${map.taxed}">
											<tr>
												<td>0원</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="taxed" items="${map.taxed}">
											<tr>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${taxed}" />원</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<c:forEach var="realtotaled" items="${map.realtotaled}">
											<tr>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${realtotaled}" />원</td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
							<tr>
								<td>합계</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.totaltotal}" />원</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.orgprice}" />원</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.interesttotal}" />원</td>
								<td>0원</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.taxtotal}" />원</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${map.supertotal}" />원</td>
							</tr>
						</table></div>

					</div>
					<br /> <br />
					<div>
						※ 안내사항 <br /> 1. 세금 : 세법에 의거하여 이자소득에 대해 25%(이자소득세) + 2.5%(주민세) = 총
						27.5% 의 세금을 납부합니다. <br /> 2. 수수료 : 0% (베타기간 수수료 무료) <br /> 3. 여신업체
						: (주)DJ소셜대부 <br /> ※ 투자 위험 안내 <br /> 당사는 원금 및 수익을 보장하지 않습니다. 다만,
						채권 추심에 도의적 책임을 다합니다. <br /> 연체 시 연체이율 안내, 연체 시 불이익 안내에 최선을 다하며 장기
						연체시 채권 추심(매각 등)후 투자자에게 배분합니다. <br />
						<br />
					</div>

					${dto.p_repayday}개월 ${dto.p_way}, 연${dto.p_rate}수익률의 원리금수취권에
					${dto.p_price}을/를 참가합니다. <br />
					<form action="invest_start.dj" method="post" name="user">

						<input type="hidden" value="${amount}" name="i_invest" id="i_invest"> 
						<input type="hidden" value="${dto.p_code}" name="i_pcode"> 
						<input type="hidden" value="${dto.p_name}" name="i_pname"> 
						<input type="hidden" value="${mypoint}" name="point" id="point"> 
							<input type="checkbox" name="confirm" id="confirmed"> 투자이용약관 <a href="manager_investment.dj">[보기]</a> 에 동의하며,투자 위험을 확인하고 투자를 확정하겠습니다. <br />
						<br /> <input type="submit" value="투자하기" onclick="return whatmoney()">

					</form>
					</div>
					</div>
					</div>
</body>
</html>