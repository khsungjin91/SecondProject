<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="style/css/herb.css" rel="stylesheet">
	<link href="bt/css/bootstrap.min.css" rel="stylesheet">
 	<link href="bt/css/bootstrap-theme.min.css" rel="stylesheet">
 	
<title>공지사항</title>
</head>
<body>
<h1>공지사항</h1>

<div id="notice" class="form-group">

	<table class="table">
		
		<tr>
		<th>${nodto.n_subject }</th>
		<th>${nodto.n_reg }</th>
		</tr>
		
		<tr>
		
		<td colspan="2">${nodto.n_content }</td>
		</tr>
		
		
	</table>
<input type="button" value="목록" onclick="javascript:location.href='notice.dj'" class="btn btn-default">
<input type="button" onclick="javascript:location.href='notice_modify.dj?no=${nodto.n_num}'" value="수정" class="btn btn-default">
<input type="button" onclick="javascript:location.href='notice_delete.dj?no=${nodto.n_num }'" value="삭제" class="btn btn-default">
	

</div>



<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bt/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>