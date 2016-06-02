<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
<!-- css �� js ���� ��Ŭ���  -->
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
</head>


<body>
	
	
<c:if test="${sessionScope.adminId==null}">
		<div class="login-box">
			<div class="login-logo">
				<div class="login-heading">
					<a href="main.dj"><b>DONJOM</b> ��������</a>
				</div>
			</div>
			<div class="login-box-body">
				<form class="form-signin" action="admin_loginPro.dj" method="post">
					<div class="form-group has-feedback">
						<label>���̵�</label> <input type="text" name="id"
							class="form-control" />
					</div>
					<div class="form-group has-feedback">
						<label>��й�ȣ</label> <input type="password" name="pw"
							class="form-control" />
					</div>
				
					<hr>
					<button type="submit" class="btn btn-block bg-orange">
						<i class="fa fa-fw fa-diamond"></i>��� �α���
					</button>

				</form>
			</div>
			<br/>
			<p class="text-center"><b>�ڳ� ���� ��ŷ ���� , �츮 ��� ���ڵ���!</b></p>
			</div>
	</c:if>
<c:if test="${sessionScope.adminId!=null}">
		<script>

function (){
	document.location.repload("manager_main.dj");
}

</script>


	</c:if> 

</body>
</html>