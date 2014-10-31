stickies_on = true

handle_stickies = () ->
    d3.select("p#remove_stickies")
      .on "click", () ->
            if(stickies_on)
                stickies_on = false
                d3.select(this).text("Show stickies")
                d3.selectAll("aside").style("opacity", 0)
                                     .style("pointer-events", "none")
                d3.selectAll("a").style("border-bottom", "none")
            else
                stickies_on = true
                d3.select(this).text("Remove stickies")
                d3.selectAll("aside").style("opacity", 1)
                                     .style("pointer-events", "auto")
                d3.selectAll("a").style("border-bottom", "")
                                 .style("border-bottom", "dotted 1px #555;")

handle_stickies()
