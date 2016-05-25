<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	var user = document.userinput;
    	var p = parseInt(user.p.value);
    	var b = parseInt(user.b.value);
    	var c = parseInt(user.c.value);
    	var m = parseInt(user.m.value);
   
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['p ���νſ�',  p],
          ['b �ε���',  b],
          ['c �����',  c],
          ['m ����㺸', m]          
        ]);

        var options = {
          title: 'ī�װ��� ������Ȳ',
          is3D: true
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'))
        ;
        chart.draw(data, options);
      }
   
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2() {
        var data = google.visualization.arrayToDataTable([                                                 
		['age', 'Men', 'Woman'],
		['80���̻�', 10, 20],
		['60-80', 5, 23.3],
		['50-60', 10, 4.5],
		['40-50', 24, 14.3],
		['30-40', 10, 0.9],
		['20-30', 20, 13.1],
		['20�̸�',0,0]
        ]);
        
        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
                         { calc: "stringify",
                           sourceColumn: 1,
                           type: "string",
                           role: "annotation" },
                         2]);

        var options = {
         
            title: '����,������ ���� ������Ȳ',
         
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.visualization.BarChart(document.getElementById('barchart_material'));

        chart.draw(view, options);
      }
    </script>

<title></title>
</head>
<body>
	

<form action="#" name="userinput">
<input type="hidden" value="${p}" id="p" name="p"/>
<input type="hidden" value="${b}" id="b" name="b"/>
<input type="hidden" value="${c}" id="c" name="c"/>
<input type="hidden" value="${m}" id="m" name="m"/>
</form>
	
	<div id="barchart_material" style="width: 600px; height: 350px;"></div>
	
	<div id="piechart_3d" style="width: 600px; height: 350px;"></div>

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