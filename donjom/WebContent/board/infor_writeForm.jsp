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
 	
<title>Insert title here</title>
</head>
<body>
<div class="container">
<form action="infor_writePro.dj" method="post" class="form-horizontal">
<div id="notice" class="form-group">

	<table class="table">
		<tr>
		<td>ī�װ� </td>
		<td><input type="text" class="form-control" name="category"></td>
		</tr>
		<tr>
		<td>���� </td>
		<td><input type="text" class="form-control" name="i_subject"></td>
		</tr>
		
		<tr>
		<td>����</td>
		<td>
	  <textarea name="i_content" class="ckeditor" style="width:100%;height:200px;"></textarea>
		</td>
		</tr>
		
	</table>
	<input type="hidden" value="">
<input type="submit" value="���" class="btn btn-default">
<input type="button" onclick="javascript:location.href='notice.dj'"  value="���" class="btn btn-default">
	

</div>
</form>
</div>
</body>
</html>