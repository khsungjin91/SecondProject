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

 <a href="fundList_total.dj">��ü</a>
 <a href="">�����</a>
 <a href="">���νſ�</a>
 <a href="">�ε���</a>
 <a href="">�㺸����</a>

<div>
<c:forEach var="list" items="${list}">
<a href="">
<div style="float: left;">
	<div>
		<img src="">
	</div>
	<div>
		<ul>
			<li>��ǥ${list.p_price}����  ��${list.p_rate}%���ͷ�</li>
			<li>${list.p_category} | ${list.p_term}</li>
			<li>%���� ${list.p_people} ${list.p_success}</li>
		</ul>
	</div>
</div>
</a>
</c:forEach>
</div>

</body>
</html>