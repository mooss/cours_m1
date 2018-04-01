(unless (boundp 'org-latex-classes)
  (setq org-latex-classes '()))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass[a4paper,fleqn]{report}

%% url line break
\\usepackage[hyphens]{url}

\\usepackage[perpage, bottom]{footmisc}
\\usepackage{footnotebackref}
%%\\usepackage[hyperfootnotes=false]{hyperref}
\\hypersetup{hidelinks}
\\usepackage[margin=2cm]{geometry}

%% listing as a replacement for verbatim
\\usepackage{listings}
\\lstset{
basicstyle=\\small\\ttfamily,
columns=flexible,
breaklines=true
}

%% parskip tweaking
\\usepackage{indentfirst}
\\usepackage{parskip}
\\setlength{\\parskip}{\\medskipamount}
\\newlength{\\indentlength}
\\setlength{\\indentlength}{1.5em}
\\setlength{\\parindent}{\\indentlength}
\\makeatletter
\\newcommand{\\@minipagerestore}{
  \\setlength{\\parskip}{\\medskipamount}
  \\setlength{\\parindent}{\\indentlength}
}
\\makeatother

\\usepackage[french]{babel}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{amssymb}
%%\\usepackage{hyperref}
\\usepackage{mathpazo}
\\usepackage{color}
%%  \\usepackage{enumerate}
\\definecolor{bg}{rgb}{0.95,0.95,0.95}
\\tolerance=1000

%% new math commands
\\newcommand{\\norm}[1]{\\left\\lVert#1\\right\\rVert}
\\newcommand{\\var}[1]{{\\operatorname{\\mathit{#1}}}}

\\setlength{\\mathindent}{2cm}

      [NO-DEFAULT-PACKAGES]
      [PACKAGES]
      [EXTRA]

\\usemintedstyle{paraiso}

%% enumitem probably clashes with one of the previous packages (perhaps enumerate)
\\usepackage{enumitem}
\\setlist[itemize]{topsep=0pt,after=\\vspace{\\medskipamount},itemsep=0pt,parsep=0pt,partopsep=0pt}
\\renewcommand\\labelitemi{---}

%% color tweaking
 \\usepackage{sectsty}
 \\definecolor{turquoise}{RGB}{0,150,172}
%% \\definecolor{turquoise}{RGB}{1,1,1}
 \\definecolor{myorange}{RGB}{205,90,0}

%% table of content formatting
%% https://tex.stackexchange.com/questions/7526/toc-section-subsection-coloring
\\makeatletter
\\let\\stdl@chapter\\l@chapter
\\renewcommand*{\\l@chapter}[2]{%
  \\stdl@chapter{\\textcolor{turquoise}{#1}}{\\textcolor{black}{#2}}}

\\let\\stdl@section\\l@section
\\renewcommand*{\\l@section}[2]{%
  \\stdl@section{\\textcolor{turquoise}{#1}}{\\textcolor{black}{#2}}}

\\let\\stdl@subsection\\l@subsection
\\renewcommand*{\\l@subsection}[2]{%
  \\stdl@subsection{\\textcolor{turquoise}{#1}}{\\textcolor{black}{#2}}}

\\let\\stdl@subsubsection\\l@subsubsection
\\renewcommand*{\\l@subsubsection}[2]{%
  \\stdl@subsubsection{\\textcolor{turquoise}{#1}}{\\textcolor{black}{#2}}}
\\makeatother


%% section coloring
 \\chapterfont{\\color{turquoise}}
 \\sectionfont{\\color{turquoise}}
 \\subsectionfont{\\color{turquoise}}
 \\subsubsectionfont{\\color{turquoise}}


%% section formatting
 \\usepackage[nobottomtitles*]{titlesec}

 \\titleformat*{\\paragraph}{}

 \\titleformat{\\chapter}
              {\\color{turquoise}\\normalfont\\fontsize{18pt}{22pt}\\selectfont\\bfseries}
              {\\thechapter}
              {1em}
              {\\color{turquoise}}
              [{\\color{turquoise}\\nobreak\\titlerule[2pt]}]

 \\titleformat{\\section}
              {\\color{turquoise}\\normalfont\\Large\\bfseries}
              {\\thesection}
              {1em}
              {\\color{turquoise}}
              [{\\color{turquoise}\\nobreak\\titlerule[1.5pt]}]

 \\titleformat{\\subsection}
              {\\color{turquoise}\\normalfont\\normalsize\\bfseries}
              {\\thesubsection}
              {1em}
              {\\color{turquoise}}
              [{\\color{turquoise}\\nobreak\\titlerule[1pt]}]


%% title formatting
%%\\makeatletter
%%\\def\\@maketitle{%
%%  \\newpage
%%  \\null
%%  \\vskip 2em%
%%  \\begin{center}%
%%  \\let \\footnote \\thanks
%%    {\\Huge \\@title \\par}%
%%    \\vskip 1.5em%
%%    {\\large
%%      \\lineskip .5em%
%%      \\begin{tabular}[t]{c}%
%%        \\@author
%%      \\end{tabular}\\par}%
%%    \\vskip 1em%
%%    %{\\large \\@date}%
%%  \\end{center}%
%%  \\par
%%  \\vskip 1.5em}
%%\\makeatother
%%

\\linespread{1.1}
\\hypersetup{pdfborder=0 0 0}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))

(setq org-latex-minted-options
      '(("frame" "single")
        ("linenos" "")
        ("breaklines" "")))

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-default-class "article")
