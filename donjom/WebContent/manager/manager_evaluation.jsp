<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>evaluation page</title>
</head>
<body>
	<form action="manager_evaluation_search.dj" method="post">
		<select name="evaluation">
			<option value="e_memid">아이디</option>
			<option value="e_memname">이름</option>
			<option value="e_result">심사 결과</option>
		</select> 
		<input type="text" align="right" name="search" /> 
		<input type="submit" value="검색" align="right" /> 
	</form>
	
	<c:if test="${count != 0}">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>서류</td>
				<td>사업체 유무</td>
				<td>사업체 등기부등록</td>
				<td>서류 개수</td>
				<td>심사 내용</td>
				<td>심사 결과</td>
			</tr>
			<c:if test="${setting ==1 }">
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.e_memid}</td>
					<td>${list.e_memname}</td>
					<td>${list.e_document}</td>
					<td>${list.e_cphave}</td>
					<td>${list.e_cpfile}</td>
					<td>${list.e_doccount}</td>
					<td>${list.e_content}</td>
					<td>${list.e_result}</td>
					</tr>
			</c:forEach>
			</c:if>
			
			<c:if test="${setting ==2}">
			<c:forEach var="list" items="${list}">
				<tr>
				<td>${list.e_memid}</td>
				<td>${list.e_memname}</td>
				<td>${list.e_document}</td>
				<td>${list.e_cphave}</td>
				<td>${list.e_cpfile}</td>
				<td>${list.e_doccount}</td>
				<td>${list.e_content}</td>
				<td>${list.e_result}</td>
				</tr>			
			</c:forEach>
			</c:if>
		</table>
	</c:if>
	<c:if test="${count == 0}">
	대출 심사완료된 항목이 없습니다. 	
	</c:if>

</body>
</html>