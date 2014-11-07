stickies_on = true

handle_stickies = () ->
    # add text about removing/adding sticky notes
    stickies = d3.selectAll("section")
                 .append("p")
                 .attr("class", "remove_stickies")
                 .text("Remove stickies")
                 .style("opacity", 0)
                 .on("mouseover", () ->
                     d3.select(this).style("opacity", 1)
                     d3.select("p.remove_stickies").style("opacity", 1) if stickies_on)
                 .on("mouseout", () ->
                     d3.select(this).style("opacity", 0)
                     d3.select("p.remove_stickies").style("opacity", 1) if stickies_on)

    # make first one opaque
    d3.select("p.remove_stickies").style("opacity", 1)

    stickies.on "click", () ->
          if(stickies_on)
              stickies_on = false
              d3.selectAll("p.remove_stickies").text("Show stickies")
              d3.selectAll("aside").style("opacity", 0)
                                   .style("pointer-events", "none")
              d3.selectAll("a").style("border-bottom", "none")
          else
              stickies_on = true
              d3.selectAll("p.remove_stickies").text("Remove stickies")
              d3.selectAll("aside").style("opacity", 1)
                                   .style("pointer-events", "auto")
              d3.selectAll("a").style("border-bottom", "")
                               .style("border-bottom", "dotted 1px #555;")
              d3.select("p.remove_stickies").style("opacity", 1)

handle_stickies()
