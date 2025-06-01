\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

\RequirePackage[utf8]{vntex,inputenc}
\RequirePackage{anyfontsize,amsmath,amssymb}
\RequirePackage[T5]{fontenc}

\RequirePackage{geometry,graphicx,indentfirst,setspace}
\RequirePackage{booktabs}

\RequirePackage{fancyhdr,lastpage,hyperref}
\RequirePackage[super,square,sort&compress]{natbib}
\RequirePackage[nameinlink]{cleveref} % use \Cref{} instead of \ref{}

% Change to '[english,vietnamese]' to use Vietnamese labels
\RequirePackage[english]{babel}

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

\newcommand{\@coverAuthor}{Ha Tuong Nguyen}
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