presentation.html: index.html js css/kbroman_talk.css css/kbroman_presentation.css Figs/intercross.png Figs/lodcurve_insulin.png
	Perl/create_presentation.pl

Figs/%.png: R/%.R
	cd R;R CMD BATCH $(<F)

