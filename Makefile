all: Pics/ccmice_thumbnail.png Figs/do_cross.pdf Figs/do_cross_thumbnail.png Figs/do_genome.pdf Figs/do_genome_thumbnail.png Figs/genoprobsF.pdf Figs/genoprobsF_thumbnail.png

R_OPTS=--no-save --no-restore --no-init-file --no-site-file

Pics/ccmice_thumbnail.png: Pics/ccmice.png
	convert $< -thumbnail 300x300 $@

Figs/do_cross.pdf: R/do_cross_fig.R R/meiosis_func.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

Figs/do_cross_thumbnail.png: Figs/do_cross.pdf
	convert $< -thumbnail 300x300 $@

Figs/do_genome.pdf: R/do_genome_fig.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

Figs/do_genome_thumbnail.png: Figs/do_genome.pdf
	convert $< -thumbnail 300x300 $@

Figs/genoprobsF.pdf: R/genoprobs_fig.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"
# the above creates 6 figures: genoprobsA.pdf ... genoprobsF.pdf

Figs/genoprobsF_thumbnail.png: Figs/genoprobsF.pdf
	convert $< -thumbnail 300x300 $@
