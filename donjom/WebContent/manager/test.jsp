<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

  <div id="chart_div"></div>
  <script>
     google.charts.load('current', {'packages':['line', 'corechart']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

     
      var chartDiv = document.getElementById('chart_div');

      var data = new google.visualization.DataTable();
      data.addColumn('date', 'Month');
      data.addColumn('number', "Average Temperature");
    

      data.addRows([
        [new Date(2014, 0),  -.5  ],
        [new Date(2014, 1),   .4],
        [new Date(2014, 2),   .5 ],
        [new Date(2014, 3),  2.9],
        [new Date(2014, 4),  6.3],
        [new Date(2014, 5),    9],
        [new Date(2014, 6), 10.6],
        [new Date(2014, 7), 10.3],
        [new Date(2014, 8),  7.4],
        [new Date(2014, 9),  4.4],
        [new Date(2014, 10), 1.1],
        [new Date(2014, 11), -.2]
      ]);

      var classicOptions = {
        title: '최근 1년간 월별 평균 대출액',
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
          ticks: [new Date(2014, 0), new Date(2014, 1), new Date(2014, 2), new Date(2014, 3),
                  new Date(2014, 4),  new Date(2014, 5), new Date(2014, 6), new Date(2014, 7),
                  new Date(2014, 8), new Date(2014, 9), new Date(2014, 10), new Date(2014, 11)
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
</body>
</html>