all: Pics/ccmice_thumbnail.png

Pics/ccmice_thumbnail.png: Pics/ccmice.png
	convert $< -thumbnail 300x300 $@
