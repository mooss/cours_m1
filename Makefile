TARGETS=compilation_propre.pdf
MD_TO_PDF=pandoc --filter=pandoc-svg.py --filter pandoc-citeproc --number-sections --table-of-contents -V geometry:margin=3cm

# règles de dépendances
all: $(TARGETS)

compilation_propre.pdf: gplactionpcode.png
# règles de génération


%.pdf: %.md
	$(MD_TO_PDF) -s $< -o $@

%.png: %.ditaa
	ditaa $< -oSE
