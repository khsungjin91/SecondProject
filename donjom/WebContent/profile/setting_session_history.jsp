<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp" />

	<c:if test="${sessionScope.memId == null }">

		<script type="text/javascript">
			alert("�α��� �� ��밡���մϴ�.");
			window.location = "signIn.dj";
		</script>

	</c:if>
	<div class="warpper dash-body">
		<div class="container">
			<jsp:include page="/WEB-INF/settingside.jsp" />
			<div class="col-xs-12 col-sm-8 contetns-warp right">
				<!-- ���� ��ü -->
				<div class="col-sm-12 contents-left">
					<!-- �����κ���ü -->
					<div class="box box-default contents">
						<div class="box-header">
							<ol class="breadcrumb contents-menu hidden-xs">
								<li><h3>����</h3></li>
								<li><a href="setting.dj">�⺻����</a></li>
								<li><a href="setting_cert_person.dj">��������</a></li>
								<li><a href="setting_session_history.dj">�α��γ���</a>
							</ol>
						</div>
						<div class="box-body">
								<h3>�α��γ���</h3>

							<table class="table table-striped">
								<tr>
									<td>�ð�</td>
									<td>Ȱ��</td>
									<td>IP�ּ�</td>
									<td>��ġ</td>
								</tr>
								<c:forEach var="session" items="${session}">
									<tr>
										<td>${session.time}</td>
										<td>${session.move}</td>
										<td>${session.ip}</td>
										<td>${session.place}</td>
									</tr>
								</c:forEach>
							</table>

							<div class="text-center">${pagingHtml}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/footer.jsp"/>
</body>
</html>