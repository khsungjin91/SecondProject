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
alert("�α��� �� ��밡���մϴ�.");
window.location="signIn.dj";
</script>

</c:if>

<h2> ����ȯ�� </h2>

<ul>
	<li><a href="point_deposit.dj">����</a></li>
	<li><a href="point_withdrow.dj">ȯ��</a></li>
	<li><a href="point_history.dj">����/ȯ�޳���</a></li>
</ul>


�����ߺ����Դϴ�.

</body>
</html>