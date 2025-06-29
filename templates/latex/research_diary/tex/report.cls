\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report}

% ------------------------------------------------------------------
% Base Class
% ------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

% ------------------------------------------------------------------
% Language and Encoding
% ------------------------------------------------------------------
\RequirePackage[utf8]{inputenc}       % Input encoding
\RequirePackage[T5]{fontenc}          % Output font encoding
\RequirePackage[english]{babel}       % Language (can change to [english,vietnamese])

% ------------------------------------------------------------------
% Math and Symbols
% ------------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
	\newtheorem{theorem}{Theorem}
\RequirePackage{anyfontsize}
\RequirePackage{emoji}                % Emoji support

% ------------------------------------------------------------------
% Layout and Spacing
% ------------------------------------------------------------------
\RequirePackage{geometry}             % Page layout
    \geometry{a4paper, margin=1in}
\RequirePackage{setspace}             % Line spacing
	\setstretch{1.7}
\RequirePackage{indentfirst}          % Indent first paragraph
\RequirePackage{placeins}             % Prevent floats from escaping sections

% ------------------------------------------------------------------
% Typography and Appearance
% ------------------------------------------------------------------
\RequirePackage{lipsum}               % Dummy text
\RequirePackage{booktabs}             % Nicer tables
\RequirePackage{caption}              % Caption customization
    \captionsetup[table]{font=small, skip=5pt, justification=centering}
\RequirePackage{fancyhdr}             % Header/footer
    \pagestyle{fancy}
    \setlength\headheight{15pt}
    \setlength\parindent{0in}
    \setlength\parskip{0.1in}
\RequirePackage{lastpage}             % For referencing last page

% ------------------------------------------------------------------
% Graphics
% ------------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage{tikz}

% ------------------------------------------------------------------
% References and Citations
% ------------------------------------------------------------------
\RequirePackage[
    backend=biber,
    style=apa
]{biblatex}
\RequirePackage{url}                  % URL formatting

% ------------------------------------------------------------------
% Hyperlinks
% ------------------------------------------------------------------
\RequirePackage[
    colorlinks=true,
    linkcolor=black,
    citecolor=blue,
    urlcolor=blue,
    filecolor=blue,
]{hyperref}
	\hypersetup{pdfborder=0 0 0}
\RequirePackage{cleveref}             % Smart references

% ------------------------------------------------------------------
% Code Listings
% ------------------------------------------------------------------
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

% Define custom colors
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.95}
\definecolor{keywordmagenta}{rgb}{0.8,0,0.8}

% Define code style
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
    escapeinside={(*@}{@*)},
}

% Set default style
\lstset{style=code_style}

% File input commands
\newcommand{\filecode}[2][]{\lstinputlisting[style=code_style,#1]{#2}}
\newcommand{\cppfile}[2][]{\filecode[language=C++,#1]{#2}}
\newcommand{\pyfile}[2][]{\filecode[language=Python,#1]{#2}}

% Listing labels
\renewcommand{\lstlistingname}{Code}
\renewcommand{\lstlistlistingname}{List of Code}

% Environments
\lstnewenvironment{cppcode}[1][]{%
    \lstset{style=code_style, language=C++, #1}%
}{}

\lstnewenvironment{pycode}[1][]{%
    \lstset{style=code_style, language=Python, #1}%
}{}

% ------------------------------------------------------------------
% Utility Commands
% ------------------------------------------------------------------
% Month name macro
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

% Cover page customization commands
\newcommand{\@coverType}{Research Diary}
\newcommand{\ocoverType}[1]{\renewcommand{\@coverType}{#1}}

\newcommand{\@coverAuthor}{Author Name}
\newcommand{\ocoverAuthor}[1]{\renewcommand{\@coverAuthor}{#1}}

\renewcommand{\@title}{Report Title}
\newcommand{\otitle}[1]{\renewcommand{\@title}{#1}}

\newcommand{\@reportPlace}{Ho Chi Minh City}
\newcommand{\oreportPlace}[1]{\renewcommand{\@reportPlace}{#1}}

\newcommand{\@reportTime}{\Month\ \the\year}
\newcommand{\oreportTime}[1]{\renewcommand{\@reportTime}{#1}}

\newcommand{\@coverHeader}{Cover Header}
\newcommand{\ocoverHeader}[1]{\renewcommand{\@coverHeader}{#1}}

\newcommand{\@coverImage}{logo.png}
\newcommand{\ocoverImage}[1]{\renewcommand{\@coverImage}{#1}}

% ------------------------------------------------------------------
% Cover Page Template
% ------------------------------------------------------------------
\def\coverpage{
    \thispagestyle{empty}

    \vspace*{-3\baselineskip}
    \begin{center}
        {\Large \@coverHeader} \\[3\baselineskip]
        \includegraphics[scale=0.6]{\@coverImage} \\[3\baselineskip]
        
        \begin{tabular}{c}
            \textbf{\Large \@coverType} \\
            {} \\
            \midrule \\
            \textbf{\Large \@coverAuthor} \\
            {} \\
            \textbf{\huge \parbox[c]{0.8\linewidth}{\centering \@title}} \\
            {} \\
            \bottomrule
        \end{tabular}

        \vfill
        \MakeUppercase{\@reportPlace, \@reportTime}
    \end{center}

    \clearpage
}

% ------------------------------------------------------------------
% Other Setup
% ------------------------------------------------------------------
