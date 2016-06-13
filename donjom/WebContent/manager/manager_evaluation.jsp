<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>����ɻ�</title>

</head>
<body>
	<jsp:include page="/WEB-INF/admin-slider.jsp" />

	<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>����ɻ�</h1>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<div class="container">
		<div class="row">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">���� �ɻ�</h3>
					<div class="box-tools">
						<form action="manager_evaluation_search.dj" method="post"
							class="form-inline">
							<select name="evaluation" class="form-control">
								<option value="e_memid">���̵�</option>
								<option value="e_memname">�̸�</option>
								<option value="e_result">�ɻ� ���</option>
							</select> <input type="text" align="right" name="search"
								class="form-control" /> <input type="submit" value="�˻�"
								align="right" class="btn btn-info btn-flat" />
						</form>
					</div>

				</div>
				<c:if test="${count != 0}">
					<table class="table table-bordered">
						<tr>
							<td>���̵�</td>
							<td width="80">�̸�</td>
							<td width="50">���� ����</td>
							<td width="600">�ɻ� ����</td>
							<td>�ɻ� ���</td>
							<td>�ɻ� ����</td>
						</tr>
						<c:if test="${setting ==1 }">
							<c:forEach var="list" items="${list}">
								<tr>
									<td>${list.e_memid}</td>
									<td>${list.e_memname}</td>
									<td>${list.e_doccount}</td>
									<td><a href ="manager_econtents.dj?no=${list.no}">
										<c:choose>
											<c:when test="${fn:length(list.e_content) > 21}">
												<c:out value="${fn:substring(list.e_content,0,20)}" />....
          									</c:when>
											<c:otherwise>
												<c:out value="${list.e_content}" />
											</c:otherwise>
										</c:choose>
									</div></td>
								
									<td><label class="badge bg-olive"> <i
											class="fa fa-check fa-lg "></i><br>${list.e_result}</label></td>
									<td>
									<input type="button" value="�ɻ����" class="btn bg-green" onclick="javascript:location.href='manager_evaluation_modify.dj?no=${list.no}'"/>
									</td>
								</tr>
							</c:forEach>
							<tr><td colspan="11" align="center">${pagingHtml}</td></tr>
						</c:if>

						<c:if test="${setting ==2}">
							<c:forEach var="list" items="${list}">
								<tr>
									<td>${list.e_memid}</td>
									<td>${list.e_memname}</td>
									<td>${list.e_doccount}</td>
									<td><a href ="manager_econtents.dj?no=${list.no}">
										<c:choose>
											<c:when test="${fn:length(list.e_content) > 21}">
												<c:out value="${fn:substring(list.e_content,0,20)}" />....
          									</c:when>
											<c:otherwise>
												<c:out value="${list.e_content}" />
											</c:otherwise>
										</c:choose>
									</td>
									<td><label class="badge bg-olive"> <i
											class="fa fa-check fa-lg "></i><br>${list.e_result}</label></td>
									<td>
									<input type="button" value="�ɻ����"  class="btn bg-green" onclick="javascript:location.href='manager_evaluation_modify.dj?no=${list.no}'"/>
									</td>
								</tr>
							</c:forEach>
							<tr><td colspan="11" align="center">${pagingHtml}</td></tr>
						</c:if>
					</table>
				</c:if>
				
				<c:if test="${count == 0}">
	���� �ɻ�Ϸ�� �׸��� �����ϴ�. 	
	</c:if>
			</div>
		</div>
	</div>
</body>
</html>