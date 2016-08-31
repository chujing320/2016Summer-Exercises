<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>北京市各区人口密度</title>
	<script src="./js/echarts.js"></script>
	<script src="map/js/beijing.js"></script>
</head>
<body> 
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 1000px;height:800px;"></div>
    <script type="text/javascript">
    	//初始化地图框架
   		var myChart = echarts.init(document.getElementById('main'));
   	//	myChart.showLoading();
   		function randomData() {
   		    return Math.round(Math.random()*1000);
   		}

   		option = {
   		    title: {
   		        text: 'iphone销量',
   		        subtext: '纯属虚构',
   		        left: 'center'
   		    },
   		    tooltip: {
   		        trigger: 'item'
   		    },
   		    legend: {
   		        orient: 'vertical',
   		        left: 'left',
   		        data:['iphone5','iphone6','iphone6s']
   		    },
   		    visualMap: {
   		        min: 0,
   		        max: 2500,
   		        left: 'left',
   		        top: 'bottom',
   		        text: ['高','低'],           // 文本，默认为数值文本
   		        calculable: true
   		    },
   		    toolbox: {
   		        show: true,
   		        orient: 'vertical',
   		        left: 'right',
   		        top: 'center',
   		        feature: {
   		            dataView: {readOnly: false},
   		            restore: {},
   		            saveAsImage: {}
   		        }
   		    },
   		    series: [
   		        {
   		            name: 'iphone5',
   		            type: 'map',
   		            mapType: '北京',
   		            roam: false,
   		            label: {
   		                normal: {
   		                    show: true
   		                },
   		                emphasis: {
   		                    show: true
   		                }
   		            },
   		            data:[
   		                {name: '东城区',value: randomData() },
   		                {name: '西城区',value: randomData() },
   		                {name: '朝阳区',value: randomData() },
   		                {name: '海淀区',value: randomData() },
   		                {name: '门头沟区',value: randomData() },
   		                {name: '石景山区',value: randomData() },
   		                {name: '大兴区',value: randomData() },
   		                {name: '怀柔区',value: randomData() },
   		                {name: '密云县',value: randomData() },
   		                {name: '延庆县',value: randomData() },
   		                {name: '平谷区',value: randomData() },
   		                {name: '昌平区',value: randomData() },
   		                {name: '顺义区',value: randomData() },
   		                {name: '通州区',value: randomData() },
   		                {name: '房山区',value: randomData() },
   		                {name: '丰台区',value: randomData() },
   		            ]
   		        },
   		        {
   		            name: 'iphone6',
   		            type: 'map',
   		            mapType: '北京',
   		            label: {
   		                normal: {
   		                    show: true
   		                },
   		                emphasis: {
   		                    show: true
   		                }
   		            },
   		            data:[
   		                {name: '东城区',value: randomData() },
  		                {name: '西城区',value: randomData() },
  		                {name: '朝阳区',value: randomData() },
  		                {name: '海淀区',value: randomData() },
   		                {name: '大兴区',value: randomData() },
   		                {name: '平谷区',value: randomData() },
		                {name: '昌平区',value: randomData() },
   		                {name: '石景山区',value: randomData() },
   		                {name: '顺义区',value: randomData() },
   		                {name: '丰台区',value: randomData() },
   		                {name: '门头沟区',value: randomData() },
   		                {name: '怀柔区',value: randomData() }
   		            ]
   		        },
   		        {
   		            name: 'iphone6s',
   		            type: 'map',
   		            mapType: '北京',
   		            label: {
   		                normal: {
   		                    show: true
   		                },
   		                emphasis: {
   		                    show: true
   		                }
   		            },
   		            data:[
   		                {name: '东城区',value: randomData() },
 		                {name: '西城区',value: randomData() },
   		                {name: '大兴区',value: randomData() },
   		                {name: '朝阳区',value: randomData() },
		                {name: '海淀区',value: randomData() },
		                {name: '大兴区',value: randomData() },
		                {name: '平谷区',value: randomData() },
   		                {name: '门头沟区',value: randomData() },
   		                {name: '怀柔区',value: randomData() }
   		            ]
   		        }
   		    ]
   		};
   		myChart.setOption(option);
   		
    </script>
</body>
</html>