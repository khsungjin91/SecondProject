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
	                "value": '${map.first}'
	            }, {
	                "value": '${map.second}'
	            }, {
	                "value": '${map.thirth}'
	            }, {
	                "value": '${map.forth}'
	            }, {
	                "value": '${map.fifth}'
	            }, {
	                "value": '${map.sixth}'
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
	height	: 500px;
}	
</style>
</head>
<body>

<h3>DJ LIVE</h3>
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
<td> ${borrow_avg}</td>
<td>${acc_br_person}</td>
<td>${person_avg}</td>
<td>${investperson_total}</td>
<td>${onebyone_avg}</td>
<td>${invest_count}</td>
</tr>
</table>
	<div style="width: 70%; margin: 0 auto; ">
 		<div id="container" style="float: left"></div>
  		<div id="chart" style="float: right"></div>
  	</div>
	<div id="chartdiv3" style="padding-top:  50px">?</div>
</body>
 
<script>
	
var chart = AmCharts.makeChart("chartdiv3", {
    "type": "serial",
    "theme": "light",
    "marginRight": 80,
    "marginTop": 17,
    "autoMarginOffset": 20,
    "dataProvider": [{
        "date": "2015-04",
        "�����": 20,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2015-05",
        "�����": 75,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2015-06",
        "�����": 15,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2015-07",
        "�����": 75,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2015-08",
        "�����": 158,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2015-09",
        "�����": 57,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2015-10",
        "�����": 107,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2015-11",
        "price": 89,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2015-12",
        "�����": 75,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2016-01",
        "�����": 132,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2016-02",
        "�����": 158,
        "����㺸": 500,
        "����" : 250,
        "�ε���" : 1000
    }, {
        "date": "2016-03",
        "�����": 56,
        "����㺸": 104,
        "����" : 455,
        "�ε���" : 2000
    }, {
        "date": "2016-04",
        "�����": 169,
        "����㺸": 424,
        "����" : 475,
        "�ε���" : 354
    }, {
        "date": "2016-05",
        "�����": 24,
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }, {
        "date": "2016-06",
        "�����": 147, 
        "����㺸": 20,
        "����" : 40,
        "�ε���" : 50
    }],
    "valueAxes": [{
        "logarithmic": true,
        "dashLength": 1,
        "guides": [{
            "dashLength": 6,
            "inside": true,
            "label": "average",
            "lineAlpha": 1,
            "value": 90.4
        }],
        "position": "left"
    }],
    "graphs": [{
        "bullet": "round",
        "id": "g1",
        "bulletBorderAlpha": 1,
        "bulletColor": "#FFFFFF",
        "bulletSize": 7,
        "lineThickness": 2,
        "title": "�����",
        "type": "smoothedLine",
        "useLineColorForBulletBorder": true,
        "valueField": "�����"
    },{
        "bullet": "round",
        "id": "g2",
        "bulletBorderAlpha": 1,
        "bulletColor": "#FFFFFF",
        "bulletSize": 7,
        "lineThickness": 2,
        "title": "����㺸",
        "type": "smoothedLine",
        "useLineColorForBulletBorder": true,
        "valueField": "����㺸"
    },{
        "bullet": "round",
        "id": "g3",
        "bulletBorderAlpha": 1,
        "bulletColor": "#FFFFFF",
        "bulletSize": 7,
        "lineThickness": 2,
        "title": "����",
        "type": "smoothedLine",
        "useLineColorForBulletBorder": true,
        "valueField": "����"
    },{
        "bullet": "round",
        "id": "g4",
        "bulletBorderAlpha": 1,
        "bulletColor": "#FFFFFF",
        "bulletSize": 7,
        "lineThickness": 2,
        "title": "�ε���",
        "type": "smoothedLine",
        "useLineColorForBulletBorder": true,
        "valueField": "�ε���"
    }],
    "chartCursor": {
        "valueLineEnabled": true,
        "valueLineBalloonEnabled": true,
        "valueLineAlpha": 0.5,
        "fullWidth": true,
        "cursorAlpha": 0.05
    },
    "dataDateFormat": "YYYY-MM",
    "categoryField": "date",
    "categoryAxis": {
        "parseDates": true
    },
    "export": {
        "enabled": true
    }
});

chart.addListener("dataUpdated", zoomChart);

function zoomChart() {
	 chart.zoomToDates(new Date(2015, 4), new Date(2016, 6));
}

	
</script>
</body>
</html>