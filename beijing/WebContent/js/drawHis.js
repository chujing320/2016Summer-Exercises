function drawHis(areaName,year){//所点击的区域的名字和年份
	  
	  var data = Array.apply(0, Array(12)).map(function(item, i) {
	    return {date: i++, datatwo: parseInt(Math.random() * 100)}
	  });

	  // 定义circle的半径
	  var r0 = 5,r1 = 8;

	  // 定义动画持续时间
	  var duration = 500;

	  var x = d3.scale.linear()
	    .range([20, 20+linewidth]);

	  var y = d3.scale.linear()
	    .range([lineheight+50,50]);

	  var xAxis = d3.svg.axis()
	    .scale(x)
	    .orient('bottom')
	 //   .tickFormat(d3.time.format('%d'))
	    .ticks(12);

	  var yAxis = d3.svg.axis()
	    .scale(y)
	    .orient('left')
	    .ticks(10);

	  //设置折线属性
	  var line = d3.svg.line()
	    .x(function(d) { return x(d.date)+(mapwidth+4*padding)-10; })
	    .y(function(d) { return y(d.datatwo)+lineheight+12; })
	    .interpolate('monotone');

	  var flagLine = d3.svg.line()
	    .x(function(d) { return x(d.x); })
	    .y(function(d) { return y(d.y); });

	  show();
	  function show() {
		  
	      x.domain([0,d3.max(data, function(d) { return d.date; })]);
	      y.domain([0, d3.max(data, function(d) { return d.datatwo; })]);

	      svg.append('text')
	        .attr('class', 'title')
	        .text(areaName+"的"+year+"年的数据直方图和折线图")
	        .attr('x', mapwidth+linewidth/2)
	        .attr('y', padding-10);
	      //添加x轴
	      svg.append('g')
	        .attr("class", "MyLine")
	        .attr("transform","translate("+ (mapwidth+4*padding-padding/2) + "," + (2*lineheight+2*padding)  + ")")
	        .call(xAxis);
	      
	      //添加y轴
	      svg.append('g')
	         .attr("class","MyLine")
	         .attr("transform","translate("+ (mapwidth+4*padding+10) + "," + (lineheight+padding/2)  + ")")
	         .call(yAxis);
	   
	      //添加折线
	      var path = svg.append('path')
	      .attr('class', 'MyLine')
	      .attr("transform","translate(0,0)")
	      .attr('d', line(data));
	      
	      var temp = timecircles;
	      
	      var update = svg.append('g').selectAll('circle').data(data);
	      var enter = update.enter();

	        enter
	        .append('g')//添加一个新的<g>标记
	        .append('circle')
	        .attr('class', 'linecircle')
	        .attr('cx', line.x())
	        .attr('cy', line.y())
	        .attr('r', r0)
	        .on('mouseover', function() {
	          d3.select(this).transition().duration(duration).attr('r', r1);
	        })
	        .on('mouseout', function() {
	          d3.select(this).transition().duration(duration).attr('r', r0);
	        });

	      var tips = svg.append('g').attr('class', 'tips');

	      tips.append('rect')
	        .attr('class', 'tips-border')
	        .attr('width', 200)
	        .attr('height', 50)
	        .attr('rx', 10)
	        .attr('ry', 10);

	      var wording1 = tips.append('text')
	        .attr('class', 'tips-text')
	        .attr('x', 10)
	        .attr('y', 20)
	        .text('');

	      var wording2 = tips.append('text')
	        .attr('class', 'tips-text')
	        .attr('x', 10)
	        .attr('y', 40)
	        .text('');

	      update.on('mousemove', function() {
	          var m = d3.mouse(this),
	          cx = m[0]-mapwidth-4*padding ;//用于确定当前的鼠标离哪个x坐标值更近
	          dcx = m[0];
	          dcy = m[1]
	          showWording(cx);
	          d3.select('.tips').style('display', 'block');
	        })
	        .on('mouseout', function() {
	          d3.select('.tips').style('display', 'none');
	        });

	      function showWording(cx) {
	        var x0 = x.invert(cx);	//返回该横坐标实际对应的值
	        var i = (d3.bisector(function(d) {
	          return d.date;
	        }).left)(data, x0, 1);

	        var d0 = data[i - 1],
	          d1 = data[i] || {},
	          d = x0 - d0.date > d1.date - x0 ? d1 : d0;
	          
	        wording1.text(year+areaName);
	        wording2.text('折线数据：' + d.datatwo);

	        d3.select('.tips')
	          .attr('transform', 'translate(' +dcx+ ',' + dcy + ')');
	      }
	    }

//	    draw();
	  }
