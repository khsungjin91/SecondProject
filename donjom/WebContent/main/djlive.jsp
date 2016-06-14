<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Radar points</title>
<jsp:include page="/main/script.jsp"/>
<script type="text/javascript" src="main/chartMain.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/header.jsp"/>
<div class="container">
	
	<h2 class="box-header text-center">DJ LIVE</h2>

<ul class="title-djlive list-inline text-center">
			<li>
			<div class="title-djlive">평균이자율(연)</div> ${avg_interest}%</li>
			<li><div class="title-djlive">누적 대출액</div><fmt:formatNumber value="${accumulate_loan}" pattern="#,###" /> 원</li>
			<li><div class="title-djlive">누적상환액</div><fmt:formatNumber value="${refunds_price}" pattern="#,###" />원</li>
			<li><div class="title-djlive">부도율</div> ${fail_avg}%</li>
		</ul>
		<div class="col-sm-8 col-sm-offset-2">
<div class="box box-success text-center">
	
	<table class="table">
		<tr>
			<td>인당 평균 대출액</td>
			<td>누적 대출자수</td>
			<td>인당 평균 투자액</td>
			<td>누적 투자자수</td>
			<td>건당 평균 투자액</td>
			<td>누적 투자건 수</td>
		</tr> 
		<tr>
			<td><fmt:formatNumber value="${borrow_avg}" pattern="#,###" />원</td>
			<td>${acc_br_person}명</td>
			<td><fmt:formatNumber value="${person_avg}" pattern="#,###" />원</td>
			<td>${investperson_total}명</td>
			<td><fmt:formatNumber value="${onebyone_avg}" pattern="#,###" />원</td>
			<td>${invest_count}건</td>
		</tr>
	</table>
</div></div>
	<div class="col-sm-6">
	 <div class="box box-success">
 		<div id="container" class="chartbox"></div>
 		</div>
 		</div>
 		<div class="col-sm-6">
 		<div class="box box-success">
  		<div id="chart" class="chartbox"></div>
  		</div>
  	</div>
  	<div class="col-sm-12">
	<div class="box box-success">
		<div id="chart_div2"></div>
	</div>
	</div>
	
	</div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
 google.charts.load('current', {'packages':['line', 'corechart']});
      google.charts.setOnLoadCallback(lineChart);

    function lineChart() {
     
      var chartDiv = document.getElementById('chart_div2');
     
      var data = new google.visualization.DataTable();
      data.addColumn('date', 'Month');
      data.addColumn('number', "개인");
      data.addColumn('number', "사업자");
      data.addColumn('number', "부동산");
      data.addColumn('number', "매출담보");
      
      data.addRows([
        [new Date('${map_l.m1}'),  parseInt('${map_l.p_one}'),  parseInt('${map_l.b_one}'), parseInt('${map_l.r_one}'), parseInt('${map_l.c_one}')],
        [new Date('${map_l.m2}'),  parseInt('${map_l.p_two}'),  parseInt('${map_l.b_two}'), parseInt('${map_l.r_two}'), parseInt('${map_l.c_two}')],
        [new Date('${map_l.m3}'),  parseInt('${map_l.p_three}'),  parseInt('${map_l.b_three}'), parseInt('${map_l.r_three}'), parseInt('${map_l.c_three}')],
        [new Date('${map_l.m4}'),  parseInt('${map_l.p_four}'), parseInt('${map_l.b_four}'), parseInt('${map_l.r_four}'), parseInt('${map_l.c_four}')],
        [new Date('${map_l.m5}'),  parseInt('${map_l.p_five}'), parseInt('${map_l.b_five}'), parseInt('${map_l.r_five}'), parseInt('${map_l.c_five}')],
        [new Date('${map_l.m6}'),  parseInt('${map_l.p_six}'), parseInt('${map_l.b_six}'), parseInt('${map_l.r_six}'), parseInt('${map_l.c_six}')],
        [new Date('${map_l.m7}'),  parseInt('${map_l.p_seven}'), parseInt('${map_l.b_seven}'), parseInt('${map_l.r_seven}'), parseInt('${map_l.c_seven}')],
        [new Date('${map_l.m8}'),  parseInt('${map_l.p_eghit}'), parseInt('${map_l.b_eghit}'), parseInt('${map_l.r_eghit}'), parseInt('${map_l.c_eghit}')],
        [new Date('${map_l.m9}'),  parseInt('${map_l.p_nine}'), parseInt('${map_l.b_nine}'), parseInt('${map_l.r_nine}'), parseInt('${map_l.c_nine}')],
        [new Date('${map_l.m10}'), parseInt('${map_l.p_ten}') ,  parseInt('${map_l.b_ten}'), parseInt('${map_l.r_ten}'), parseInt('${map_l.c_ten}')],
        [new Date('${map_l.m11}'), parseInt('${map_l.p_eleven}'),  parseInt('${map_l.b_eleven}'), parseInt('${map_l.r_eleven}'), parseInt('${map_l.c_eleven}')],
        [new Date('${map_l.m12}'), parseInt('${map_l.p_twelve}'),  parseInt('${map_l.b_twelve}'), parseInt('${map_l.r_twelve}'), parseInt('${map_l.c_twelve}')]
      ]);



      var classicOptions = {
        title: '월별 카테고리 대출금',
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
          ticks: [new Date('${map_l.m12}'), new Date('${map_l.m11}'), new Date('${map_l.m10}'), new Date('${map_l.m9}'),
                  new Date('${map_l.m8}'),  new Date('${map_l.m7}'), new Date('${map_l.m6}'), new Date('${map_l.m5}'),
                  new Date('${map_l.m4}'), new Date('${map_l.m3}'), new Date('${map_l.m2}'), new Date('${map_l.m1}')
                 ]
        },
        vAxis: {
          viewWindow: {
            max: 60000
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
<script src="bt/js/chart-data.js"></script>
<script src="bt/js/easypiechart.js"></script>
<script src="bt/js/chart.min.js"></script>

</body>
</html>