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

<c:if test="${sessionScope.memId == null }">

<script type="text/javascript">
alert("로그인 후 사용가능합니다.");
window.location="signIn.dj";
</script>

</c:if>

<h2> 충전환급 </h2>

<ul>
	<li><a href="point_deposit.dj">충전</a></li>
	<li><a href="point_withdrow.dj">환급</a></li>
	<li><a href="point_history.dj">충전/환급내역</a></li>
</ul>


오픈중비중입니다.

</body>
</html>