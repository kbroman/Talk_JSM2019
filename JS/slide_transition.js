current_slide = null;

slide_transition = function(slidenumber) {
  console.log("transition " + current_slide + " -> " + slidenumber);

  if(slidenumber == current_slide) return;
  current_slide = slidenumber;


  if(slidenumber==3) {
    d3.select("font#fadeout_applied").transition().duration(3000).ease("linear").style("opacity", 0.2);
  }
  if(slidenumber==2 || slidenumber==4) {
    d3.select("font#fadeout_applied").style("opacity", 1);
  }


  if(slidenumber==12) {
    d3.select("p#dotenter").transition()
                           .style("opacity", 1)
                           .delay(20000)
                           .duration(5000)
                           .ease("linear");

  }
}
