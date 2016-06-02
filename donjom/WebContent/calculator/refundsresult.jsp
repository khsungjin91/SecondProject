<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td>회차</td>
		<td>상환일자</td>
		<td>상환금</td>
		<td>원금</td>
		<td>이자</td>
		<td>세금</td>
		<td>실수령액</td>
	</tr>
	<tr>
		<td>
			<table>
				<c:forEach var="count" items="${map.count}">
				<tr>
					<td>${count}
					</td>
				</tr>
				</c:forEach>
			</table>
		</td>
		<td>
			<table>
				<c:forEach var="repayday" items="${map.repayday}" >
				<tr>
					<td>${repayday}</td>
				</tr>
				</c:forEach>
			</table>
		</td>
		<td>
			<table>
				<c:forEach var="refunds" items="${map.refunds}">
				<tr>
					<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${refunds}" />원</td>
				</tr>
				</c:forEach>
			</table>
		</td>
		<td>
			<table>
				<c:forEach var="p_price" items="${map.p_price}">
				<tr>
					<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${p_price}" />원</td>
				</tr>
				</c:forEach>
			</table>
		</td>
		<td>
			<table>
				<c:forEach var="interested" items="${map.interested}">
				<tr>
					<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${interested}" />원</td>
				</tr>
				</c:forEach>
			</table>
		</td>
		<td>
			<table>
				<c:forEach var="taxed" items="${map.taxed}">
				<tr>
					<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${taxed}" />원</td>
				</tr>
				</c:forEach>
			</table>
		</td>
		<td>
			<table>
				<c:forEach var="realtotaled" items="${map.realtotaled}">
				<tr>
					<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${realtotaled}" />원</td>
				</tr>
				</c:forEach>
			</table>
		</td>
	</tr>	
	<tr>
	<td>합계</td>
	<td></td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.totaltotal}" />원</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.orgprice}" />원</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.interesttotal}" />원</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.taxtotal}" />원</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.supertotal}" />원</td>
	</tr>
</table>
	
	※ 회차별 상환플랜과 상환내역의 상환금은 오차가 있을 수 있습니다. (월별 이용 일수가 28, 29, 30, 31일로 변동 사항이 있기 때문) <br/>
	
	잔여상환원금 :
	<c:if test="${dto.i_success != 'overend' }">
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${garbige}" />
	원
	</c:if>
	<c:if test="${dto.i_success == 'overend' }">
	전액상환완료!
	</c:if>
	
</body>
</html>