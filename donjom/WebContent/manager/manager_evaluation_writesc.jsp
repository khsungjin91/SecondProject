<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>대출성공</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="container">
<h2 class="box-header">대출성공!</h2>
<div class="box-body">
<input type="button" value="대출신청list" class="btn btn-lg bg-olive" onClick="window.location.href='manager_borrowmn.dj'"/>
<input type="button" value="대출완료list"	class="btn btn-lg bg-olive"  onClick="window.location.href='manager_evaluation.dj'" />
</div>
</div>				
</body>
</html>