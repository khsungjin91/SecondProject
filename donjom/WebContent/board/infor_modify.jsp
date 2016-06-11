
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="infor_modifyPro.dj?no=${indto.i_num}" method="post" class="form-horizontal">
<div id="notice" class="form-group">

	<table class="table">
		<tr>
		<td>제목 </td>
		<td><input type="text"  class="form-control" value="${indto.i_subject }" name="i_subject"></td>
		</tr>
		
		<tr>
		<td>내용</td>
		<td> <textarea name="i_content" class="ckeditor" style="width:100%;height:200px;">${indto.i_content }</textarea></td>
		</tr>
		
	</table>
<input type="submit" value="수정" class="btn btn-default">
<!-- <input type="button" onclick="javascript:location.href='notice.dj'" value="취소" class="btn btn-default">
 -->	

</div>
</form>
</body>
</html>