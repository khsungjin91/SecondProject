<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="p_code" value="${p_code}"> 

<c:if test="${time == '0:0:0'}">
<script>
var p_code = $("#p_code").val();
location.replace("fundView.dj?p_code="+p_code);
</script>
</c:if>


<c:if test="${time != '0:0:0'}">
<div>펀딩까지남은시간</div>
${time}
</c:if>
</body>
</html>