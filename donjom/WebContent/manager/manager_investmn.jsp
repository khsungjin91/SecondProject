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
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	var user = document.userinput;
    	var p = parseInt(user.p.value);
    	var b = parseInt(user.b.value);
    	var c = parseInt(user.c.value);
    	var m = parseInt(user.m.value);
   
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day',{ role: "style" }],
          ["���νſ�",  p, "blue"],
          ["�ε���",  b, "blue"],
          ["�����",  c, "blue"],
          ["����㺸", m, "blue"]          
        ]);

        var options = {
          title: 'ī�װ��� ������Ȳ',
          is3D: false,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }

      
     //bar �׷���
    google.charts.setOnLoadCallback(drawChart2);
    function drawChart2() {
    	
      var data2 = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        ["Copper", 8, "blue"],
        ["Silver", 9, "blue"],
        ["Gold", 200, "blue"],
        ["asd", 8, "blue"],
        ["asdsad", 8, "blue"],
        ["assadd", 8, "blue"]
      ]);
 
      var view2 = new google.visualization.DataView(data2);
      view2.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
  
      var options2 = {
        title: "�׷���",
        width: 1000,
        height: 400,
        bar: {groupWidth: "55%"},
        legend: { position: "none" },
      };
      var chart2 = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart2.draw(view2, options2);
  }
    
  </script>
  
  
<body>

<form action="#" name="userinput">
<input type="hidden" value="${p}" id="p" name="p"/>
<input type="hidden" value="${b}" id="b" name="b"/>
<input type="hidden" value="${c}" id="c" name="c"/>
<input type="hidden" value="${m}" id="m" name="m"/>
</form>

<div id="piechart_3d" style="width: 600px; height: 350px;"></div>
<div id="barchart_values" style="width: 1000px; height: 400px;"></div>

</body>
</html>