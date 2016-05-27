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
<form action="notice_writePro.dj" method="post" class="form-horizontal">
<div id="notice" class="form-group">

	<table class="table">
		<tr>
		<td>제목 </td>
		<td><input type="text" class="form-control" name="n_subject"></td>
		</tr>
		
		<tr>
		<td>내용</td>
		<td>
	  <textarea name="n_content" class="ckeditor" style="width:100%;height:200px;"></textarea>
		</td>
		</tr>
		
	</table>
	<input type="hidden" value="">
<input type="submit" value="등록" class="btn btn-default">
<input type="button" onclick="javascript:location.href='notice.dj'"  value="취소" class="btn btn-default">
	

</div>
</form>


<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1');
    //bootstrap WYSIHTML5 - text editor
    $(".textarea").wysihtml5();
  });
</script>
</body>
</html>