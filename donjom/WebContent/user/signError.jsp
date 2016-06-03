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


<c:if test="${x == 2}">
<script>
	alert("이미 로그인되어 있는 회원입니다.");
	history.go(-1);
</script>
</c:if>

<c:if test="${x == 1}">
<script>
	alert("비밀번호를 확인해주세요.");
	history.go(-1);
</script>
</c:if>

<c:if test="${x == 0}">
<script>
	alert("아이디와 비밀번호를 확인해주세요.");
	history.go(-1);
</script>
</c:if>

</body>
</html>