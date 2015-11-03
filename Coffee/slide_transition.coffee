current_slide = null

get_slide_index = (section_id) ->
    d3.selectAll("section")[0].indexOf(d3.select("##{section_id}").node())

density_index = get_slide_index("density")
corr_w_scatter_index = get_slide_index("corr_w_scatter")
manyboxplots_index = get_slide_index("manyboxplots")
lod_and_effect_index = get_slide_index("lod_and_effect")
lod_over_time_index = get_slide_index("lod_over_time")
permutation_index = get_slide_index("permutation")
cistrans_index=get_slide_index("cistrans")
d3_index = get_slide_index("D3")

slide_transition = (slidenumber) ->
    console.log("transition #{current_slide} -> #{slidenumber}")

    return if slidenumber == current_slide
    current_slide = slidenumber

    # density estimate slide
    if slidenumber==density_index
        console.log("animate density slide")
        make_density()
    if slidenumber==density_index+1 or slidenumber==density_index-1
        stop_density()

    # corr_w_scatter slide
    if slidenumber==corr_w_scatter_index
        console.log("animate corr w scatter slide")
        corr_w_scatter()
    if slidenumber==corr_w_scatter_index-1 or slidenumber==corr_w_scatter_index+1
        stop_corr_w_scatter()

    # manyboxplots slide
    if slidenumber==manyboxplots_index
        console.log("animate manyboxplots slide")
        # load json file and call draw function
        d3.json("Data/hypo.json", draw_manyboxplots)
    if slidenumber==manyboxplots_index-1 or slidenumber==manyboxplots_index+1
        stop_manyboxplots()

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

    # cistrans slide
    if slidenumber==cistrans_index
        console.log("animate cistrans slide")
        d3.json("Data/islet_eqtl.json", draw_cistrans)
    if slidenumber==cistrans_index-1 or slidenumber==cistrans_index+1
        stop_cistrans()

    # collision slide
    if slidenumber==d3_index
        console.log("animate d3 slide")
        d3.select("p#dotenter").transition()
                               .style("opacity", 1)
                               .delay(20000)
                               .duration(5000)
                               .ease("linear")
        collision()
    if slidenumber==d3_index+1 or slidenumber==d3_index-1
        console.log("stop d3 slide animation")
        stop_collision()
