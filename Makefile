TARGETS=compilation_propre.pdf
MD_TO_PDF=pandoc --filter=pandoc-svg.py --filter pandoc-citeproc --number-sections --table-of-contents -V geometry:margin=3cm -V papersize:a4paper # -V lang:fr-FR

# règles de dépendances
all: $(TARGETS)

compilation_propre.pdf: img/gplactionpcode.png img/algo.svg img/gpl.svg img/pile1.svg img/pile2.svg img/pile3.svg img/tree-SR2.svg img/tree.svg

# règles de génération
%.pdf: %.md
	$(MD_TO_PDF) -s $< -o $@

%.png: %.ditaa
	ditaa $< -oSE > /dev/null

%.svg: %.dot
	dot -Tsvg $< -o $@
