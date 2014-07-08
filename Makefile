presentation.html: index.html js css/kbroman_talk.css css/kbroman_presentation.css Figs/intercross.png
	Perl/create_presentation.pl

Figs/intercross.png: R/intercross_fig.R
	cd R;R CMD BATCH intercross_fig.R
