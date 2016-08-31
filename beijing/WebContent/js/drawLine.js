function drawLine(){
	
	  //生成随机数组
	  var data = Array.apply(0, Array(12)).map(function(item, i) {
	    i++;
	    return {date: i, pv: parseInt(Math.random() * 100)}
	  });

	  var dataset =[];
	  for (i=0;i<12;i++){
		  dataset[i]=data[i].pv;
	  }
	
		
	//x轴的比例尺
	var xScale = d3.scale.ordinal()
	//	.domain(d3.extent(dataset, function(d) { return d.date; }))
		.domain(d3.range(12))
		.rangeRoundBands([0, linewidth ]);

	  var x = d3.scale.linear()
	    // .domain([0, 100])
	    .range([0, linewidth]);
	  
	//y轴的比例尺 yScale = y
	var yScale = d3.scale.linear()
		.domain([0,d3.max(dataset)])
	//	.domain([0, d3.max(dataset, function(d) { return d.value; })])
		.range([lineheight , 0]);//由于y轴正方向向下，所以用反比例尺

	  var y = d3.scale.linear()
	    // .domain([0, 100])
	    .range([lineheight, 0]);
	 
	//定义x轴
	var xAxis = d3.svg.axis()
		.scale(xScale)
		.orient("bottom");

	//定义y轴
	var yAxis = d3.svg.axis()
		.scale(yScale)
		.orient("left");

	//矩形之间的空白
	var rectPadding = 4;

	//添加矩形元素
	var rects = svg.selectAll(".MyRect")
		.data(dataset)
		.enter()
		.append("rect")
		.attr("class", "MyPic")
		.attr("transform","translate("+ (mapwidth+4*padding) + "," + padding  + ")")
		.attr("x", function(d,i){
			return xScale(i) + rectPadding/2;
		} )
		.attr("y",function(d){
			return yScale(d);
		})
		.attr("width", xScale.rangeBand() - rectPadding )
		.attr("height", function(d){
			return lineheight - yScale(d);
		})
		.attr("fill","#f79e9e")
		.on("mouseover",function(d,i){
			d3.select(this).attr("fill","#bbbbbb");
		})
		.on("mouseout",function(d,i){
			d3.select(this).transition().duration(500).attr("fill","#f79e9e");
		});
	
	//添加x轴
	svg.append("g")
		.attr("class", "MyLine")
		.attr("transform","translate("+ (mapwidth+4*padding) + "," + (lineheight+padding)  + ")")
		.call(xAxis);
	
		
	//添加y轴
	svg.append("g")
		.attr("class", "MyLine")
		.attr("transform","translate("+ (mapwidth+4*padding) + "," + (padding)  + ")")
		.call(yAxis);
	
	//添加文字元素
	var texts = svg.selectAll(".MyText")
		.data(dataset)
		.enter()
		.append("text")
		.attr("class","MyText")
		.attr("transform","translate(" + (mapwidth+3*padding+30) + ",22)")
		.attr("x", function(d,i){
			return xScale(i) + rectPadding/2;
		} )
		.attr("y",function(d){
			return yScale(d);
		})
		.attr("dx",function(){
			return (xScale.rangeBand() - rectPadding)/2;
		})
		.attr("dy",function(d){
			return 20;
		})
		.text(function(d){
			return d;
		});
}