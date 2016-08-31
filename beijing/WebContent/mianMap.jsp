<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>D3北京地图</title>
</head>
<style>
#map {
		height: auto;
		margin: 3px;
		background-color: #FFE4C4;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
	}

	.overlay {
	  fill: none;
	  pointer-events: all;
	}
	#tooltip {
			position: absolute;
			width: 180px;
			height: auto;
			padding: 10px;
			background-color: #f29292;
			-webkit-border-radius: 10px;
			-moz-border-radius: 10px;
			border-radius: 10px;
			-webkit-box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
			-moz-box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
			box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
			pointer-events: none;
		}
		#tooltip.hidden {
			display: none;
		}
		#tooltip p {
			margin: 0;
			font-family: "Microsoft YaHei";
			font-size: 16px;
			line-height: 20px;
		}
		
	.axis path,
	.axis line{
		fill: none;
		stroke: black;
		shape-rendering: crispEdges;
	}

	.axis text {
		font-family: sans-serif;
		font-size: 13px;
	}

	.MyText {
		fill: #666666;
		text-anchor: middle;
	}
	.MyLine{
		fill: none;
		stroke: black;
		shape-rendering: crispEdges;
	}
	.MyPic{

		shape-rendering: crispEdges;
	}
		
<!--*************************************************-->

.title {
  text-anchor: middle;
  font-weight: 700;
  font-family: "Microsoft YaHei";
  fill: #5ba3e5;
}

.line {
  fill: none;
  stroke: steelblue;
  stroke-width: 1.5px;
}

.linecircle {
  fill: #f7a9a9;
}
.linecircle:hover {
  fill: #999999;
}
.flag {
  stroke: gray;
  stroke-dasharray: 5;
  stroke-width: 1.5;
  display: none;
  pointer-events: none;
}
.tips {
  pointer-events: none;
  display: none;
  font-family: "Microsoft YaHei";
 
}
.tips-border {
  fill: #ffffff;
  stroke: gray;        
  stroke-width: 2;
}

</style>
<body>
	<div id="tooltip" class="hidden" style="color:#ffffff">
			<p><strong>区域：</strong><span id="province">100</span></p>
			<p><strong>年份：</strong><span id="year">100</span></p>
			<p><strong>总和：</strong><span id="sum">100</span></p>
			<p><strong>第一产业：</strong><span id="industry1">100</span></p>
			<p><strong>第二产业：</strong><span id="industry2">100</span></p>
			<p><strong>第三产业：</strong><span id="industry3">100</span></p>
	</div>
<div id="map"></div>

<script src="./js/d3/d3.js"></script>
<script src="./js/drawMap.js"></script>
<script src="./js/util.js"></script>
<script src="./js/timeaxis.js"></script>
<script src="./js/drawPie.js"></script>
<script src="./js/drawLine.js"></script>
<script src="./js/drawHis.js"></script>

<script>
	var mapwidth  = 520;
	var mapheight = 520;
	var totalmaxvalue=10000;
	var totalminvalue=10;
	var namelabeldy=50;
	var namelabeldx=30;
	var provinceDataYear;

	var globalyear = 2006;
	var timeheight = 60;
	var background = "#D1EEEE";
	var overColor = "#F08080";

	//定义折线图和柱形图的宽度和高度
	var padding = 30;
	var linewidth = 450;
	var lineheight = (mapheight+timeheight)/2-padding;
	
	//总体框架的宽和高
	var width = mapwidth+width;
	var height = mapheight+timeheight-padding;
	
	var svg = d3.select("body").append("svg")
	    .attr("width", width+6*padding)
	    .attr("height", height+2*padding)
	    .append("g")
	    .attr("transform", "translate(0,0)");
	
	var mapPath = "./json/beijing_map.json";
	drawMap(mapPath, svg);	//画出北京地图

	var nodes = [];
	var provinceNodes = [];
	var coutiesNodes = [];
	var provinceId = "";
	var coutiesId = "";
	var timecircles;
	var textColor= "black";
	
	
</script>

</body>
</html>