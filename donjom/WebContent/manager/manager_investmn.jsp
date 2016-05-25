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
    	var men =  parseInt(user.gender_m.value);
    	var women =  parseInt(user.gender_w.value);
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ["����",  men],
          ["����",  women]
        ]);
        var options = {
          title: '���� ����',
          is3D: false,
          fontSize: '15'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart_3'));
        chart.draw(data, options);
      }
     //bar �׷���
  
    google.charts.setOnLoadCallback(drawChart2);
    function drawChart2() {
    	
    	var m_noadult = ${dto.m_noadult};
    	var m_twenty = ${dto.m_twenty};
    	var m_thirty = ${dto.m_thirty};
    	var m_forty = ${dto.m_forty};
    	var m_fifty = ${dto.m_fifty};
    	var m_sixty = ${dto.m_sixty};
    	var m_eighty = ${dto.m_eighty};
    	
    	var w_noadult = ${dto.w_noadult};
    	var w_twenty = ${dto.w_twenty};
    	var w_thirty = ${dto.w_thirty};
    	var w_forty = ${dto.w_forty};
    	var w_fifty = ${dto.w_fifty};
    	var w_sixty = ${dto.w_sixty};
    	var w_eighty = ${dto.w_eighty};
    	
      var data = google.visualization.arrayToDataTable([                                                 
		['����', '����', '����'],
		['80���̻�', m_eighty, w_eighty],
		['60-80', m_sixty, w_sixty],
		['50-60', m_fifty, w_fifty],
		['40-50', m_forty, w_forty],
		['30-40', m_thirty, w_thirty],
		['20-30', m_twenty, w_twenty],
		['20���̸�', m_noadult, w_noadult]
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
<input type="hidden" value="${gender_m}" id="gender_m" name="gender_m"/>
<input type="hidden" value="${gender_w}" id="gender_w" name="gender_w"/>
<input type="hidden" value="${wayfull}" id="wayfull" name="wayfull"/>
<input type="hidden" value="${waysplit}" id="waysplit" name="waysplit"/>
</form>

<div id="piechart_1" style="width: 600px; height: 200px;"></div>
<div id="piechart_2" style="width: 650px; height: 200px;"></div>
<div id="piechart_3" style="width: 600px; height: 200px;"></div>
<div id="barchart_material" style="width: 1000px; height: 400px; border: 1px solid black;"></div>

</body>
</html>