<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>

 	
<title>공지사항</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />
	<div class="container">
		<h3 class="box-header text-center">공지사항</h3>
		<div class="row">
			<div class="box box-success">
			<div class="box-body">
	<table class="table">
		<tr>
		<th>${nodto.n_subject }</th>
		<th>${nodto.n_reg }</th>
		</tr>
		<tr>
		<td colspan="2">${nodto.n_content }</td>
		</tr>
		
		
	</table>
<input type="button" value="목록" onclick="javascript:location.href='notice.dj'" class="btn btn-default">
<input type="button" onclick="javascript:location.href='notice_modify.dj?no=${nodto.n_num}'" value="수정" class="btn btn-default">
<input type="button" onclick="javascript:location.href='notice_delete.dj?no=${nodto.n_num }'" value="삭제" class="btn btn-default">
	
</div></div></div>
</div>





</body>
</html>