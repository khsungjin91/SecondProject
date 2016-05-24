<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      //1
      google.charts.setOnLoadCallback(drawChart_category);
      function drawChart_category() {
    	var user = document.userinput;
    	var b = parseInt(user.b.value);
    	var r = parseInt(user.r.value);
    	var p = parseInt(user.p.value);
    	var c = parseInt(user.c.value);
   
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day',{ role: "style" }],
          ["개인신용",  b, "blue"],
          ["부동산",  r, "blue"],
          ["사업자",  p, "blue"],
          ["매출담보", c, "blue"]          
        ]);

        var options = {
          title: '카테고리별 투자현황',
          is3D: false,
          fontSize: '15'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_1'));
        chart.draw(data, options);
      }
      
      //2
      google.charts.setOnLoadCallback(drawChart_price);
      function drawChart_price() {
    	var user = document.userinput;
    	var wayfull = parseInt(user.wayfull.value);
    	var waysplit = parseInt(user.waysplit.value);
   
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day',{ role: "style" }],
          ["원금만기 일시상환",  wayfull, "blue"],
          ["원리금 균등상환",  waysplit, "blue"]        
        ]);

        var options = {
          title: '투자방법 비율',
          is3D: false,
          fontSize: '15'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_2'));
        chart.draw(data, options);
      }

      
      //3
      google.charts.setOnLoadCallback(drawChart_way);
      function drawChart_way() {
    	var user = document.userinput;
    	var b = parseInt(user.b.value);
    	var r = parseInt(user.r.value);
    	var p = parseInt(user.p.value);
    	var c = parseInt(user.c.value);
   
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day',{ role: "style" }],
          ["개인신용",  b, "blue"],
          ["부동산",  r, "blue"],
          ["사업자",  p, "blue"],
          ["매출담보", c, "blue"]          
        ]);

        var options = {
          title: '카테고리별 투자현황',
          is3D: false,
          fontSize: '15'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3'));
        chart.draw(data, options);
      }


      
     //bar 그래프
    google.charts.setOnLoadCallback(drawChartbar);
    function drawChartbar() {
    	
      var data_bar = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        ["Copper", 8, "blue"],
        ["Silver", 9, "blue"],
        ["Gold", 200, "blue"],
        ["asd", 8, "blue"],
        ["asdsad", 8, "blue"],
        ["assadd", 8, "blue"]
      ]);
 
      var view_bar = new google.visualization.DataView(data_bar);
      view_bar.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
  
      var options_bar = {
        title: "그래프",
        width: 1000,
        height: 400,
        bar: {groupWidth: "55%"},
        legend: { position: "none" },
      };
      var chart_bar = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart_bar.draw(view_bar, options_bar);
  }

     
  </script>
  
  
<body>

<form action="#" name="userinput">
<input type="hidden" value="${p}" id="p" name="p"/>
<input type="hidden" value="${b}" id="b" name="b"/>
<input type="hidden" value="${c}" id="c" name="c"/>
<input type="hidden" value="${r}" id="r" name="m"/>
<input type="hidden" value="${wayfull}" id="wayfull" name="wayfull"/>
<input type="hidden" value="${waysplit}" id="waysplit" name="waysplit"/>
</form>

<div id="piechart_1" style="width: 600px; height: 200px;"></div>
<div id="piechart_2" style="width: 600px; height: 200px;"></div>
<div id="piechart_3" style="width: 600px; height: 200px;"></div>
<div id="barchart_values" style="width: 1000px; height: 400px;"></div>

</body>
</html>