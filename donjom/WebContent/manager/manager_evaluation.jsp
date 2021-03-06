<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>대출심사</title>

</head>
<body>
	<jsp:include page="/WEB-INF/admin-slider.jsp" />

	
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>대출심사</h1>
				</div>
			</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">대출 심사</h3>
					<div class="box-tools">
						<form action="manager_evaluation_search.dj" method="post"
							class="form-inline">
							<select name="evaluation" class="form-control">
								<option value="e_memid">아이디</option>
								<option value="e_memname">이름</option>
								<option value="e_result">심사 결과</option>
							</select> <input type="text" align="right" name="search"
								class="form-control" /> <input type="submit" value="검색"
								align="right" class="btn btn-info btn-flat" />
						</form>
					</div>

				</div>
				<c:if test="${count != 0}">
					<table class="table table-bordered">
						<tr>
							<td>아이디</td>
							<td width="80">이름</td>
							<td width="50">서류 개수</td>
							<td width="600">심사 내용</td>
							<td>심사 결과</td>
							<td>심사 수정</td>
						</tr>
						<c:if test="${setting == 1 }">
							<c:forEach var="list_ev" items="${list_ev}">
								<tr>
									<td>${list_ev.e_memid}</td>
									<td>${list_ev.e_memname}</td>
									<td>${list_ev.e_doccount}</td>
									<td><a href ="manager_econtents.dj?no=${list_ev.no}">
									${list_ev.e_memid}님 대출의 심사내용
									</a></td>
								
									<td><label class="badge bg-olive"> 
									<i class="fa fa-check fa-lg "></i><br>${list_ev.e_result}</label></td>
									<td>
									<input type="button" value="심사수정" class="btn bg-green" onclick="javascript:location.href='manager_evaluation_modify.dj?no=${list_ev.no}'"/>
									</td>
								</tr>
							</c:forEach>
							<tr><td colspan="11" align="center">${pagingHtml}</td></tr>
						</c:if>

						<c:if test="${setting == 2}">
							<c:forEach var="list_ev" items="${list_ev}">
								<tr>
									<td>${list_ev.e_memid}</td>
									<td>${list_ev.e_memname}</td>
									<td>${list_ev.e_doccount}</td>
									<td><a href ="manager_econtents.dj?no=${list_ev.no}">
										<c:choose>
											<c:when test="${fn:length(list_ev.e_content) > 21}">
												<c:out value="${fn:substring(list_ev.e_content,0,20)}" />....
          									</c:when>
											<c:otherwise>
												<c:out value="${list_ev.e_content}" />
											</c:otherwise>
										</c:choose>
									</a></td>
									<td><label class="badge bg-olive"> <i
											class="fa fa-check fa-lg "></i><br>${list_ev.e_result}</label></td>
									<td>
									<input type="button" value="심사수정"  class="btn bg-green" onclick="javascript:location.href='manager_evaluation_modify.dj?no=${list_ev.no}'"/>
									</td>
								</tr>
							</c:forEach>
							<tr><td colspan="11" align="center">${pagingHtml}</td></tr>
						</c:if>
					</table>
				</c:if>
				
				<c:if test="${count == 0}">
	대출 심사완료된 항목이 없습니다. 	
	</c:if>
			</div>
		</div>
	</div>
</body>
</html>