<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
<html>
<head><title>��������</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />

<div class="container">
<h1>��������</h1>
<form action="notice_writePro.dj" method="post" class="form-horizontal">
<div id="notice" class="form-group">

	<table class="table">
		<tr>
		<td>���� </td>
		<td><input type="text" class="form-control" name="n_subject"></td>
		</tr>
		<tr>
		<td>����</td>
		<td>
	  <textarea name="n_content" class="ckeditor" style="width:100%;height:200px;"></textarea>
		</td>
		</tr>
		
	</table>
	<div class="text-center">
		<input type="submit" value="���" class="btn bg-green">
		<input type="button" onclick="javascript:location.href='notice.dj'" value="���" class="btn bg-red">
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