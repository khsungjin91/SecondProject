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

<div class="row">
			<div class="box box-primary">
				<div class="box-body">
					<div class="col-sm-12">

						<div>�۱��� ����
							
							<table class="table table-bordered table-responsive table-hover">
							<tr>
								<td>��ǰ�ڵ�</td>
								<td>��ǰ����</td>
								<td>���ڵȱݾ�</td>
								<td>�������ο�</td>
								<td>�������̸�</td>
								<td>����������</td>
							</tr>
								<c:forEach var="listrt" items="${listrt}">
									<tr>
										<td>${listrt.p_code}</td>
										<td><a href="fundView.dj?p_code=${listrt.p_code}">${listrt.p_name}</a></td>
										<td>${listrt.p_price}����</td>
										<td>${listrt.p_people}��</td>
										<td>${listrt.name}</td>
										<td><a href="confirm_search.dj?confirm=i.no&search=${listrt.p_memeno}">������</a></td>
									</tr>
								</c:forEach>
						</table>
						<div align="center">${pagingHtmled}</div>
						</div>
						
				</div>
			</div>
		</div>
	</div>


</body>
</html>