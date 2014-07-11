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
}
