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
          ["���νſ�",  b, "blue"],
          ["�ε���",  r, "blue"],
          ["�����",  p, "blue"],
          ["����㺸", c, "blue"]          
        ]);

        var options = {
          title: 'ī�װ��� ������Ȳ',
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
          ["���ݸ��� �Ͻû�ȯ",  wayfull, "blue"],
          ["������ �յ��ȯ",  waysplit, "blue"]        
        ]);

        var options = {
          title: '���ڹ�� ��ȣ��',
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
          ["���νſ�",  b, "blue"],
          ["�ε���",  r, "blue"],
          ["�����",  p, "blue"],
          ["����㺸", c, "blue"]          
        ]);

        var options = {
          title: '�����׷���',
          is3D: false,
          fontSize: '15'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3'));
        chart.draw(data, options);
      }


      
     //bar �׷���
  
    google.charts.setOnLoadCallback(drawChart2);
    function drawChart2() {
    	
    	var user = document.userinput;
    	var twenty = parseInt(user.twenty.value);
    	var thirty = parseInt(user.thirty.value);
    	var forty = parseInt(user.forty.value);
    	var fifty = parseInt(user.fifty.value);
    	var sixty = parseInt(user.sixty.value);
    	var seventy = parseInt(user.seventy.value);
    	var noadult = parseInt(user.noadult.value);
    	
      var data = google.visualization.arrayToDataTable([                                                 
		['����', '����', '����'],
		['80���̻�', 40, 20],
		['60-80', 0, 23.3],
		['50-60', 10, 4.5],
		['40-50', 10, 14.3],
		['30-40', 10, 0.9],
		['20-30', 20, 13.1],
		['20���̸�', 20, 13.1]
      ]);
      
      var view = new google.visualization.DataView(data);
      
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
      
      var options_bar = {
    	        title: "���ɴ뺰 ���� ��Ȳ",
    	        width: 1000,
    	        height: 400,
    	        bar: {groupWidth: "55%"},
    	        legend: { position: "none" },
    	      };
      
      var chart = new google.visualization.BarChart(document.getElementById('barchart_material'));

      chart.draw(view, options_bar);
    }
     
  </script>
  
  
<body>
<h2> ���� ��Ȳ ����</h2>

�� ���� ���� : ${count} ���� <br/>

�������� ��ǰ : <br/>
�������� ��ǰ : <br/>

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
<div id="barchart_material" style="width: 1000px; height: 400px; border: 1px solid black;"></div>

</body>
</html>