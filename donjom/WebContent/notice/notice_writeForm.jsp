<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
<html>
<head><title>공지사항</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />

<div class="container">
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
	<div class="text-center">
		<input type="submit" value="등록" class="btn bg-green">
		<input type="button" onclick="javascript:location.href='notice.dj'" value="취소" class="btn bg-red">
	</div>
	

</div>
</form>
</div>

<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1');
    //bootstrap WYSIHTML5 - text editor
    $(".textarea").wysihtml5();
  });
</script>
<jsp:include page="/WEB-INF/footer.jsp" />
</body>
</html>