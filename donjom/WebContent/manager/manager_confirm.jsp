<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>confirm member page</title>
<script>
	function copen(){
		var con = form.confirm.value;
		var sear = form.search.value;
		
		var url ="confirm_search.dj?confirm="+con+"&search="+sear;
		window.open(url, "open", "width=1500, height=400")
	}
	$("#search").keypress(function(event){
		if(event.keyCode == 13){
			$('#lookup').focus().click();
			return false;
		}
	});
</script>
</head>
<body>
<form name="form" method="post" >
	<select name="confirm"> 
		<option value="name">회원이름</option>
		<option value="mobilenum">핸드폰번호</option>
		<option value="bankaccnum">계좌번호</option>
		<option value="virtualacc">가상계좌</option>
	</select>
	<input type="text" align="right" name="search" id="search"/>
	<input type="button" value="검색" onclick="copen()" id="lookup"/>
</form>
	<table class="table table-condensed">
		<tr>
			<td>회원이름 </td>
			<td>생년월일</td>
			<td>성 별</td>
			<td>핸드폰번호</td>
			<td>주 소</td>
			<td>가상계좌</td>
			<td>거래은행</td>
			<td>계좌번호</td>
			<td>이메일</td>
			<td>가입날짜</td>
			<td>진행상황</td>
			
		</tr>
	<c:if test="${setting == 1}">
	<c:forEach var="list" items="${list}">
		<tr>
		<td>${list.name}</td>
		<td>${list.birth}</td>
		<td>${list.gender}</td>
		<td>${list.mobilenum}</td>
		<td>${list.address}</td>
		<td>${list.randomacc}</td>
		<td>${list.bankcode}</td>
		<td>${list.bankaccnum}</td>
		<td>${list.email}</td>
		<td>${list.join}</td>
		<td>
		<input type="button" class="btn btn-block btn-success btn-xs" value="상세보기" onclick="javascript:location.href='manager_view.dj?email=${list.email}'"/>		
		</td>
		</tr>
	</c:forEach>
	</c:if>

	<c:if test="${setting == 2 }">
	<c:forEach var="list2" items ="${list}">
		<tr>
		<td>${list2.name}</td>
		<td>${list2.birth}</td>
		<td>${list2.gender}</td>
		<td>${list2.mobilenum}</td>
		<td>${list2.address}</td>
		<td>${list2.randomacc}</td>
		<td>${list2.bankcode}</td>
		<td>${list2.bankaccnum}</td>
		<td>${list2.email}</td>
		<td>${list2.join}</td>
		<td>
		<input type ="button" class="btn btn-block btn-success btn-xs" value="상세보기" onclick="javascript:location.href='manager_view.dj?email=${list2.email}'"/>
		</td>
	</c:forEach>	
	</c:if>
	</table>
</body>
</html>