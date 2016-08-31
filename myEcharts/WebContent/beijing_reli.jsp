<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>北京市地势热力图</title>
	<script src="./js/echarts.js">	</script>
	<!-- 引入百度地图扩展 -->
	<script src="./js/bmap.min.js"></script>
	<script src="./js/china.js"></script>
	<script src="./js/world.js"></script>
	<script src="./jquery-3.1.0.js"></script>
	<script src="./js/dataTool.min.js"></script>
	<!--引入百度地图的jssdk -->
	<script src="http://api.map.baidu.com/api?v=2.0&ak=tcb74cWaAwskE7efrZdYl6pMqPA8fV94"></script>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 1400px;height:800px;"></div>
    <script type="text/javascript">
    	//初始化地图框架
   		var myChart = echarts.init(document.getElementById('main'));
   	//	myChart.showLoading();
    
   		$.get('map/json/beijing-track.json', function (data) {

   		    var points = [].concat.apply([], data.map(function (track) {
   		        return track.map(function (seg) {
   		            return seg.coord.concat([1]);
   		        });
   		    }));
   		    myChart.setOption(option = {
   		        animation: false,
   		        bmap: {
   		            center: [116.418757,39.94111],
   		            zoom: 14,
   		            roam: true
   		        },
   		        visualMap: {
   		            show: false,
   		            top: 'top',
   		            min: 0,
   		            max: 5,
   		            seriesIndex: 0,
   		            calculable: true,
   		            inRange: {
   		                color: ['blue', 'blue', 'green', 'yellow', 'red']
   		            }
   		        },
   		        series: [{
   		            type: 'heatmap',
   		            coordinateSystem: 'bmap',
   		            data: points,
   		            pointSize: 5,
   		            blurSize: 6
   		        }]
   		    });
   		    if (!app.inNode) {
   		        // 添加百度地图插件
   		        var bmap = myChart.getModel().getComponent('bmap').getBMap();
   		        bmap.addControl(new BMap.MapTypeControl());
   		    }
   		});

   		
    </script>
</body>
</html>