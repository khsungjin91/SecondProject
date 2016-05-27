<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
<input type="submit" value="수정" class="btn btn-default">
<input type="button" onclick="javascript:location.href='notice.dj'" value="취소" class="btn btn-default">
	

</div>
</form>


</body>
</html>