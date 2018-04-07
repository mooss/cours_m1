TARGETS=compilation_propre.pdf
MD_TO_PDF=pandoc --filter=pandoc-svg.py --filter pandoc-citeproc --number-sections --table-of-contents -V geometry:margin=3cm -V papersize:a4paper # -V lang:fr-FR

# règles de dépendances
all: $(TARGETS)

compilation_propre.pdf: gplactionpcode.png algo.svg  gpl.svg  pile1.svg  pile2.svg  pile3.svg  tree-SR2.svg tree.svg

# règles de génération
%.pdf: %.md
	$(MD_TO_PDF) -s $< -o $@

%.png: %.ditaa
	ditaa $< -oSE > /dev/null

%.svg: %.dot
	dot -Tsvg $< -o $@
