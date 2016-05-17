<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script type="text/javascript">
	window.onload = function() {
		var chart = new CanvasJS.Chart("category_chart", {
			title : {
				text : "Pie Chart"
			},
			data : [ {
				type : "pie",
				dataPoints : [ {
					y : 8.16,
					legendText : "�����",
					label : "�����"
				}, {
					y : 83.24,
					legendText : "���νſ�",
					label : "���νſ�"
				}, {
					y : 4.67,
					legendText : "�ε���",
					label : "�ε���"
				} ]
			} ]
		});
		chart.render();
	}
</script>
<script src="assets/source/canvasjs.min.js"></script>
<title>CanvasJS Example</title>
</head>
<body>
<c:forEach var="avg" items="${avg}">

<div>${avg}</div>

</c:forEach>

	<div id="category_chart" style="height: 400px; width: 100%;"></div>
	
	<div id="br_requestList">
		<table border="1">
			<tr>
				<td>�̸�</td>
				<td>����</td>
				<td>�ڵ�����ȣ</td>
				<td>����</td>
				<td>�����û��¥</td>
				<td>�ɻ��ϱ�</td>
			</tr>

			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.memname}</td>
					<td>${list.mememail}</td>
					<td>${list.memphone}</td>
					<td>${list.br_object}</td>
					<td>${list.br_date}</td>
					<td><input type="button" value="�ɻ��ϱ�"
						onclick="javascript:location.href='manager_evaluation_write.dj?mememail=${list.mememail}&no=${list.no}'">
					</td>
				</tr>
			</c:forEach>
		</table>
		</table>
	</div>



</body>
</html>