stickies_on = true

handle_stickies = () ->
    d3.select("p#remove_stickies")
      .on "click", () ->
            if(stickies_on)
                stickies_on = false
                d3.select(this).text("Show stickies")
                               .on("mouseover", () ->
                                   d3.select(this).style("opacity", 1))
                               .on("mouseout", () ->
                                   d3.select(this).style("opacity", 0))
                d3.selectAll("aside").style("opacity", 0)
                                     .style("pointer-events", "none")
                d3.selectAll("a").style("border-bottom", "none")
            else
                stickies_on = true
                d3.select(this).text("Remove stickies")
                               .on("mouseover", () -> [])
                               .on("mouseout", () -> [])
                d3.selectAll("aside").style("opacity", 1)
                                     .style("pointer-events", "auto")
                d3.selectAll("a").style("border-bottom", "")
                                 .style("border-bottom", "dotted 1px #555;")

handle_stickies()
