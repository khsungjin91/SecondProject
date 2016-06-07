<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>My first chart using FusionCharts Suite XT</title>
<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/themes/fusioncharts.theme.fint.js?cacheBust=56"></script>
<script type="text/javascript">
  FusionCharts.ready(function(){
    var fusioncharts = new FusionCharts({
    type: 'radar',
    renderAt: 'container',
    width: '500',
    height: '350',
    dataFormat: 'json',
    dataSource: {
    	
        "chart": {
            "caption": "Budget Analysis",
            "subCaption": "Current month",
            "numberPreffix": "$",
            "theme": "fint",
            "radarfillcolor": "#ffffff"
        },
        "categories": [{
            "category": [{
                "label": "Marketing"
            }, {
                "label": "Product Management"
            }, {
                "label": "Customer Service"
            }, {
                "label": "Human Resources"
            }, {
                "label": "Sales & Distribution"
            }]
        }],
        "dataset": [{
            "seriesname": "Allocated Budget",
            "data": [{
                "value": "19000"
            }, {
                "value": "16500"
            }, {
                "value": "14300"
            }, {
                "value": "10000"
            }, {
                "value": "9800"
            }]
        }, {
            "seriesname": "Actual Cost",
            "data": [{
                "value": "6000"
            }, {
                "value": "9500"
            }, {
                "value": "11900"
            }, {
                "value": "8000"
            }, {
                "value": "9700"
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
	            "caption": "Budget Analysis",
	            "subCaption": "Current month",
	            "numberPreffix": "$",
	            "theme": "fint",
	            "radarfillcolor": "#ffffff"
	        },
	        "categories": [{
	            "category": [{
	                "label": "Marketing"
	            }, {
	                "label": "Product Management"
	            }, {
	                "label": "Customer Service"
	            }, {
	                "label": "Human Resources"
	            }, {
	                "label": "Sales & Distribution"
	            }]
	        }],
	        "dataset": [{
	            "seriesname": "Allocated Budget",
	            "data": [{
	                "value": "19000"
	            }, {
	                "value": "16500"
	            }, {
	                "value": "14300"
	            }, {
	                "value": "10000"
	            }, {
	                "value": "9800"
	            }]
	        }, {
	            "seriesname": "Actual Cost",
	            "data": [{
	                "value": "6000"
	            }, {
	                "value": "9500"
	            }, {
	                "value": "11900"
	            }, {
	                "value": "8000"
	            }, {
	                "value": "9700"
	            }]
	        }]
	    }
	}
	);
	    fusioncharts.render();
	});
</script>
</head>
<body>
  <div id="container"></div>
  <div id="chart"></div>
  
</body>
</html>