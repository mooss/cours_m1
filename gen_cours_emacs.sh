#!/usr/bin/env bash

#############
# arguments #
#############
verbose=$1

#############
# variables #
#############
orgfile='compilation_propre.org'
texfile='compilation_propre.tex'
latexcompilecmd="xelatex -shell-escape -interaction nonstopmode -output-directory . $texfile"

#########
# setup #
#########
emacs $orgfile --batch -l ./org-mode_latex.el -f org-latex-export-to-latex --kill

###############
# compilation #
###############
echo -n "."
if  [ "$verbose" != "verbose" ]
then
    $latexcompilecmd >/dev/null
else
    $latexcompilecmd
fi

echo -n "."
$latexcompilecmd > /dev/null

echo -n "."
$latexcompilecmd > /dev/null

###########
# cleanup #
###########
rm -rf *.log *.out *.toc *.aux _minted-* *.tex
