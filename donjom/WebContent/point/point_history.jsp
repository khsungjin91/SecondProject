<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${sessionScope.memId == null }">

<script type="text/javascript">
alert("�α��� �� ��밡���մϴ�.");
window.location="signIn.dj";
</script>

</c:if>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="warpper dash-body">
		<div class="container">
			<div class="col-sm-3">
				<div class="text-center">
					<img src="/donjom/save/${mdto.profile}" class="img-circle"
						width="150">
					<p class="user-nick">${mdto.nickname}</p>
					<p>${mdto.email}</p>
					<p>������ ${mdto.join}</p>
					<div class=" hidden-xs">
						<button type="button" class="btn btn-flat bg-orange"
							onclick="location.href='setting.dj'">
							<i class="fa fa-cog"></i> �⺻���� ����
						</button>
					</div>
				</div>
				<hr>
				<ul class=" dash-menu list-unstyled ">
					<li><a href="dashboard.dj"><i
							class="fa fa-fw fa-tachometer fa-lg"></i>��ú���</a></li>
					<li><a href="invest_history.dj"><i
							class="fa fa-fw fa-bar-chart fa-lg"></i>���ڳ���</a></li>
					<li><a href="laon_history.dj"> <i
							class="fa fa-fw fa-tasks fa-lg"></i>���⳻��
					</a></li>
					<li><a href="point_deposit.dj"> <i
							class="fa fa-fw fa-money fa-lg"></i>����/ȯ��
					</a></li>
					<li><a href="notification.dj"> <i
							class="fa fa-fw fa-bullhorn fa-lg"></i>�˸��޼���
					</a></li>
					<li><a href="setting.dj"> <i
							class="fa fa-fw fa-gear fa-lg"></i>����
					</a></li>
				</ul>
			</div>
			<!-- ������ ����ȯ�� ���̾� -->
			<div class="col-sm-12 col-md-8 ">
				<div class="box box-solid panel-body">
					<div class="box-header">
					<ul class="breadcrumb">
					<li><h2 class="box-title">����ȯ��</h2></li>
						<li><a href="point_deposit.dj">����</a></li>
						<li><a href="point_withdrow.dj">ȯ��</a></li>
						<li><a href="point_history.dj">����/ȯ�޳���</a></li>
					</ul>
					</div>
					
					<div class="box-body text-center title">
					<i class="fa fa-cogs fa-5x"></i>
					<h3>���� �غ��� �Դϴ�. </h3>




</div>
				</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>