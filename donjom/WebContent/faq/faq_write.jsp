<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="style/css/herb.css" rel="stylesheet">
	<link href="bt/css/bootstrap.min.css" rel="stylesheet">
 	<link href="bt/css/bootstrap-theme.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>도움말</title>
</head>
<body>
<form action="help_faqPro.dj" method="post">
 <table class="table">
 	<tr>
 		<td>제목</td>
 		<td><input type="text" name="h_subject" class="form-control"></td>
 	</tr>
 	<tr>
 	<td>내용</td>
 	<td><input type="textarea" name="h_content" class="form-control"></td>
 	</tr>
 	<tr>
 	<td>분류</td>
 	<td>
 	<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="option1">공통
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="option2">대출
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="option3">투자
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="option4">계정
 	</label>
 	</td>
 	</tr>
 	
 </table>
 <input type="submit" class="btn btn-default" value="글작성">
</form>


<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>