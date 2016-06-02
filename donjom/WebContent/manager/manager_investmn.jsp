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
    	var b = ${b};
    	var r = ${r};
    	var p = ${p};
    	var c = ${c};
   
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day',{ role: "style" }],
          ["b �����",  b, "blue"],
          ["r �ε���",  r, "blue"],
          ["p ����",  p, "blue"],
          ["c ����㺸", c, "blue"]          
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
    	var wayfull = ${wayfull};
    	var waysplit =${waysplit};
   
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
    	var men =  ${gender_m};
    	var woman = ${gender_w};
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ["����",  men],
          ["����",  woman]
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
    	        
    	        bar: {groupWidth: "55%"},
    	        legend: { position: "none" },
    	      };
      var chart = new google.visualization.BarChart(document.getElementById('barchart_material'));
      chart.draw(view, options_bar);
    }
  </script> 
 
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<h1>
						���� ��Ȳ ���� 
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">������Ȳ </li>
					</ol>
				</div>
			</div>
			</div>
			<hr>
			</div>

	<div class="container">
		
			 <div class="col-sm-12 col-sm-3">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${count}</h3>
				<p>�� ���� ����</p>
            </div>
        </div>
        <!-- ./col -->
		</div>
		<div class="col-sm-12 col-sm-3">
			<div class="small-box bg-aqua">
			<div class="inner">
			<h3>${i_doing}</h3>
			<p>�������� ��ǰ </p>
			</div></div>
		</div>
		<div class="col-sm-12 col-sm-3">
		<div class="small-box bg-aqua">
		<div class="inner">
			 <h3>${i_overend}</h3>
			 <p>�������� ��ǰ </p>
		</div>
		</div>
		</div>
		<div class="col-sm-12 col-sm-3">
		<div class="small-box bg-aqua">
		<div class="inner">
		<h3>${i_refunds}</h3>
		<p>��ȯ���� ��ǰ</p> 
		</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div id="piechart_1" class="box box-primary"></div>
			</div>
			<div class="col-sm-6">
				<div id="piechart_2" class="box box-primary"></div>
			</div>
			<div class="col-sm-6">
				<div id="piechart_3" class="box box-primary"></div>
			</div>
		</div>
		
		<div id="barchart_material" class="box box-primary"></div>
		
	</div>





</body>
</html>