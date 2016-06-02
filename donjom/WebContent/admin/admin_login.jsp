<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function home() {
		window.location = "main.dj"
	}
	function myhome() {
		window.location = "manager_main.dj"
	}
	function logout() {
		window.location = "admin_logout.dj"
	}
</script>

</head>


<body>
	<c:if test="${sessionScope.adminId==null}">

		<form action="admin_loginPro.dj" method="post">
			id:<input type="text" name="id" /><br /> pw:<input type="text"
				name="pw" /><br /> <input type="submit" value="로그인" />
		</form>
	</c:if>
	<c:if test="${sessionScope.adminId!=null}">
		<input type="button" value="home" onclick="home()" />
		<input type="button" value="myhome" onclick="myhome()" />
		<br />
		<input type="button" value="logout" onclick="logout()" />

	</c:if>

</body>
</html>