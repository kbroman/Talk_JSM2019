all: Figs JS

Figs: Figs/intercross.png Figs/lodcurve_insulin.png

JS: JS/manyboxplots.js JS/lod_and_effect.js JS/cistrans.js JS/lod_alltimes.js JS/corr_w_scatter.js JS/selection_example.js JS/lod_onetime_random.js JS/handle_stickies.js JS/flash_text.js JS/density.js JS/plotframe.js JS/em_alg.js JS/scatterplot.js JS/panelutil.js

presentation.html: index.html js css/kbroman_talk.css css/kbroman_presentation.css
	Perl/create_presentation.pl

Figs/%.png: R/%.R
	cd R;R CMD BATCH $(<F)

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^

web:
	scp *.html broman-9.biostat.wisc.edu:public_html/presentations/InteractiveGraphs4

weball: presentation.html JS Figs
	scp *.html broman-9.biostat.wisc.edu:public_html/presentations/InteractiveGraphs4/
	scp JS/* broman-9.biostat.wisc.edu:public_html/presentations/InteractiveGraphs4/JS/
	scp Coffee/* broman-9.biostat.wisc.edu:public_html/presentations/InteractiveGraphs4/Coffee/
	scp CSS/* broman-9.biostat.wisc.edu:public_html/presentations/InteractiveGraphs4/CSS/
	scp Figs/*.png broman-9.biostat.wisc.edu:public_html/presentations/InteractiveGraphs4/Figs/
	scp Figs/*.jpg broman-9.biostat.wisc.edu:public_html/presentations/InteractiveGraphs4/Figs/
	scp Figs/Panels/* broman-9.biostat.wisc.edu:public_html/presentations/InteractiveGraphs4/Figs/Panels/
	scp Figs/Charts/* broman-9.biostat.wisc.edu:public_html/presentations/InteractiveGraphs4/Figs/Charts/

tar: presentation.html JS Figs
	cd ..;tar czvhf broman_biovis.tgz InteractiveGraphs4/[A-Za-z]*
