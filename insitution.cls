% institutionreport.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{institutionreport}[2024/01/23 Custom Institution Report Class]

% Handle class options
\newif\if@watermark\@watermarkfalse
\DeclareOption{watermark}{\@watermarktrue}
\ProcessOptions\relax

% Base the class on the standard article class
\LoadClass[12pt,a4paper]{article}

% Required packages
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}

% Page margins
\geometry{
    a4paper,
    margin=2.5cm,
    top=3cm,
    bottom=3cm
}

% Custom institutional colors
\definecolor{institutionblue}{RGB}{0,51,102}
\definecolor{institutiongreen}{RGB}{0,102,51}

% Header and footer
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\fancyhead[L]{\includegraphics[height=1cm]{institution-logo}}
\fancyhead[R]{\color{institutionblue}\textbf{Institutional Report}}
\fancyfoot[C]{\thepage}

% Title page command
\renewcommand{\maketitle}{%
    \begin{titlepage}
        \centering
        \includegraphics[width=0.6\textwidth]{institution-logo}\par
        \vspace{2cm}
        {\huge\bfseries\color{institutionblue} \@title \par}
        \vspace{1cm}
        {\Large\@author\par}
        \vspace{1cm}
        {\large\@date\par}
        \vfill
        \if@watermark
            \AtBeginShipout{%
                \special{pdf: put @thispage <</Watermark <</Subtype /Image /Rotate 45 /Opacity 0.1>>>>}
            }
        \fi
    \end{titlepage}
}

% Section formatting
\RequirePackage{titlesec}
\titleformat{\section}
    {\color{institutiongreen}\normalfont\Large\bfseries}
    {\color{institutiongreen}\thesection}{1em}{}

\endinput
