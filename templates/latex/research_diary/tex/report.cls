\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{anyfontsize,amsmath,amssymb}
\RequirePackage[T5]{fontenc}

\RequirePackage{geometry,graphicx,indentfirst,setspace}
\RequirePackage{amsmath,amsthm,amssymb}
\RequirePackage{booktabs}

\RequirePackage{fancyhdr,lastpage,hyperref}
\RequirePackage[super,square,sort&compress]{natbib}
\RequirePackage{cleveref} % use \Cref{} instead of \ref{}

% Change to '[english,vietnamese]' to use Vietnamese labels
\RequirePackage[english]{babel}

% Code snip
% Example:
%       \begin{pycode}[caption=Hello Python]
%       print("Hello, Python!")
%       import numpy as np
%       \end{pycode}
% Example (code from file):
%       \cppfile[caption=My C++ Code]{main.cpp}

\RequirePackage{listings}
\RequirePackage{xcolor}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.95}
\definecolor{keywordmagenta}{rgb}{0.8,0,0.8}

\lstdefinestyle{code_style}{
  backgroundcolor=\color{backcolour},
  commentstyle=\color{codegreen}\ttfamily,
  keywordstyle=\color{keywordmagenta}\bfseries,
  numberstyle=\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  keepspaces=true,
  numbers=left,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=4,
  frame=lines,
  rulecolor=\color{codegray},
  escapeinside={(*@}{@*)},}

\lstset{style=code_style}
\newcommand{\filecode}[2][]{\lstinputlisting[style=code_style,#1]{#2}}
\newcommand{\cppfile}[2][]{\filecode[language=C++,#1]{#2}}
\newcommand{\pyfile}[2][]{\filecode[language=Python,#1]{#2}}
\renewcommand{\lstlistingname}{Code}
\renewcommand{\lstlistlistingname}{List of Code}

\lstnewenvironment{cppcode}[1][]{%
  \lstset{style=code_style, language=C++, #1}%
}{}

\lstnewenvironment{pycode}[1][]{%
  \lstset{style=code_style, language=Python, #1}%
}{}

% Draft watermark
% https://github.com/callegar/LaTeX-draftwatermark

%\graphicspath{{subdir1/}{subdir2/}{subdir3/}...{subdirn/}}

\newcommand{\Month}{
  \ifcase \the\month
  \or January
  \or February
  \or March
  \or April
  \or May
  \or June
  \or July
  \or August
  \or September
  \or October
  \or November
  \or December
  \fi
}

\newcommand{\@coverType}{Reseach Diary}
\newcommand{\ocoverType}[1]{\renewcommand{\@coverType}{#1}}

\newcommand{\@coverAuthor}{Author Name}
\newcommand{\ocoverAuthor}[1]{\renewcommand{\@coverAuthor}{#1}}

\renewcommand{\@title}{Report title}
\newcommand{\otitle}[1]{\renewcommand{\@title}{#1}}

\newcommand{\@reportPlace}{Ho Chi Minh City}
\newcommand{\oreportPlace}[1]{\renewcommand{\@reportPlace}{#1}}

\newcommand{\@reportTime}{\Month \the\year}
\newcommand{\oreportTime}[1]{\renewcommand{\@reportTime}{#1}}

\newcommand{\@coverHeader}{Cover header}
\newcommand{\ocoverHeader}[1]{\renewcommand{\@coverHeader}{#1}}

\newcommand{\@coverImage}{logo.png}
\newcommand{\ocoverImage}[1]{\renewcommand{\@coverImage}{#1}}

% COVER PAGE:
\def\coverpage{
  \thispagestyle{empty}

  \vspace*{-3\baselineskip}
  \begin{center}
    {\Large \@coverHeader}
    \\[3\baselineskip]

    \includegraphics[scale=0.6]{\@coverImage}
    \\[3\baselineskip]

    \begin{tabular}{c}
      \textbf{\Large \@coverType}                                 \\
      {}                                                           \\
      \midrule                                                     \\
      \textbf{\Large \@coverAuthor}                                 \\
      {}                                                           \\
      \textbf{\huge \parbox[c]{0.8\linewidth}{\centering \@title}} \\
      {}                                                           \\
      \bottomrule
    \end{tabular}

    \vfill

    \MakeUppercase{\@reportPlace, \@reportTime}
  \end{center}

  \clearpage
}

\hypersetup{pdfborder=0 0 0}
