function drawMap(mapPath, svg) {

	var projection = d3.geo.mercator().center([ 116, 39 ]).scale(13000)
			.translate([ mapwidth / 2-2*padding, height+80 ]);

	var path = d3.geo.path().projection(projection);

	var color = d3.scale.category20();//获取20种颜色
	

	d3.json(mapPath, function(error, root) {

		if (error)
			return console.error(error);
		console.log(root.features);

		svg.selectAll("path").data(root.features).enter().append("path").attr(
				"stroke", "#000").attr("stroke-width", 1).attr("fill",
				function(d, i) {
					return color(i);
				}).attr("d", path)
				.on("mouseover", function(d, i) {
					d3.select(this).attr("fill", "yellow");
				})
				.on("mouseout", function(d, i) {
					d3.select(this).attr("fill", color(i));
				})
				.on("click",function(d,i){
					var id = d.properties.id;
					clickBeijing(d, i, id );
				});
		
		//获取中心点坐标
		root.features.forEach(function(d, i) {
			var centroid = path.centroid(d);
			centroid.x = centroid[0];
			centroid.y = centroid[1];
			centroid.id = d.properties.id;
			centroid.name = d.properties.name
			centroid.feature = d;
			nodes.push(centroid);
		});
	});//end json
	
	d3.json("./json/year.json", function(error, root){
		drawAxisTime("beijing_map", svg, root.years, nodes);//读取年份数据
		//第一次进来点击第一年的数据
		circlemouseover("china", null, null, 2006); //点击圆点轴上的时间点
		//$("#"+root.years[0]).click();
});
}

function clickBeijing(clickarea) {

	var name = clickarea.properties.name;
	d3.selectAll(".MyLine").remove();
	d3.selectAll(".MyPic").remove();
	d3.selectAll(".MyText").remove();
	d3.selectAll(".linecircle").remove();
	d3.selectAll(".title").remove();
	d3.selectAll(".tips").remove();
//	d3.selectAll(".axis").remove();
	drawLine();
	drawHis(name,globalyear);
}