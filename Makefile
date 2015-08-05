all: Figs JS

.PHONY: all tar Figs JS web weball


Figs: Figs/intercross.png Figs/lodcurve_insulin.png

JS: JS/manyboxplots.js JS/lod_and_effect.js JS/cistrans.js JS/lod_alltimes.js JS/corr_w_scatter.js JS/selection_example.js JS/lod_onetime_random.js JS/handle_stickies.js JS/flash_text.js JS/density.js JS/plotframe.js JS/em_alg.js JS/scatterplot.js JS/panelutil.js

Figs/%.png: R/%.R
	cd R;R CMD BATCH $(<F)

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^

web:
	scp *.html broman-2.biostat.wisc.edu:public_html/presentations/BioC2015

weball: JS Figs
	scp *.html broman-2.biostat.wisc.edu:public_html/presentations/BioC2015/
	scp JS/* broman-2.biostat.wisc.edu:public_html/presentations/BioC2015/JS/
	scp Coffee/* broman-2.biostat.wisc.edu:public_html/presentations/BioC2015/Coffee/
	scp CSS/* broman-2.biostat.wisc.edu:public_html/presentations/BioC2015/CSS/
	scp Figs/*.png broman-2.biostat.wisc.edu:public_html/presentations/BioC2015/Figs/
	scp Figs/*.jpg broman-2.biostat.wisc.edu:public_html/presentations/BioC2015/Figs/

tar: all
	cd ..;tar czhf BioC2015.tgz BioC2015/[A-Za-z]*
