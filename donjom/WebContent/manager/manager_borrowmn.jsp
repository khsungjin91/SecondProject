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
    	var b = ${b};
    	var r = ${r};
    	var p = ${p};
    	var c = ${c};
   
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['b 사업자',	b],
          ['r 부동산',  	r],
          ['p 개인',    	p],
          ['c 매출담보', 	c]          
        ]);

        var options = {
          title: '카테고리별 대출현황',
          height: 350,
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
            height: 350,
         
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
 		var max = ${max};
 		
 		var all_avg1 = ${all_avg1}; 	var sc_avg1= ${sc_avg1};
 		var all_avg2 = ${all_avg2};		var sc_avg2= ${sc_avg2};
 		var all_avg3 = ${all_avg3};		var sc_avg3= ${sc_avg3};
 		var all_avg4 = ${all_avg4};		var sc_avg4= ${sc_avg4};
 		var all_avg5 = ${all_avg5};		var sc_avg5= ${sc_avg5};
 		var all_avg6=${all_avg6};		var sc_avg6= ${sc_avg6};
 		var all_avg7=${all_avg7};		var sc_avg7= ${sc_avg7};
 		var all_avg8=${all_avg8};		var sc_avg8= ${sc_avg8};
 		var all_avg9=${all_avg9};		var sc_avg9= ${sc_avg9};
 		var all_avg10=${all_avg10};		var sc_avg10= ${sc_avg10};
 		var all_avg11=${all_avg11};		var sc_avg11= ${sc_avg11};
 		var all_avg12=${all_avg12};		var sc_avg12= ${sc_avg12};
 		
    	 
    	var chartDiv = document.getElementById('chart_div');

  	    var data = new google.visualization.DataTable();
  	    data.addColumn('date', 'Month');
   	    data.addColumn('number', "all_Average ");
   	   	data.addColumn('number', "success_Average");
       

   	    data.addRows([
         [new Date(now, 0), all_avg1,	sc_avg1],
         [new Date(now, 1), all_avg2,	sc_avg2],
         [new Date(now, 2), all_avg3,	sc_avg3],
         [new Date(now, 3), all_avg4,	sc_avg4],
         [new Date(now, 4), all_avg5,	sc_avg5],
         [new Date(now, 5),  all_avg6,	sc_avg6],
         [new Date(now, 6),  all_avg7,	sc_avg7],
         [new Date(now, 7),  all_avg8,	sc_avg8],
         [new Date(now, 8),  all_avg9,	sc_avg9],
         [new Date(now, 9),  all_avg10,	sc_avg10],
         [new Date(now, 10), all_avg11,	sc_avg11],
         [new Date(now, 11), all_avg12,	sc_avg12]
       ]);

       var classicOptions = {
        /*  title: '올해 월별 평균 대출액', */
        
         height: 350,
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
             max: max+10000
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
	<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
    <div class="container">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          대출 심사  
          <small>현황 그래프</small>
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li><a href="#">Layout</a></li>
          <li class="active">Top Navigation</li>
        </ol>
      </section>

      <!-- Main content -->
			<section class="content">
			<div class="row">
				
					<div id="br_requestList" class="col-md-12">
					<div class="box box-primary">
						<table class="table table-bordered">
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

					</div>
					</div>
			
			
				<div class="col-md-12">
					
						<div class="box box-primary">
						 <div class="box-header with-border">
              <h3 class="box-title">올해 월별 평균 대출액</h3>
			  </div>
							<div class="box-body">
								<div id="chart_div"></div>
							</div>
						</div>
					</div>
					
				<div class="col-md-6">
				<div class="box box-primary">
						 <div class="box-header with-border">
              <h3 class="box-title">나이, 성별에 따른 대출현황</h3>
			  </div>
							<div class="box-body">
								<div id="barchart_material" ></div>
							</div>
						</div>
					
				</div>
				
					<div class="col-md-6">
				<div class="box box-primary">
						 <div class="box-header with-border">
              <h3 class="box-title">카테고리별 대출현황</h3>
			  </div>
							<div class="box-body">
							<div id="piechart_3d" ></div>
							</div>
						</div>
					
				</div>
				
				
					
				
				
			</div>
		</div>
	</div>


</body>
</html>