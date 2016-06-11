<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<title>information board</title>
</head>
<body>
<h1>공지사항</h1>
<form action="infor_modifyPro.dj?no=${nodto.n_num}" method="post" class="form-horizontal">
<table class="table-condensed">
			<tr>
				<td>no</td>
				<td>제목</td>
<td>콘텐츠</td>
				<td>작성일</td>

			</tr>
			<c:forEach var="list" items="${list }">
				<tr>
					<td>${list.i_num }</td>
					<td><a href="infor_view.dj?no=${list.i_num}">${list.i_subject }</td>
						<td>${list.i_reg }</td>
					</tr>
					<tr >
					<td><textarea name="n_content" class="ckeditor" style="width:100%;height:200px;">${list.i_content }</textarea></td>
				</tr>
				<tr>
				<td>	<input type="button"
			onclick="javascript:location.href='infor_modifyPro.dj?no=${list.i_num}'" value="수정"
			class="btn btn-default"></td>
				</tr>
			</c:forEach>



		</table>
		
		<input type="submit" value="수정" class="btn btn-default">
		</form>

</body>
</html>