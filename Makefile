all: presentation.html Figs/intercross.png Figs/lodcurve_insulin.png JS/manyboxplots.js JS/lod_and_effect.js

presentation.html: index.html js css/kbroman_talk.css css/kbroman_presentation.css
	Perl/create_presentation.pl

Figs/%.png: R/%.R
	cd R;R CMD BATCH $(<F)

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^
