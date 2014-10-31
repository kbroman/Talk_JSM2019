flashText = d3.select("body").select("font#flash")

flashToggle = 0 # when flashing, keeps track of on/off
stateToggle = 1 # goes between 0 (off), 1 (on) and 2 (flashing)

flashFunc = () ->
    flashText.attr("class", () ->
        if flashToggle==5
            flashToggle=-1
            return "highlight"
        "glow")
    flashToggle++

flashInterval = setInterval(flashFunc, 0)
clearInterval(flashInterval)

flashText.on("click", () ->
    if stateToggle==0
        clearInterval(flashInterval)
        d3.select(this).attr("class", "highlight")
    else if stateToggle==1
        d3.select(this).attr("class", "glow")
    else
        d3.select(this).attr("class", "highlight")
        flashToggle = 0
        flashInterval = setInterval(flashFunc, 400)
    stateToggle++
    stateToggle = 0 if stateToggle > 2
)
