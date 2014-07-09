# simple example to show coffeescript with jsfiddle
# http://jsfiddle.net/kbroman/cfscr/91/

# in the html part:
# <div id="chart"></div>

h = 400
w = 400

svg = d3.select("div#chart")
        .append("svg")
        .attr("height", h)
        .attr("width", w)

pad = 10
r = 5
plain = "slateblue"
hilit = "Orchid"

n = 10
rand_pts = []
for i in [0...n]
    rand_pts[i] =
        x:Math.random()*(w-2*pad)+pad,
        y:Math.random()*(h-2*pad)+pad
    
svg.selectAll("empty")
   .data(rand_pts)
   .enter()
   .append("circle")
   .attr("cx", (d) -> d.x)
   .attr("cy", (d) -> d.y)
   .attr("r", r)
   .attr("fill", plain)
   .attr("stroke", "black")
   .on "mouseover", () ->
       d3.select(this).attr("fill", hilit).attr("r", r*2)
   .on "mouseout", () ->
       d3.select(this).attr("fill", plain).attr("r", r)
