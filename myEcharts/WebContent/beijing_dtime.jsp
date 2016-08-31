<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>北京各区动态数据</title>
<!-- 引入 echarts.js -->
<script src="js/echarts.js"></script>
</head>
<body style="height: 100%; margin: 0">
	<div id="main" style="width: 800px; height: 500px;"></div>
	<script type="text/javascript" src="js/echarts.js"></script>
	<script type="text/javascript" src="js/dataTool.min.js"></script>
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));
		var app = {};
		option = null;
		function randomData() {
			now = new Date(+now + oneDay);
			value = value + Math.random() * 21 - 10;
			return {
				name : now.toString(),
				value : [
						[ now.getFullYear(), now.getMonth() + 1, now.getDate() ]
								.join('/'), Math.round(value) ]
			}
		}

		var data = [];
		var now = +new Date(2000, 7, 3);
		var oneDay = 24 * 3600 * 1000;
		var value = Math.random() * 1000;
		for (var i = 0; i < 1000; i++) {
			data.push(randomData());
		}

		option = {
			title : {
				text : '动态数据 + 时间坐标轴'
			},
			tooltip : {
				trigger : 'axis',
				formatter : function(params) {
					params = params[0];
					var date = new Date(params.name);
					return date.getDate() + '/' + (date.getMonth() + 1) + '/'
							+ date.getFullYear() + ' : ' + params.value[1];
				},
				axisPointer : {
					animation : false
				}
			},
			xAxis : {
				type : 'time',
				splitLine : {
					show : false
				}
			},
			yAxis : {
				type : 'value',
				boundaryGap : [ 0, '100%' ],
				splitLine : {
					show : false
				}
			},
			series : [ {
				name : '模拟数据',
				type : 'line',
				showSymbol : false,
				hoverAnimation : false,
				data : data
			} ]
		};

		app.timeTicket = setInterval(function() {

			for (var i = 0; i < 5; i++) {
				data.shift();
				data.push(randomData());
			}

			myChart.setOption({
				series : [ {
					data : data
				} ]
			});
		}, 1000);
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
	</script>
</body>
</html>