<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Radar points</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<script  src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js"></script>
	<script  src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.js"></script>
	
</head>
<body onload="doOnLoad();">
	<canvas id="myChart" width="100" height="100"></canvas>
<script>
var ctx = document.getElementById("myChart");
var data = {
	    labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling"],
	    datasets: [
	        {
	            label: "My First dataset",
	            backgroundColor: "rgba(179,181,198,0.2)",
	            borderColor: "rgba(179,181,198,1)",
	            pointBackgroundColor: "rgba(179,181,198,1)",
	            pointBorderColor: "#fff",
	            pointHoverBackgroundColor: "#fff",
	            pointHoverBorderColor: "rgba(179,181,198,1)",
	            data: [65, 59, 90, 81, 56, 51]
	        },
	        {
	            label: "My Second dataset",
	            backgroundColor: "rgba(255,99,132,0.2)",
	            borderColor: "rgba(255,99,132,1)",
	            pointBackgroundColor: "rgba(255,99,132,1)",
	            pointBorderColor: "#fff",
	            pointHoverBackgroundColor: "#fff",
	            pointHoverBorderColor: "rgba(255,99,132,1)",
	            data: [28, 48, 40, 19, 96, 27]
	        }
	    ]
	};
var myChart = new Chart(ctx, {
    type: "radar",
    data: 
        data
    ,
    options: {
        scale: {
            reverse: true,
            ticks: {
                beginAtZero: true
            }
        }
}
});
</script>
</body>
</html>