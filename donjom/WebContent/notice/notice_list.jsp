<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
 	
<title>공지사항</title>
</head>
<body>

<div id="notice">

	<table class="table-condensed">
		<tr>
		<td>no</td>
		<td>제목</td>
		
		<td>작성일</td>
		
		</tr>
	<c:forEach var="list" items="${list }">
		<tr>
		<td>${list.n_num }</td>
		<td><a href="notice_view.dj?no=${list.n_num}">${list.n_subject }</td>
		<td>${list.n_reg }</td>
		</tr>
		</c:forEach>

		
		
	</table>
<input type="button" onclick="javascript:location.href='noticeForm.dj'" value="글쓰기" class="btn btn-default">
	<p>
	<ul class="pagination">
		<li><a href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      	</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a></li>
	</ul>


</div>


</body>
</html>