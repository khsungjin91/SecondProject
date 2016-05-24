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
          title: '투자방법 선호도',
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
          title: '미정그래프',
          is3D: false,
          fontSize: '15'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3'));
        chart.draw(data, options);
      }


      
     //bar 그래프
    google.charts.setOnLoadCallback(drawChartbar);
    function drawChartbar() {
    	var user = document.userinput;
    	var twenty = parseInt(user.twenty.value);
    	var thirty = parseInt(user.thirty.value);
    	var forty = parseInt(user.forty.value);
    	var fifty = parseInt(user.fifty.value);
    	var sixty = parseInt(user.sixty.value);
    	var seventy = parseInt(user.seventy.value);
    	var noadult = parseInt(user.noadult.value);
    	
      var data_bar = google.visualization.arrayToDataTable([
        ["Element", "인원수(명)", { role: "style" } ],
        ["20대 미만", noadult, "#b4b4b4"],
        ["20대", twenty, "#828282"],
        ["30대", thirty, "#787878"],
        ["40대", forty, "#646464"],
        ["50대", fifty, "#505050"],
        ["60대", sixty, "#323232"],
        ["70대 이상", seventy, "black"]
      ]);
 
      var view_bar = new google.visualization.DataView(data_bar);
      view_bar.setColumns([0, 1,
                       { calc: "stringify",
    					 sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
  
      var options_bar = {
        title: "연령대별 투자 현황",
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
<h2> 투자 현황 상태</h2>

총 투자 개수 : ${count} 투자 <br/>

투자진행 상품 : <br/>
투자종료 상품 : <br/>

<form action="#" name="userinput">
<input type="hidden" value="${p}" id="p" name="p"/>
<input type="hidden" value="${b}" id="b" name="b"/>
<input type="hidden" value="${c}" id="c" name="c"/>
<input type="hidden" value="${r}" id="r" name="m"/>
<input type="hidden" value="${wayfull}" id="wayfull" name="wayfull"/>
<input type="hidden" value="${waysplit}" id="waysplit" name="waysplit"/>
<input type="hidden" value="${twenty}" id="twenty" name="twenty"/>
<input type="hidden" value="${thirty}" id="thirty" name="thirty"/>
<input type="hidden" value="${forty}" id="forty" name="forty"/>
<input type="hidden" value="${fifty}" id="fifty" name="fifty"/>
<input type="hidden" value="${sixty}" id="sixty" name="sixty"/>
<input type="hidden" value="${seventy}" id="seventy" name="seventy"/>
<input type="hidden" value="${noadult}" id="noadult" name="noadult"/>
</form>

<div id="piechart_1" style="width: 600px; height: 200px;"></div>
<div id="piechart_2" style="width: 650px; height: 200px;"></div>
<div id="piechart_3" style="width: 600px; height: 200px;"></div>
<div id="barchart_values" style="width: 1000px; height: 400px; border: 1px solid black;"></div>

</body>
</html>