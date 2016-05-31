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
<c:if test="${check == 1}">
<span style="color: red;">사용불가능한 이메일 입니다.</span>
</c:if>

<c:if test="${check == 0 }">
<span style="color: green;">사용가능한 이메일 입니다.</span>
</c:if>

<c:if test="${check == -1 }">
<span style="color: red;">이메일을 입력해주시기 바랍니다.</span>
</c:if>


</body>
</html>