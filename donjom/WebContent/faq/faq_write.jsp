<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>

<title>도움말</title>
</head>
<body>
	<jsp:include page="/WEB-INF/admin-slider.jsp"/>
<div class="container">

<form action="help_faqPro.dj" method="post">
 <table class="table">
 	
 		<tr>
 	<td>분류</td>
 	<td>
 	<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="공통">공통
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="대출">대출
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="투자">투자
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="계정">계정
 	</label>
 	</td>
 	</tr>
 	<tr>
 		<td>제목</td>
 		<td><input type="text" name="h_subject" class="form-control"></td>
 	</tr>
 	<tr>
 	<td>내용</td>
 	<td>	  <textarea name="h_content" class="ckeditor" style="width:100%;height:200px;"></textarea></td>
 	</tr>
 
 	
 </table>
 <div class="text-center">
  <input type="submit" class="btn btn-lg bg-green" value="글작성">
  <input type="submit" class="btn btn-lg bg-red" value="뒤로" onclick="javascript:history.go(-1)">
  
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