all: Pics/ccmice_thumbnail.png Figs/do_cross.pdf Figs/do_cross_thumbnail.png Figs/do_genome.pdf Figs/do_genome_thumbnail.png

R_OPTS=--no-save --no-restore --no-init-file --no-site-file

Pics/ccmice_thumbnail.png: Pics/ccmice.png
	convert $< -thumbnail 300x300 $@

Figs/%.pdf: R/%_fig.R R/meiosis_func.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

Figs/%_thumbnail.png: Figs/%.pdf
	convert $< -thumbnail 300x300 $@
