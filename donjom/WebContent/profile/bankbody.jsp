<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="changehere">
<div class="form-group">
<label class="col-sm-3 control-label">�����	</label>
<div class="col-sm-5">
<input type="text" name="bankcode" value="${dto.bankcode}" class="form-control" disabled>	
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label">���¹�ȣ</label>
<div class="col-sm-5">
	<input type="text" name="bankaccnum" value="${dto.bankaccnum}" class="form-control" disabled>	
	</div>	
<input type="button" value="���� �� ���� ����" onclick="changeAcc()" class="btn bg-olive">										
</div>
</div>

</body>
</html>