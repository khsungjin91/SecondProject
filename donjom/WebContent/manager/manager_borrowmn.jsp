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
          is3D: true
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'))
        ;
        chart.draw(data, options);
      }
   //===========================================================================================bar차트
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2() {
    		var m_noadult=${dto.m_noadult}; 
    		var m_twenty=${dto.m_twenty};
    		var m_thirty=${dto.m_thirty};
    		var m_forty=${dto.m_forty};
    		var m_fifty=${dto.m_fifty};
    		var m_sixty=${dto.m_sixty};
    		var m_eighty=${dto.m_eighty};
    		var w_noadult=${dto.w_noadult}; 
    		var w_twenty=${dto.w_twenty};
    		var w_thirty=${dto.w_thirty};
    		var w_forty=${dto.w_forty};
    		var w_fifty=${dto.w_fifty};
    		var w_sixty=${dto.w_sixty};
    		var w_eighty=${dto.w_eighty};
    	  
        var data = google.visualization.arrayToDataTable([                                                 
		['age', 'Men', 'Woman'],
		['80세이상',m_eighty,w_eighty],
		['60-80',m_sixty,w_sixty],
		['50-60',m_fifty,w_fifty],
		['40-50',m_forty,w_forty],
		['30-40',m_thirty,w_thirty],
		['20-30',m_twenty,w_twenty],
		['20미만',m_noadult,w_noadult]
        ]);
        
        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
                         { calc: "stringify",
                           sourceColumn: 1,
                           type: "string",
                           role: "annotation" },
                         2]);

        var options = {
         
            title: '나이,성별에 따른 대출현황',
         
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.visualization.BarChart(document.getElementById('barchart_material'));

        chart.draw(view, options);
      }
      
	//================================================================================================line차트
       google.charts.setOnLoadCallback(lineChart);

     function lineChart() {

    	var now = ${now};
 		var today = new Date();
    	 
    	var chartDiv = document.getElementById('chart_div');

  	    var data = new google.visualization.DataTable();
  	    data.addColumn('date', 'Month');
   	    data.addColumn('number', "Average ");
     

   	    data.addRows([
         [new Date(now, 0),  5 ],
         [new Date(now, 1),  4],
         [new Date(now, 2),  5 ],
         [new Date(now, 3),  2.9],
         [new Date(now, 4),  6.3],
         [new Date(now, 5),    9],
         [new Date(now, 6), 10.6],
         [new Date(now, 7), 10.3],
         [new Date(now, 8),  7.4],
         [new Date(now, 9),  4.4],
         [new Date(now, 10), 1.1],
         [new Date(now, 11), 2]
       ]);

       var classicOptions = {
         title: '올해 월별 평균 대출액',
         width: 900,
         height: 500,
         // Gives each series an axis that matches the vAxes number below.
         series: {
           0: {targetAxisIndex: 0},
           1: {targetAxisIndex: 1}
         },
         vAxes: {
           // Adds titles to each axis.
           0: {title: ''},
           1: {title: ''}
         },
         hAxis: {
           ticks: [new Date(now, 0), new Date(now, 1), new Date(now, 2), new Date(now, 3),
                   new Date(now, 4),  new Date(now, 5), new Date(now, 6), new Date(now, 7),
                   new Date(now, 8), new Date(now, 9), new Date(now, 10), new Date(now, 11)
                  ]
         },
         vAxis: {
           viewWindow: {
             max: 30
           }
         }
       };

       function drawClassicChart() {
         var classicChart = new google.visualization.LineChart(chartDiv);
         classicChart.draw(data, classicOptions);
        
       }

       drawClassicChart();

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
	
	<div id="chart_div"></div>
	
	<div id="barchart_material" style="width: 600px; height: 350px;"></div>
	
	<div id="piechart_3d" style="width: 600px; height: 350px;"></div>

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