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
            "caption": "등급별분포",
            "numberPreffix": "$",
            "theme": "fint",
            "radarfillcolor": "#ffffff"
        },
        "categories": [{
            "category": [{
                "label": "1등급 | V1"
            }, {
                "label": "2등급 | V2"
            }, {
                "label": "3등급 | V3"
            }, {
                "label": "4등급 | V4"
            }, {
                "label": "5등급 | V5"
            },{
                "label": "6등급 | V6"
            }]
        }],
        "dataset": [{
            "seriesname": "신용등급",
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
            "seriesname": "DJ등급",
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
	            "caption": "금리별 분포",
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
	                "label": "15% 이상"
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
<li>평균이자율(연) : ${avg_interest}%</li>
<li>누적대출액 : ${accumulate_loan}원</li>
<li>누적상환액 : 0원</li>
<li>부도율 : ${fail_avg}%</li>
</ul>
<table border="1">
<tr>
<td>인당 평균 대출액</td>
<td>누적 대출자수</td>
<td>인당 평균 투자액</td>
<td>누적 투자자수</td>
<td>건당 평균 투자액</td>
<td>누적 투자건 수</td>
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
        "사업자": 20,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2015-05",
        "사업자": 75,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2015-06",
        "사업자": 15,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2015-07",
        "사업자": 75,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2015-08",
        "사업자": 158,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2015-09",
        "사업자": 57,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2015-10",
        "사업자": 107,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2015-11",
        "price": 89,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2015-12",
        "사업자": 75,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2016-01",
        "사업자": 132,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2016-02",
        "사업자": 158,
        "매출담보": 500,
        "개인" : 250,
        "부동산" : 1000
    }, {
        "date": "2016-03",
        "사업자": 56,
        "매출담보": 104,
        "개인" : 455,
        "부동산" : 2000
    }, {
        "date": "2016-04",
        "사업자": 169,
        "매출담보": 424,
        "개인" : 475,
        "부동산" : 354
    }, {
        "date": "2016-05",
        "사업자": 24,
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
    }, {
        "date": "2016-06",
        "사업자": 147, 
        "매출담보": 20,
        "개인" : 40,
        "부동산" : 50
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
        "title": "사업자",
        "type": "smoothedLine",
        "useLineColorForBulletBorder": true,
        "valueField": "사업자"
    },{
        "bullet": "round",
        "id": "g2",
        "bulletBorderAlpha": 1,
        "bulletColor": "#FFFFFF",
        "bulletSize": 7,
        "lineThickness": 2,
        "title": "매출담보",
        "type": "smoothedLine",
        "useLineColorForBulletBorder": true,
        "valueField": "매출담보"
    },{
        "bullet": "round",
        "id": "g3",
        "bulletBorderAlpha": 1,
        "bulletColor": "#FFFFFF",
        "bulletSize": 7,
        "lineThickness": 2,
        "title": "개인",
        "type": "smoothedLine",
        "useLineColorForBulletBorder": true,
        "valueField": "개인"
    },{
        "bullet": "round",
        "id": "g4",
        "bulletBorderAlpha": 1,
        "bulletColor": "#FFFFFF",
        "bulletSize": 7,
        "lineThickness": 2,
        "title": "부동산",
        "type": "smoothedLine",
        "useLineColorForBulletBorder": true,
        "valueField": "부동산"
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