current_slide = null;

slide_transition = function(slidenumber) {
  console.log("transition " + current_slide + " -> " + slidenumber);

  if(slidenumber == current_slide) return;
  current_slide = slidenumber;


  if(slidenumber==3) {
    d3.select("font#fadeout_applied").transition().duration(3000).ease("linear").style("opacity", 0.2);
  }
  if(slidenumber==2) {
    d3.select("font#fadeout_applied").style("opacity", 1);
  }
  if(slidenumber==4) {
    d3.select("font#fadeout_applied").style("opacity", 0.2);
  }

  if(slidenumber==4) {
    d3.select("h3#fadeout_appliedstat").transition().duration(2000).ease("linear").style("opacity", 0)
    d3.select("h3#fadein_datasci").transition().delay(1500).duration(4000).ease("linear").style("opacity", 1);
  }
  if(slidenumber==3) {
    d3.select("h3#fadeout_appliedstat").style("opacity", 1);
    d3.select("h3#fadein_datasci").style("opacity", 0);
  }
  if(slidenumber==5) {
    d3.select("h3#fadeout_appliedstat").style("opacity", 0);
    d3.select("h3#fadein_datasci").style("opacity", 1);
  }

}
