<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>北京市各区人口密度</title>
	<script src="./js/echarts.js"></script>
	<script src="jquery-3.1.0.js"></script>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 1000px;height:800px;"></div>
    <script type="text/javascript">
    	//初始化地图框架
   		var myChart = echarts.init(document.getElementById('main'));
   		myChart.showLoading();
    
   		$.get('./map/json/beijing.json', function (geoJson) {

   		    myChart.hideLoading();

   		    echarts.registerMap('beijing', geoJson);

   		    myChart.setOption(option = {
   		        title: {
   		            text: '北京各区人口密度 （2016）',
   		            subtext: '数据纯属捏造',
   		        },
   		        tooltip: {
   		            trigger: 'item',
   		            formatter: '{b}<br/>{c} (p / km2)'
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
   		        visualMap: {
   		            min: 1000,
   		            max: 55000,
   		            text:['High','Low'],
   		            realtime: false,
   		            calculable: true,
   		            inRange: {
   		                color: ['lightskyblue','yellow', 'orangered']
   		            }
   		        },
   		        series: [
   		            {
   		                name: '北京各区人口密度',
   		                type: 'map',
   		                mapType: 'beijing', // 自定义扩展图表类型
   		                itemStyle:{
   		                    normal:{label:{show:true}},
   		                    emphasis:{label:{show:true}}
   		                },
   		                data:[
   		                    {name: '东城区', value: 52257.34},
   		                    {name: '西城区', value: 50977.48},
   		                    {name: '朝阳区', value: 53686.6},
   		                    {name: '石景山区', value: 9992.3},
   		                    {name: '海淀区', value: 43945.49},
   		                    {name: '门头沟区', value: 2389.56},
   		                    {name: '房山区', value: 19659.72},
   		                    {name: '通州区', value: 35140.45},
   		                    {name: '顺义区', value: 43604.77},
   		                    {name: '昌平区', value: 31900.23},
   		                    {name: '大兴区', value: 9918.16},
   		                    {name: '怀柔区', value: 10361.84},
   		                    {name: '平谷区', value: 4178.01},
   		                    {name: '密云县', value: 2227.92},
   		                    {name: '延庆县', value: 5180.98},
   		                    {name: '丰台区', value: 3222.98},
   		            	    {name:'宣武区', value:2582},
                    	    {name:'崇文区', value:1582},
   		                ],
   		                
   		            }
   		        ]
   		    });
   		});
   		
    </script>
</body>
</html>