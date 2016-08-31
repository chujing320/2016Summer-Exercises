<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height: 100%">
   <head>
       <meta charset="utf-8">
       <title>北京市12个监测点空气质量</title>
   </head>
   <body style="height: 100%; margin: 0">
       <div id="container" style="height: 100%"></div>
	<script src="./js/echarts.js">	</script>
	<!-- 引入百度地图扩展 -->
	<script src="./js/bmap.min.js"></script>
	<script src="./js/china.js"></script>
	<script src="./js/world.js"></script>
	<script src="map/js/beijing.js"></script>
	<script src="./jquery-3.1.0.js"></script>
	<script src="./js/dataTool.min.js"></script>
       <script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
var geoCoordMap = {
		//注意经纬度！不要弄反了！
		"万寿西宫":[116.366,39.8673],
		"定陵":[116.17,40.2865],
		"东四":[116.434,39.9522],
		"天坛":[116.434,39.8745],
		"农展馆":[116.473,39.9716],
		"官园":[116.361,39.9425],
		"海淀区万柳":[116.315,39.9934],
		"顺义新城":[116.72,40.1438],
		"怀柔镇":[116.644,40.3937],
		"昌平镇":[116.23,40.1952],
		"奥体中心":[116.407,40.0031],
		"古城":[116.225,39.9279],
    
};

var convertData = function (data) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
        var geoCoord = geoCoordMap[data[i].name];
        if (geoCoord) {
            res.push(geoCoord.concat(data[i].value));
        }
    }
    return res;
};

option = {
    title: {
        text: '北京市12个监测点空气质量',
        subtext: 'data from PM25.in',
        sublink: 'http://www.pm25.in',
        left: 'center',
        textStyle: {
            color: '#fff'
        }
    },
    backgroundColor: '#404a59',
    visualMap: {
        min: 0,
        max: 500,
        splitNumber: 5,
        inRange: {
            color: ['#d94e5d','#eac736','#50a3ba'].reverse()
        },
        textStyle: {
            color: '#fff'
        }
    },
    geo: {
        map: '北京',
        label: {
            emphasis: {
                show: false
            }
        },
        roam: true,
        itemStyle: {
            normal: {
                areaColor: '#323c48',
                borderColor: '#111'
            },
            emphasis: {
                areaColor: '#2a333d'
            }
        }
    },
    series: [{
        name: 'AQI',
        type: 'heatmap',
        coordinateSystem: 'geo',
        data: convertData([
				{name: "万寿西宫", value: 70},
				{name: "定陵", value: 75},
				{name: "东四", value: 77},
				{name: "天坛", value: 84},
				{name: "农展馆", value: 90},
				{name: "官园", value: 80},
				{name: "海淀区万柳", value: 74},
				{name: "顺义新城", value: 65},
				{name: "怀柔镇", value: 75},
				{name: "昌平镇", value: 60},
				{name: "奥体中心", value: 105},
				{name: "古城", value: 107}                              
        ])
    }]
};;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>
   </body>
</html>