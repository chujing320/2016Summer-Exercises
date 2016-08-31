<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>北京市公交路线图</title>
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
    <div id="main" style="width: 1500px;height:800px;"></div>
    <script type="text/javascript">
    var define;
    	//初始化地图框架
   		var myChart = echarts.init(document.getElementById('main'));
   	//	myChart.showLoading();
    
   		$.get('./map/json/lines-bus.json', function(data) {
   		    var busLines = [].concat.apply([], data.map(function (busLine, idx) {
   		        var prevPt;
   		        var points = [];
   		        for (var i = 0; i < busLine.length; i += 2) {
   		            var pt = [busLine[i], busLine[i + 1]];
   		            if (i > 0) {
   		                pt = [
   		                    prevPt[0] + pt[0],
   		                    prevPt[1] + pt[1]
   		                ];
   		            }
   		            prevPt = pt;

   		            points.push([pt[0] / 1e4, pt[1] / 1e4]);
   		        }
   		        return {
   		            coords: points
   		        };
   		    }));
   		    myChart.setOption(option = {
   		    	 // 加载 bmap 组件
   		        bmap: {
   		            center: [116.46, 39.92],
   		            // 百度地图缩放
   		            zoom: 10,
   		            // 是否开启拖拽缩放，可以只设置 'scale' 或者 'move'
   		            roam: true,
   		            mapStyle: {
   		              styleJson: [{
   		                    'featureType': 'water',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'color': '#d1d1d1'
   		                    }
   		                }, {
   		                    'featureType': 'land',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'color': '#f3f3f3'
   		                    }
   		                }, {
   		                    'featureType': 'railway',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'visibility': 'off'
   		                    }
   		                }, {
   		                    'featureType': 'highway',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'color': '#fdfdfd'
   		                    }
   		                }, {
   		                    'featureType': 'highway',
   		                    'elementType': 'labels',
   		                    'stylers': {
   		                        'visibility': 'off'
   		                    }
   		                }, {
   		                    'featureType': 'arterial',
   		                    'elementType': 'geometry',
   		                    'stylers': {
   		                        'color': '#fefefe'
   		                    }
   		                }, {
   		                    'featureType': 'arterial',
   		                    'elementType': 'geometry.fill',
   		                    'stylers': {
   		                        'color': '#fefefe'
   		                    }
   		                }, {
   		                    'featureType': 'poi',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'visibility': 'off'
   		                    }
   		                }, {
   		                    'featureType': 'green',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'visibility': 'off'
   		                    }
   		                }, {
   		                    'featureType': 'subway',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'visibility': 'off'
   		                    }
   		                }, {
   		                    'featureType': 'manmade',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'color': '#d1d1d1'
   		                    }
   		                }, {
   		                    'featureType': 'local',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'color': '#d1d1d1'
   		                    }
   		                }, {
   		                    'featureType': 'arterial',
   		                    'elementType': 'labels',
   		                    'stylers': {
   		                        'visibility': 'off'
   		                    }
   		                }, {
   		                    'featureType': 'boundary',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'color': '#fefefe'
   		                    }
   		                }, {
   		                    'featureType': 'building',
   		                    'elementType': 'all',
   		                    'stylers': {
   		                        'color': '#d1d1d1'
   		                    }
   		                }, {
   		                    'featureType': 'label',
   		                    'elementType': 'labels.text.fill',
   		                    'stylers': {
   		                        'color': '#999999'
   		                    }
   		                }]
   		            }
   		        },
   		        series: [{
   		            type: 'lines',
   		            coordinateSystem: 'bmap',
   		            polyline: true,
   		            data: busLines,
   		            silent: true,
   		            lineStyle: {
   		                normal: {
   		                    color: '#c23531',
   		                    color: 'rgb(200, 35, 45)',
   		                    opacity: 0.2,
   		                    width: 1
   		                }
   		            },
   		            progressiveThreshold: 500,
   		            progressive: 200
   		        }]
   		    });
   		});
   	
    </script>
</body>
</html>