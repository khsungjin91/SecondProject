<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Radar points</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/radar.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/none.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/patterns.js"></script>


<style type="text/css">
#chartdiv {
	width		: 400px;
	height		: 300px;
	font-size	: 11px;
}
#chartdiv2 {
	width		: 400px;
	height		: 300px;
	font-size	: 11px;
	margin-left: 100px;
}			
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

	<div style="width: 70%; margin: 0 auto">
	<div id="chartdiv" style="float: left;">?</div>
	<div id="chartdiv2" style="float: right;">?</div>
	</div>
	<div id="chartdiv3" style="">?</div>
	  <div id="chart"></div>    
<script>
var chart = AmCharts.makeChart( "chartdiv2", {
	  "type": "radar",
	  "theme": "none",
	  "dataProvider": [ {
	    "country": "Czech Republic",
	    "litres": 156.9
	  }, {
	    "country": "Ireland",
	    "litres": 131.1
	  }, {
	    "country": "Germany",
	    "litres": 115.8
	  }, {
	    "country": "Australia",
	    "litres": 109.9
	  }, {
	    "country": "Austria",
	    "litres": 108.3
	  }, {
	    "country": "UK",
	    "litres": 99
	  } ],
	  "valueAxes": [ {
	    "minimum": 0,
	    "axisAlpha": 0.15
	  } ],
	  "startDuration": 5,
	  "graphs": [ {
	    "balloonText": "[[value]] litres of beer per year",
	    "bullet": "round",
	    "valueField": "litres"
	  } ],
	  "titles": [
	             {
	               "size": 20,
	               "text": "�ݸ��� ����"
	  } ],
	  "categoryField": "country",
	  "export": {
	    "enabled": true
	  }
	} );
	
	
var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "radar",
	  "theme": "none",
	  "dataProvider": [ {
	    "Level": "1��� | V1",
	    "litres": 156.9
	  }, {
	    "Level": "2��� | V2",
	    "litres": 131.1
	  }, {
	    "Level": "3��� | V3",
	    "litres": 115.8
	  }, {
	    "Level": "4��� | V4",
	    "litres": 109.9
	  }, {
	    "Level": "5��� | V5",
	    "litres": 108.3
	  }, {
	    "Level": "6��� | V6",
	    "litres": 99
	  } ],
	  "valueAxes": [ {
	    "minimum": 0,
	    "axisAlpha": 0.15
	  } ],
	  "startDuration": 5,
	  "graphs": [ {
		"title": "Graph title",
	    "balloonText": "[[value]] test",
	    "bullet": "round",
	    "valueField": "litres"
	  } ],
	  "titles": [
	             {
	               "size": 15,
	               "text": "��޺� ������"
	  } ],
	  "categoryField": "Level",
	  "export": {
	    "enabled": true
	  }
	} );
	
	
var chart = AmCharts.makeChart("chartdiv3", {
    "type": "serial",
    "theme": "patterns",
    "legend": {
        "useGraphSettings": true
    },
    "dataProvider": [{
        "year": 1930,
        "italy": 1,
        "germany": 5,
        "uk": 3
    }, {
        "year": 1934,
        "italy": 1,
        "germany": 2,
        "uk": 6
    }, {
        "year": 1938,
        "italy": 2,
        "germany": 3,
        "uk": 1
    }, {
        "year": 1950,
        "italy": 3,
        "germany": 4,
        "uk": 1
    }, {
        "year": 1954,
        "italy": 5,
        "germany": 1,
        "uk": 2
    }, {
        "year": 1958,
        "italy": 3,
        "germany": 2,
        "uk": 1
    }, {
        "year": 1962,
        "italy": 1,
        "germany": 2,
        "uk": 3
    }, {
        "year": 1966,
        "italy": 2,
        "germany": 1,
        "uk": 5
    }, {
        "year": 1970,
        "italy": 3,
        "germany": 5,
        "uk": 2
    }, {
        "year": 1974,
        "italy": 4,
        "germany": 3,
        "uk": 6
    }, {
        "year": 1978,
        "italy": 1,
        "germany": 2,
        "uk": 4
    }],
    "valueAxes": [{
        "integersOnly": true,
        "maximum": 6,
        "minimum": 1,
        "reversed": true,
        "axisAlpha": 0,
        "dashLength": 5,
        "gridCount": 10,
        "position": "left",
        "title": "Place taken"
    }],
    "startDuration": 0.5,
    "graphs": [{
        "balloonText": "place taken by Italy in [[category]]: [[value]]",
        "bullet": "round",
        "hidden": true,
        "title": "Italy",
        "valueField": "italy",
		"fillAlphas": 0
    }, {
        "balloonText": "place taken by Germany in [[category]]: [[value]]",
        "bullet": "round",
        "title": "Germany",
        "valueField": "germany",
		"fillAlphas": 0
    }, {
        "balloonText": "place taken by UK in [[category]]: [[value]]",
        "bullet": "round",
        "title": "United Kingdom",
        "valueField": "uk",
		"fillAlphas": 0
    }],
    "chartCursor": {
        "cursorAlpha": 0,
        "zoomable": false
    },
    "categoryField": "year",
    "categoryAxis": {
        "gridPosition": "start",
        "axisAlpha": 0,
        "fillAlpha": 0.05,
        "fillColor": "#000000",
        "gridAlpha": 0,
        "position": "top"
    },
    "export": {
    	"enabled": true,
        "position": "bottom-right"
     }
});

	
</script>
</body>
</html>