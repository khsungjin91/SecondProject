<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>

<title>����</title>
</head>
<body>
	<jsp:include page="/WEB-INF/admin-slider.jsp"/>
<div class="container">

<form action="help_faqPro.dj" method="post">
 <table class="table">
 	
 		<tr>
 	<td>�з�</td>
 	<td>
 	<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="����">����
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="����">����
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="����">����
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="����">����
 	</label>
 	</td>
 	</tr>
 	<tr>
 		<td>����</td>
 		<td><input type="text" name="h_subject" class="form-control"></td>
 	</tr>
 	<tr>
 	<td>����</td>
 	<td>	  <textarea name="h_content" class="ckeditor" style="width:100%;height:200px;"></textarea></td>
 	</tr>
 
 	
 </table>
 <div class="text-center">
  <input type="submit" class="btn btn-lg bg-green" value="���ۼ�">
  <input type="submit" class="btn btn-lg bg-red" value="�ڷ�" onclick="javascript:history.go(-1)">
  
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

</body>
</html>