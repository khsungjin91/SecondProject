<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<title>����</title>
</head>
<body>
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
 <input type="submit" class="btn btn-default" value="���ۼ�">
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