<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>北京市地图与图表联动</title>
<!-- 实现北京市地图与各区一天用电量和各区ipone销量联动 --> 
</head>
<body>
	<!--为ECHARTS准备一个具备大小的DOM -->
	<div id="main" style=" height: 400px"></div>
	<div id="main2" style=' height: 400px;'></div>
	<div id="main3" style=' height: 400px;'></div>
	<!-- ECHARTS单文件引入 -->
	<script src="./js/echarts-2.1.js"></script>
	<script src="map/js/beijing.js"></script>

	<script>
		//路径配置
		require.config({
			paths : {
				echarts : './js'
			}
		});
		//使用
		require([ 'echarts', 'echarts/chart/line', 'echarts/chart/bar',//使用柱状图就加载BAR模块 按需加载
		'echarts/chart/scatter', 'echarts/chart/k', 'echarts/chart/pie',
				'echarts/chart/radar', 'echarts/chart/force',
				'echarts/chart/chord', 'echarts/chart/gauge',
				'echarts/chart/funnel', 'echarts/chart/eventRiver',
				'echarts/chart/venn', 'echarts/chart/treemap',
				'echarts/chart/tree', 'echarts/chart/wordCloud',
				'echarts/chart/heatmap', 'echarts/chart/map' ], function(ec) {
					
					
			//随机函数
			 function randomData() {
				return Math.round(Math.random()*1000);
			}
					
			//基于准备好的DOM 初始化ECHARTS图表
			var myChart = ec.init(document.getElementById('main'));

			var option = {
				title : {
					text : '北京市地图&人口密度&ipone销量及各区一天用电量',
					subtext : '数据纯属捏造~',
				    left: 'center'
					
				},
				tooltip : {
					trigger : 'item'
				},
				legend: {
				x:'right',
				selectedMode:false,
				data:['海淀区']
				},
				toolbox: {
                    show : true,
                    orient: 'vertical',
                    x:'right',
                    y:'center',
                    feature : {
						mark : {show: true},
						dataView : {show: true, readOnly: false}
                    }
                 },	
				dataRange : {
					orient : 'horizontal',
					min : 0,
					max : 55000,
					text : [ '高', '低' ], // 文本，默认为数值文本
					splitNumber : 0
				},
				series : [ {
					name : '北京市各区人口密度',
					type : 'map',
					mapType : '北京',
					mapLocation : {
						x : 'left'
					},
					selectedMode : 'multiple',
					itemStyle : {
						normal : {
							label : {
								show : true
							}
						},
						emphasis : {
							label : {
								show : true
							}
						}
					},
					data : [ 
					        {name: '东城区', value: 52257.34,ivalue:randomData(),
						     elcvalue:[ 320, 380, 350, 300, 280, 330, 590, 520, 450, 420,
							380, 410, 400, 560, 980, 750, 600, 710, 630, 450 ]
						    },
   		                    {name: '西城区', value: 50977.48,ivalue:randomData(),
							 elcvalue:[ 330, 340, 310, 290, 270, 350, 580, 510, 430, 400,
							380, 400, 440, 530, 610, 770, 810, 710, 640, 460 ]
							},
   		                    {name: '朝阳区', value: 53686.6,ivalue:randomData(),
							 elcvalue:[ 350, 310, 300, 290, 330, 360, 600, 620, 500, 440,
							400, 410, 420, 550, 660, 770, 880, 790, 690, 490 ]
							},
   		                    {name: '石景山区', value: 9992.3,ivalue:randomData(),
							 elcvalue:[ 280, 270, 230, 240, 260, 290, 540, 490, 390, 380,
							390, 400, 410, 490, 590, 760, 790, 690, 560, 390 ]
							},
   		                    {name: '海淀区', value: 43945.49,ivalue:randomData(),selected:true,
							 elcvalue:[ 300, 280, 250, 260, 270, 300, 550, 500, 400, 390,
							380, 390, 400, 500, 600, 750, 800, 700, 600, 400 ]
							},
   		                    {name: '门头沟区', value: 2389.56,ivalue:randomData(),
							 elcvalue:[ 280, 260, 230, 240, 250, 280, 500, 480, 380, 350,
							340, 380, 390, 480, 580, 720, 770, 670, 570, 370 ]}
							,
   		                    {name: '通州区', value: 35140.45,ivalue:randomData(),
							 elcvalue:[ 310, 290, 240, 270, 290, 320, 500, 550, 450, 400,
							370, 400, 410, 510, 610, 750, 810, 720, 610, 400 ]
							},
   		                    {name: '顺义区', value: 43604.77,ivalue:randomData(),
							 elcvalue:[ 260, 290, 290, 250, 280, 310, 560, 470, 390, 380,
							380, 410, 420, 520, 620, 760, 810, 720, 680, 430 ]
							},
   		                    {name: '昌平区', value: 31900.23,ivalue:randomData(),
							 elcvalue:[ 310, 320, 300, 360, 370, 300, 580, 510, 410, 380,
							390, 500, 520, 480, 600, 770, 790, 710, 600, 450 ]
							},
							{name:'房山区', value:12512.3,ivalue:randomData(),
							 elcvalue:[ 290, 300, 310, 390, 370, 400, 580, 510, 410, 370,
							400, 490, 500, 460, 610, 770, 800, 700, 620, 450 ]
							},
							{name:'崇文区', value:9582,ivalue:randomData(),
							 elcvalue:[ 290, 330, 310, 370, 390, 300, 580, 510, 410, 370,
							390, 490, 500, 460, 620, 790, 790, 720, 620, 430 ]
							},
   		                    {name: '大兴区', value: 9918.16,ivalue:randomData(),
							 elcvalue:[ 220, 280, 230, 280, 270, 310, 510, 480, 400, 380,
							385, 390, 410, 520, 610, 700, 840, 700, 660, 410 ]},
   		                    {name: '怀柔区', value: 10361.84,ivalue:randomData(),
							 elcvalue:[ 380, 360, 350, 360, 370, 400, 550, 600, 500, 490,
							480, 490, 450, 590, 660, 790, 880, 750, 620, 410 ]
							},
   		                    {name: '平谷区', value: 4178.01,ivalue:randomData(),
							 elcvalue:[ 200, 180, 150, 260, 170, 200, 450, 400, 300, 490,
							280, 290, 300, 400, 500, 650, 700, 600, 500, 320 ]
							},
   		                    {name: '密云县', value: 2227.92,ivalue:randomData(),
							 elcvalue:[ 250, 230, 200, 210, 220, 250, 500, 450, 350, 340,
							330, 350, 350, 450, 550, 700, 750, 650, 550, 350 ]
							},
   		                    {name: '延庆县', value: 5180.98,ivalue:randomData(),
   		                     elcvalue:[ 190, 210, 250, 260, 270, 300, 550, 500, 450, 410,
   	   		 							380, 390, 400, 500, 650, 750, 850, 710, 610, 360 ]
   		                    },
   		                    {name: '丰台区', value: 3222.98,ivalue:randomData(),
   		                     elcvalue:[ 180, 190, 250, 270, 370, 400, 550, 500, 420, 360,
   		 							380, 490, 500, 480, 500, 670, 780, 700, 600, 350 ]
   		                    }
                 
					]
				},//series[0]
				{
					name : '北京各区ipone6s销量及比例',
					type : 'pie',
					radius : '55%',
					center: ['50%', 225],
	
					data : [ 
					{name: '海淀区',value:randomData()},
					]
				},//series[1]
		
				],
				animation : false
			};

			//为ECHARTS对象加载数据
			myChart.setOption(option);

			//第二项图表
		
			var myChart2 = ec.init(document.getElementById('main2'));
			option2 = {
				title : {
					text :'一天用电量分布',
					subtext : '纯属虚构',
					x : 'center'
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
					data : [ '00:00', '01:15', '02:30', '03:45', '05:00',
							'06:15', '07:30', '08:45', '10:00', '11:15',
							'12:30', '13:45', '15:00', '16:15', '17:30',
							'18:45', '20:00', '21:15', '22:30', '23:45' ],
				
				},
				yAxis : {
					type : 'value',
					axisLabel : {
						formatter : '{value} W'
					}
				},
				series : [ {
					name : '用电量',
					type : 'line',
					smooth : true,
					data : [ 300, 280, 250, 260, 270, 300, 550, 500, 400, 390,
							380, 390, 400, 500, 600, 750, 800, 700, 600, 400 ],
				} //series[0]
				
				]// end series
				
			};

			myChart2.setOption(option2);
			
			//定义对象/数组深拷贝函数
			var cloneObj = function(obj){
			    var str, newobj = obj.constructor === Array ? [] : {};
			    if(typeof obj !== 'object'){
			        return;
			    } else if(window.JSON){
			        str = JSON.stringify(obj), //系列化对象
			        newobj = JSON.parse(str); //还原
			    } else {
			        for(var i in obj){
			            newobj[i] = typeof obj[i] === 'object' ? 
			            cloneObj(obj[i]) : obj[i]; 
			        }
			    }
			    return newobj;
			};

			
			//鼠标选择器
			var ecConfig = require('echarts/config');
			var preselected
			var selected;
			var first = true;
			myChart.on(ecConfig.EVENT.MAP_SELECTED, function(param) {
				if(!first){
					preselected = cloneObj(selected);//深拷贝
				}
				selected = cloneObj(param.selected);//深拷贝
				var mapSeries = option.series[0];
				var idata = [];
				var elcdata = [];
				var legendData = [];
				var name;
				var is = true;
				
				for (var p = 0, len = mapSeries.data.length; p < len; p++) {
					name = mapSeries.data[p].name;
					//如果区域前一次状态与后一次不一致，则这次选中的为该区域
					if(first){
						if(name != "海淀区" && selected[name]){
							option2.series[0].data = mapSeries.data[p].elcvalue;
							first = false;
							break;
						}
					}
					else if( is && selected[name]!=preselected[name]) {
						is = false;
						option2.series[0].data = mapSeries.data[p].elcvalue;
					}
				}
				
				for (var p = 0, len = mapSeries.data.length; p < len; p++) {
					name = mapSeries.data[p].name;
					
					//mapSeries.data[p].selected = selected[name];
					if (selected[name]) {
						idata.push({
							name : name,
							value : mapSeries.data[p].ivalue

						});
			
						legendData.push(name);
					}
				}
				option.legend.data = legendData;
				option.series[1].data = idata;
				myChart.setOption(option, true);
				myChart2.setOption(option2, true);
			})

			//           myChart2.connect(myChart3);
			//           myChart3.connect(myChart2);

			setTimeout(function() {
				window.onresize = function() {
					myChart.resize();
					myChart2.resize();
				}
			}, 200)
		});
	</script>
</body>
</html>