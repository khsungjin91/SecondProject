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
	alert("�̹� �α��εǾ� �ִ� ȸ���Դϴ�.");
	history.go(-1);
</script>
</c:if>

<c:if test="${x == 1}">
<script>
	alert("��й�ȣ�� Ȯ�����ּ���.");
	history.go(-1);
</script>
</c:if>

<c:if test="${x == 0}">
<script>
	alert("���̵�� ��й�ȣ�� Ȯ�����ּ���.");
	history.go(-1);
</script>
</c:if>

</body>
</html>