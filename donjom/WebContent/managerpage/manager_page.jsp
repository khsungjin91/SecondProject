<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ���� �� ���� </title>

</head>
<body>

<jsp:include page="/WEB-INF/admin-slider.jsp" />
	
<div class="container">
	<div class="row">
		<div class="col-sm-10">
		<div class="box-header">
		<input type="button" value="ȸ�� ���� ����" class="btn btn-lg bg-olive" onclick="javascript:location.href='manager_companyinfo.dj'">
		<input type="button" value="ī�װ� �߰�/����" class="btn btn-lg bg-olive" onclick="javascript:location.href='manager_category.dj'">
		
		</div>
		<hr>
			<div class="box box-primary">
				<div class="box-body" id="listDiv" ></div>
			</div>
		
		</div>
	</div>
</div>
</body>
</html>