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
<title>����</title>
</head>
<body>
<form action="help_faqPro.dj" method="post">
 <table class="table">
 	<tr>
 		<td>����</td>
 		<td><input type="text" name="h_subject" class="form-control"></td>
 	</tr>
 	<tr>
 	<td>����</td>
 	<td><input type="textarea" name="h_content" class="form-control"></td>
 	</tr>
 	<tr>
 	<td>�з�</td>
 	<td>
 	<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="option1">����
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="option2">����
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="option3">����
 	</label>
 		<label class="radio-inline" >
 	<input type="radio"  name="h_category" value="option4">����
 	</label>
 	</td>
 	</tr>
 	
 </table>
 <input type="submit" class="btn btn-default" value="���ۼ�">
</form>


<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
    <script src="bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>