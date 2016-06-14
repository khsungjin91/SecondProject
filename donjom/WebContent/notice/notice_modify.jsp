<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>

<title>공지사항</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="container">
<h1>공지사항</h1>

<form action="notice_modifyPro.dj?no=${nodto.n_num}" method="post" class="form-horizontal">
<div id="notice" class="form-group">

	<table class="table">
		<tr>
		<td>제목 </td>
		<td><input type="text"  class="form-control" value="${nodto.n_subject }" name="n_subject"></td>
		</tr>
		
		<tr>
		<td>내용</td>
		<td> <textarea name="n_content" class="ckeditor" style="width:100%;height:200px;">${nodto.n_content }</textarea></td>
		</tr>
		
	</table>
	<div class="text-center">
<input type="submit" value="수정" class="btn btn-lg bg-green">
<input type="button" onclick="javascript:location.href='notice.dj'" value="취소" class="btn btn-lg bg-red">
</div>
	

</div>
</form>
</div>

</body>
</html>