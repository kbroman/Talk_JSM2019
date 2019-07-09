all: JS

.PHONY: all tar JS web weball

JS: JS/lod_and_effect.js JS/lod_alltimes.js JS/corr_w_scatter.js JS/lod_onetime_random.js JS/handle_stickies.js JS/flash_text.js JS/plotframe.js JS/scatterplot.js JS/panelutil.js JS/slide_transition.js

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^

web:
	scp *.html adhara.biostat.wisc.edu:Website/presentations/JSM2019

weball: JS
	scp *.html adhara.biostat.wisc.edu:Website/presentations/JSM2019/
	scp JS/* adhara.biostat.wisc.edu:Website/presentations/JSM2019/JS/
	scp Coffee/* adhara.biostat.wisc.edu:Website/presentations/JSM2019/Coffee/
	scp CSS/* adhara.biostat.wisc.edu:Website/presentations/JSM2019/CSS/

tar: all
	cd ..;tar czhf JSM2019.tgz JSM2019/[A-Za-z]*
