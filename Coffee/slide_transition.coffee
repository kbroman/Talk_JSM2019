current_slide = null

get_slide_index = (section_id) ->
   d3.selectAll("section")[0].indexOf(d3.select("##{section_id}").node()) + 1


corr_w_scatter_index = get_slide_index("corr_w_scatter")
lod_and_effect_index = get_slide_index("lod_and_effect")
lod_over_time_index = get_slide_index("lod_over_time")
permutation_index = get_slide_index("permutation")
d3_index = get_slide_index("D3")
scatter_index = get_slide_index("scatterplot")

slide_transition = (slidenumber) ->
    if(navigator.userAgent.includes("Chrome"))
        slidenumber = slidenumber + 1

    console.log("transition #{current_slide} -> #{slidenumber}")

    return if slidenumber == current_slide
    current_slide = slidenumber

    # corr_w_scatter slide
    if slidenumber==corr_w_scatter_index
        console.log("animate corr w scatter slide")
        corr_w_scatter()
    if slidenumber==corr_w_scatter_index-1 or slidenumber==corr_w_scatter_index+1
        stop_corr_w_scatter()

    # eda example
    if slidenumber==scatter_index
        console.log("animate scatter slide")
        scatterplot()
    if slidenumber==scatter_index-1 or slidenumber==scatter_index+1
        stop_scatterplot()


    # lod_and_effect slide
    if slidenumber==lod_and_effect_index
        console.log("animate lod_and_effect slide")
        d3.json("Data/insulinlod.json", draw_lod_and_effect)
    if slidenumber==lod_and_effect_index-1 or slidenumber==lod_and_effect_index+1
        stop_lod_and_effect()

    # lod_over_time slide
    if slidenumber==lod_over_time_index
        console.log("animate lod_over_time slide")
        d3.json("Data/all_lod.json", draw_lod_alltimes)
    if slidenumber==lod_over_time_index-1 or slidenumber==lod_over_time_index+1
        stop_lod_over_time()

    # permutation slide
    if slidenumber==permutation_index
        console.log("animate permutation slide")
        lod_permutation()
    if slidenumber==permutation_index-1 or slidenumber==permutation_index+1
        stop_permutation()

    # collision slide
    if slidenumber==d3_index
        console.log("animate d3 slide")
        collision()
    if slidenumber==d3_index+1 or slidenumber==d3_index-1
        console.log("stop d3 slide animation")
        stop_collision()
