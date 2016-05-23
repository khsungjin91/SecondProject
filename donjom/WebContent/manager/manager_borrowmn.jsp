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
          ['p 개인신용',  p],
          ['b 부동산',  b],
          ['c 사업자',  c],
          ['m 매출담보', m]          
        ]);

        var options = {
          title: '카테고리별 대출현황',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
      
      
      alert("시작");
   
      alert("0");
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2(){
          alert("1");
        var data2 = google.visualization.arrayToDataTable([
          ['age', 'Men', 'Woman'],
          ['81-100', 50, 20],
          ['61-80', 0, 23.3],
          ['51-60', 10, 4.5],
          ['41-50', 10, 14.3],
          ['31-40', 10, 0.9],
          ['20-30', 20, 13.1]
        ]);
        alert("2");
        var options2 = {
          chart: {
            title: '성별,나이에 따른 대출현황',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };
        alert("3");
        var chart2 = new google.charts.Bar(document.getElementById('barchart_material'));
        alert("4");
        chart2.draw(data2, options2);
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
	
	
	<div id="piechart_3d" style="width: 600px; height: 350px;"></div>
	 <div id="barchart_material" style="width: 600px; height: 350px;"></div>

	<div id="br_requestList">
		<table border="1">
			<tr>
				<td>이름</td>
				<td>메일</td>
				<td>핸드폰번호</td>
				<td>목적</td>
				<td>대출신청날짜</td>
				<td>심사하기</td>
			</tr>

			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.memname}</td>
					<td>${list.mememail}</td>
					<td>${list.memphone}</td>
					<td>${list.br_object}</td>
					<td>${list.br_date}</td>
					<td><input type="button" value="심사하기"
						onclick="javascript:location.href='manager_evaluation_write.dj?mememail=${list.mememail}&no=${list.no}'">
					</td>
				</tr>
			</c:forEach>
		</table>
		</table>
	</div>



</body>
</html>