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


<h2>${dto.p_name}</h2>

<form action="fund_ready.dj" method="post">
<div style="float: left;">
<table border="1">
<tr>
<td>상품코드</td><td>대출목적</td><td>남은시간</td>
</tr>
<tr>
<td>${dto.p_code}</td><td>${dto.p_category}</td><td>Time</td>
</tr>
</table>

<input type="hidden" value="${dto.p_code}" name="p_code">

대출신청내역
<table border="1">
<tr>
<td>구분</td><td>만기</td><td>수익률</td><td>대출금액</td><td>상환방식</td><td>월상환액</td>
</tr>
<tr>
<td>${dto.p_category}</td><td>${dto.p_term}</td><td>${dto.p_rate}</td><td>${dto.p_price}</td><td>${dto.p_way}</td><td>${dto.p_mrepay}</td>
</tr>
<tr>
<td colspan="6">대출목적</td>
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
<td colspan="6">
<c:forEach var="filelist" items="${filelist}">
<a href="/donjom/file/${filelist.p_file}">${filelist.p_file}/</a>
</c:forEach>
</td>
</tr>

</table>
</div>


<div style="float: left;">
<table border="1">
<tr><td>${dto.p_invest}만원/${dto.p_price}만원</td></tr>
<tr><td>투자자 인원수</td></tr>
<tr><td>${dto.p_people}명</td></tr>
<tr><td>상환방식</td></tr>
<tr><td>${dto.p_way}</td></tr>
<tr><td>수익률</td></tr>
<tr><td>${dto.p_rate}%</td></tr>
<tr><td>투자기간</td></tr>
<tr><td>${dto.p_term}개월</td></tr>
<c:if test = "${dto.p_success == 'doing'}">
<tr><td>투자금액</td></tr>
<tr>
<td>
<input type="text" name="amount">만원
</td>
</tr>
</c:if>
<tr><td>펀딩기간 : 1주일</td></tr>
<tr><td>상환일 : 매월${dto.p_repayday}일 + 5일</td></tr>
<tr>
<c:if test="${dto.p_success == 'success'}">
<td><input type="button" value="펀딩성공"></td>
</c:if>
<c:if test="${dto.p_success == 'doing'}">
<td><input type="submit" value="투자미리보기"></td>
</c:if>
<c:if test="${dto.p_success == 'fail'}">
<td><input type="button" value="펀딩실패"></td>
</c:if>
</tr>

</table>
</div>
</form>

</body>
</html>