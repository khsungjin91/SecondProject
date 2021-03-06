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
  
  
  // 레이더 차트
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