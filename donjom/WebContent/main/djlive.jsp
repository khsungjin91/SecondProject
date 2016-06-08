<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Radar points</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/patterns.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/themes/fusioncharts.theme.fint.js?cacheBust=56"></script>

<link href="bt/css/styles.css" rel="stylesheet">
<script type="text/javascript">

  FusionCharts.ready(function(){
    var fusioncharts = new FusionCharts({
    type: 'radar',
    renderAt: 'container',
    width: '500',
    height: '380',
    dataFormat: 'json',
    dataSource: {
    	
        "chart": {
            "caption": "��޺�����",
            "numberPreffix": "$",
            "theme": "fint",
            "radarfillcolor": "#ffffff"
        },
        "categories": [{
            "category": [{
                "label": "1��� | V1"
            }, {
                "label": "2��� | V2"
            }, {
                "label": "3��� | V3"
            }, {
                "label": "4��� | V4"
            }, {
                "label": "5��� | V5"
            },{
                "label": "6��� | V6"
            }]
        }],
        "dataset": [{
            "seriesname": "�ſ���",
            "data": [{
                "value": '${avg_interest}'
            }, {
                "value": "20"
            }, {
                "value": "50"
            }, {
                "value": "70"
            }, {
                "value": "10"
            }, {
                "value": "30"
            }]
        }, {
            "seriesname": "DJ���",
            "data": [{
                "value": "300"
            }, {
                "value": "50"
            }, {
                "value": "10"
            }, {
                "value": "40"
            }, {
                "value": "50"
            }, {
                "value": "70"
            }]
        }]
    }
}
);
    fusioncharts.render();
});
  
  
  // ���̴� ��Ʈ
  FusionCharts.ready(function(){
	    var fusioncharts = new FusionCharts({
	    type: 'radar',
	    renderAt: 'chart',
	    width: '500',
	    height: '350',
	    dataFormat: 'json',
	    dataSource: {
	    	
	        "chart": {
	            "caption": "�ݸ��� ����",
	            "numberPreffix": "$",
	            "theme": "fint",
	            "radarfillcolor": "#ffffff"
	        },
	        "categories": [{
	            "category": [{
	                "label": "5~6.9%"
	            }, {
	                "label": "7~8.9%"
	            }, {
	                "label": "9~10.9%"
	            }, {
	                "label": "11~12.9%"
	            }, {
	                "label": "13~14.9%"
	            }, {
	                "label": "15% �̻�"
	            }]
	        }],
	        "dataset": [{
	            "data": [{
	                "value": '${map_r.first}'
	            }, {
	                "value": '${map_r.second}'
	            }, {
	                "value": '${map_r.thirth}'
	            }, {
	                "value": '${map_r.forth}'
	            }, {
	                "value": '${map_r.fifth}'
	            }, {
	                "value": '${map_r.sixth}'
	            }]
	        }]
	    }
	}
	);
	    fusioncharts.render();
	});

 
  
</script>
<style>
#chartdiv3 {
	width	: 100%;
	height	: 350px;
}	
</style>
</head>
<body>

<h3>DJ LIVE</h3>
<div class="container">
	<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header">Doughnut Chart</div>
					<div class="box-body">
						<div class="canvas-wrapper">
							<canvas class="chart" id="doughnut-chart" ></canvas>
						</div>
					</div>
				</div>
			</div>
			</div>
<ul>
<li>���������(��) : ${avg_interest}%</li>
<li>��������� : ${accumulate_loan}��</li>
<li>������ȯ�� : 0��</li>
<li>�ε��� : ${fail_avg}%</li>
</ul>
<table border="1">
<tr>
<td>�δ� ��� �����</td>
<td>���� �����ڼ�</td>
<td>�δ� ��� ���ھ�</td>
<td>���� �����ڼ�</td>
<td>�Ǵ� ��� ���ھ�</td>
<td>���� ���ڰ� ��</td>
</tr> 
<tr>
<td> ${borrow_avg}��</td>
<td>${acc_br_person}��</td>
<td>${person_avg}��</td>
<td>${investperson_total}��</td>
<td>${onebyone_avg}��</td>
<td>${invest_count}��</td>
</tr>
</table>
${map_li.r_twelve}
${map_li.p_twelve}
${map_li.c_twelve}
${map_li.b_twelve}

	<div style="width: 70%; margin: 0 auto; ">
 		<div id="container" style="float: left"></div>
  		<div id="chart" style="float: right"></div>
  	</div>
	<div style="margin-top: 500px">
	<div id="chart_div2"></div>
	</div>
	
	
</body>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
 google.charts.load('current', {'packages':['line', 'corechart']});
      google.charts.setOnLoadCallback(lineChart);

    function lineChart() {
     
      var chartDiv = document.getElementById('chart_div2');
     
      var data = new google.visualization.DataTable();
      data.addColumn('date', 'Month');
      data.addColumn('number', "����");
      data.addColumn('number', "�����");
      data.addColumn('number', "�ε���");
      data.addColumn('number', "����㺸");
      
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
        title: '���� ī�װ� �����',
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