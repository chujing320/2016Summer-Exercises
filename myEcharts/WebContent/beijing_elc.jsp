<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>北京各区一天用电量</title>
<!-- 引入 echarts.js -->
<script src="js/echarts.js"></script>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 600px; height: 400px;"></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		// 指定图表的配置项和数据
		option = {
			title : {
				text : '一天用电量分布',
				subtext : '纯属虚构'
			},
			tooltip : {
				trigger : 'axis'
			},
			toolbox : {
				show : true,
				feature : {
					saveAsImage : {}
				}
			},
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : [ '00:00', '01:15', '02:30', '03:45', '05:00', '06:15',
						'07:30', '08:45', '10:00', '11:15', '12:30', '13:45',
						'15:00', '16:15', '17:30', '18:45', '20:00', '21:15',
						'22:30', '23:45' ]
			},
			yAxis : {
				type : 'value',
				axisLabel : {
					formatter : '{value} W'
				}
			},
			visualMap : {
				show : false,
				dimension : 0,
				pieces : [ {
					lte : 6,
					color : 'green'
				}, {
					gt : 6,
					lte : 8,
					color : 'red'
				}, {
					gt : 8,
					lte : 14,
					color : 'green'
				}, {
					gt : 14,
					lte : 17,
					color : 'red'
				}, {
					gt : 17,
					color : 'green'
				} ]
			},
			series : [ {
				name : '用电量',
				type : 'line',
				smooth : true,
				data : [ 300, 280, 250, 260, 270, 300, 550, 500, 400, 390, 380,
						390, 400, 500, 600, 750, 800, 700, 600, 400 ],
				markArea : {
					data : [ [ {
						name : '早高峰',
						xAxis : '07:30'
					}, {
						xAxis : '10:00'
					} ], [ {
						name : '晚高峰',
						xAxis : '17:30'
					}, {
						xAxis : '21:15'
					} ] ]
				}
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>
</body>
</html>