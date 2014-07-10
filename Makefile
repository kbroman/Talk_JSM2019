all: presentation.html Figs/intercross.png Figs/lodcurve_insulin.png JS/manyboxplots.js JS/lod_and_effect.js JS/cistrans.js JS/lod_alltimes.js JS/corr_w_scatter.js JS/selection_example.js

presentation.html: index.html js css/kbroman_talk.css css/kbroman_presentation.css
	Perl/create_presentation.pl

Figs/%.png: R/%.R
	cd R;R CMD BATCH $(<F)

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^

web: presentation.html
	scp *.html broman-2.biostat.wisc.edu:public_html/presentations/BioVis/

weball: presentation.html
	scp *.html broman-2.biostat.wisc.edu:public_html/presentations/BioVis/
	scp JS/* broman-2.biostat.wisc.edu:public_html/presentations/BioVis/JS/
	scp Coffee/* broman-2.biostat.wisc.edu:public_html/presentations/BioVis/Coffee/
	scp CSS/* broman-2.biostat.wisc.edu:public_html/presentations/BioVis/CSS/
	scp Figs/* broman-2.biostat.wisc.edu:public_html/presentations/BioVis/Figs/
