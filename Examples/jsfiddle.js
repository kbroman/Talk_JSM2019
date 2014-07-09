// Simple example to show jsfiddle
// http://jsfiddle.net/kbroman/v4qhh/

// in the html part:
// <div id="chart"></div>

h = 500;
w = 500;

svg = d3.select("div#chart")
        .append("svg")
        .attr("height", h)
        .attr("width", w);

pad = 5;
r = 5;
plain = "slateblue";
hilit = "Orchid";

n = 10;
rand_pts = [];
for(i=0; i<n; i++)
    rand_pts[i] = {x:Math.random()*(w-2*pad)+pad, 
                   y:Math.random()*(h-2*pad)+pad}
    
svg.selectAll("empty")
   .data(rand_pts)
   .enter()
   .append("circle")
   .attr("cx", function(d) { return(d.x); })
   .attr("cy", function(d) { return(d.y); })
   .attr("r", r)
   .attr("fill", plain)
   .attr("stroke", "black")
   .on("mouseover", function() { 
       d3.select(this).attr("fill", hilit).attr("r", r*2);
     })
   .on("mouseout", function() { 
       d3.select(this).attr("fill", plain).attr("r", r);
     });