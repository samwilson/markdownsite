\documentclass[$if(fontsize)$$fontsize$,$endif$$if(lang)$$babel-lang$,$endif$$if(papersize)$$papersize$paper,$endif$$for(classoption)$$classoption$$sep$,$endfor$]{$documentclass$}
$if(fontfamily)$
\usepackage[$for(fontfamilyoptions)$$fontfamilyoptions$$sep$,$endfor$]{$fontfamily$}
$else$
\usepackage{lmodern}
$endif$
$if(linestretch)$
\usepackage{setspace}
\setstretch{$linestretch$}
$endif$
\usepackage{amssymb,amsmath}
\usepackage{ifxetex,ifluatex}
\usepackage{fixltx2e} % provides \textsubscript
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \usepackage[$if(fontenc)$$fontenc$$else$T1$endif$]{fontenc}
  \usepackage[utf8]{inputenc}
$if(euro)$
  \usepackage{eurosym}
$endif$
\else % if luatex or xelatex
  \ifxetex
    \usepackage{mathspec}
  \else
    \usepackage{fontspec}
  \fi
  \defaultfontfeatures{Ligatures=TeX,Scale=MatchLowercase}
$if(euro)$
  \newcommand{\euro}{€}
$endif$
$if(mainfont)$
    \setmainfont[$for(mainfontoptions)$$mainfontoptions$$sep$,$endfor$]{$mainfont$}
$endif$
$if(sansfont)$
    \setsansfont[$for(sansfontoptions)$$sansfontoptions$$sep$,$endfor$]{$sansfont$}
$endif$
$if(monofont)$
    \setmonofont[Mapping=tex-ansi$if(monofontoptions)$,$for(monofontoptions)$$monofontoptions$$sep$,$endfor$$endif$]{$monofont$}
$endif$
$if(mathfont)$
    \setmathfont(Digits,Latin,Greek)[$for(mathfontoptions)$$mathfontoptions$$sep$,$endfor$]{$mathfont$}
$endif$
$if(CJKmainfont)$
    \usepackage{xeCJK}
    \setCJKmainfont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKmainfont$}
$endif$
\fi
% use upquote if available, for straight quotes in verbatim environments
\IfFileExists{upquote.sty}{\usepackage{upquote}}{}
% use microtype if available
\IfFileExists{microtype.sty}{%
\usepackage{microtype}
\UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
}{}
$if(geometry)$
\usepackage[$for(geometry)$$geometry$$sep$,$endfor$]{geometry}
$endif$
\usepackage{hyperref}
$if(colorlinks)$
\PassOptionsToPackage{usenames,dvipsnames}{color} % color is loaded by hyperref
$endif$
\hypersetup{unicode=true,
$if(title-meta)$
            pdftitle={$title-meta$},
$endif$
$if(author-meta)$
            pdfauthor={$author-meta$},
$endif$
$if(keywords)$
            pdfkeywords={$for(keywords)$$keywords$$sep$; $endfor$},
$endif$
$if(colorlinks)$
            colorlinks=true,
            linkcolor=$if(linkcolor)$$linkcolor$$else$Maroon$endif$,
            citecolor=$if(citecolor)$$citecolor$$else$Blue$endif$,
            urlcolor=$if(urlcolor)$$urlcolor$$else$Blue$endif$,
$else$
            pdfborder={0 0 0},
$endif$
            breaklinks=true}
\urlstyle{same}  % don't use monospace font for urls
$if(lang)$
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \usepackage[shorthands=off,$for(babel-otherlangs)$$babel-otherlangs$,$endfor$main=$babel-lang$]{babel}
$if(babel-newcommands)$
  $babel-newcommands$
$endif$
\else
  \usepackage{polyglossia}
  \setmainlanguage[$polyglossia-lang.options$]{$polyglossia-lang.name$}
$for(polyglossia-otherlangs)$
  \setotherlanguage[$polyglossia-otherlangs.options$]{$polyglossia-otherlangs.name$}
$endfor$
\fi
$endif$
$if(natbib)$
\usepackage{natbib}
\bibliographystyle{$if(biblio-style)$$biblio-style$$else$plainnat$endif$}
$endif$
$if(biblatex)$
\usepackage$if(biblio-style)$[style=$biblio-style$]$endif${biblatex}
$if(biblatexoptions)$\ExecuteBibliographyOptions{$for(biblatexoptions)$$biblatexoptions$$sep$,$endfor$}$endif$
$for(bibliography)$
\addbibresource{$bibliography$}
$endfor$
$endif$
$if(listings)$
\usepackage{listings}
$endif$
$if(lhs)$
\lstnewenvironment{code}{\lstset{language=Haskell,basicstyle=\small\ttfamily}}{}
$endif$
$if(highlighting-macros)$
$highlighting-macros$
$endif$
$if(verbatim-in-note)$
\usepackage{fancyvrb}
\VerbatimFootnotes % allows verbatim text in footnotes
$endif$
$if(tables)$
\usepackage{longtable,booktabs}
$endif$
$if(graphics)$
\usepackage{graphicx,grffile}
\makeatletter
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
\def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
\makeatother
% Scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}
$endif$
$if(links-as-notes)$
% Make links footnotes instead of hotlinks:
\renewcommand{\href}[2]{#2\footnote{\url{#1}}}
$endif$
$if(strikeout)$
\usepackage[normalem]{ulem}
% avoid problems with \sout in headers with hyperref:
\pdfstringdefDisableCommands{\renewcommand{\sout}{}}
$endif$
$if(indent)$
$else$
\IfFileExists{parskip.sty}{%
\usepackage{parskip}
}{% else
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt plus 2pt minus 1pt}
}
$endif$
\setlength{\emergencystretch}{3em}  % prevent overfull lines
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
$if(numbersections)$
\setcounter{secnumdepth}{5}
$else$
\setcounter{secnumdepth}{0}
$endif$
$if(subparagraph)$
$else$
% Redefines (sub)paragraphs to behave more like sections
\ifx\paragraph\undefined\else
\let\oldparagraph\paragraph
\renewcommand{\paragraph}[1]{\oldparagraph{#1}\mbox{}}
\fi
\ifx\subparagraph\undefined\else
\let\oldsubparagraph\subparagraph
\renewcommand{\subparagraph}[1]{\oldsubparagraph{#1}\mbox{}}
\fi
$endif$
$if(dir)$
\ifxetex
  % load bidi as late as possible as it modifies e.g. graphicx
  $if(latex-dir-rtl)$
  \usepackage[RTLdocument]{bidi}
  $else$
  \usepackage{bidi}
  $endif$
\fi
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \TeXXeTstate=1
  \newcommand{\RL}[1]{\beginR #1\endR}
  \newcommand{\LR}[1]{\beginL #1\endL}
  \newenvironment{RTL}{\beginR}{\endR}
  \newenvironment{LTR}{\beginL}{\endL}
\fi
$endif$
$for(header-includes)$
$header-includes$
$endfor$

$if(title)$
\title{$title$$if(thanks)$\thanks{$thanks$}$endif$}
$endif$
$if(subtitle)$
\providecommand{\subtitle}[1]{}
\subtitle{$subtitle$}
$endif$
$if(author)$
\author{$for(author)$$author$$sep$ \and $endfor$}
$endif$
\date{$date$}

\usepackage{fancyhdr}
\pagestyle{fancyplain}
\fancyhf[FEOC]{\footnotesize \thepage/\pageref{LastPage}}

\begin{document}
$if(title)$
\maketitle
$endif$
$if(abstract)$
\begin{abstract}
$abstract$
\end{abstract}
$endif$

$for(include-before)$
$include-before$

$endfor$
$if(toc)$
{
$if(colorlinks)$
\hypersetup{linkcolor=$if(toccolor)$$toccolor$$else$black$endif$}
$endif$
\setcounter{tocdepth}{$toc-depth$}
\tableofcontents
}
$endif$
$if(lot)$
\listoftables
$endif$
$if(lof)$
\listoffigures
$endif$
$body$

$if(natbib)$
$if(bibliography)$
$if(biblio-title)$
$if(book-class)$
\renewcommand\bibname{$biblio-title$}
$else$
\renewcommand\refname{$biblio-title$}
$endif$
$endif$
\bibliography{$for(bibliography)$$bibliography$$sep$,$endfor$}

$endif$
$endif$
$if(biblatex)$
\printbibliography$if(biblio-title)$[title=$biblio-title$]$endif$

$endif$
$for(include-after)$
$include-after$

$endfor$
\end{document}
