# Scatterplot example
# uses plotframe.coffee

scatterplot = () ->

    d3.json "Data/scatterplot.json", (weights) ->

      svgscale = plotframe weights, {chartname: "div#scatterplot", xlab:"Week 1 weight (g)", ylab:"Week 2 weight (g)", height: 700, width: 720,
      pad: {bottom: 90, left: 100, top: 0, right: 10, scale: 0.05}, tickPadding: 8}

      pointcolor = (d) -> if d.sex is "FEMALE"
                                  "#58E858" # green
                             else
                                  "#B10DC9" # purple

      svgscale.svg.selectAll("circle", {chartname: "#scatterplot"})
        .data(weights)
        .enter()
        .append("circle")
        .attr("cx", (d) -> svgscale.x d.x)
        .attr("cy", (d) -> svgscale.y d.y)
        .attr("r", 5)
        .attr("fill", pointcolor)
        .on("mouseover", -> d3.select(this).transition().attr("fill", "black"))
        .on("mouseover.tooltip", (d,i) ->
            svgscale.svg.append("text").text(i+1).attr("id", "tooltip")
              .attr("x", svgscale.x(d.x)+10).attr("y", svgscale.y(d.y)).attr("fill","black")
              .attr("opacity",0).style("font-family", "sans-serif").transition().attr("opacity", 1))
        .on("mouseout", (d) ->
              d3.select(this).transition().duration(500).attr("fill", pointcolor)
              d3.selectAll("#tooltip").transition().duration(500).attr("opacity",0).remove())


stop_scatterplot = () ->
    d3.selectAll("div#scatterplot svg").remove()
