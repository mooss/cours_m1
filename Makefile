TARGETS=compilation_propre.pdf
MD_TO_PDF=pandoc --filter=pandoc-svg.py --filter pandoc-citeproc --number-sections

all: $(TARGETS)

%.pdf: %.md
	$(MD_TO_PDF) -s $< -o $@
