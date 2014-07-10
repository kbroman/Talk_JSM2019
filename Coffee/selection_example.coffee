# simple example to show that it can be frustrating to select small things

w = 1280
h = 660
r = [3, 6]
rsel = 10
pad = r[1]*2
colors = ["#7CF07C", "#6baed6"]
hilit = "Orchid"

svg = d3.select("div#selection_example")
        .append("svg")
        .attr("height", h)
        .attr("width", w)

n = 500
rand_pts = []
for i in [0...n]
    rand_pts[i] =
        x:Math.floor(Math.random()*(w-2*pad)+pad),
        y:Math.floor(Math.random()*(h-2*pad)+pad),
        size:Math.floor(Math.random()*2),
        selsize:Math.floor(Math.random()*2)
    
circ = svg.selectAll("empty")
          .data(rand_pts)
          .enter()
          .append("circle")
          .attr("id", (d,i) -> "circ#{i}")
          .attr("cx", (d) -> d.x)
          .attr("cy", (d) -> d.y)
          .attr("r", (d) -> r[d.size])
          .attr("fill", (d) -> colors[d.selsize])
          .attr("stroke", "none")
          .style("pointer-events", "none")

svg.selectAll("empty")
   .data(rand_pts)
   .enter()
   .append("circle")
   .attr("cx", (d) -> d.x)
   .attr("cy", (d) -> d.y)
   .attr("r", (d) ->
      return rsel if d.selsize==1
      r[d.size])
   .attr("stroke", "none")
   .attr("fill", hilit)
   .attr("opacity", 0)
   .on "mouseover", (d,i) ->
       d3.select("circle#circ#{i}").attr("opacity", 0)
       d3.select(this).attr("opacity", 1)
   .on "mouseout", (d,i) ->
       d3.select(this).attr("opacity", 0)
       d3.select("circle#circ#{i}").attr("opacity", 1)
