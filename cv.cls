% MIT License

% Copyright (c) 2023 Micha Bosshart

% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

% Authors
% Micha Bosshart

% https://github.com/LaTeX-Template-Share

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/10/23 CV class]

%% Read in User Data
\def\@fullname{}
\long\def\fullname#1{\def\@fullname{#1}}

\def\@email{}
\long\def\email#1{\def\@email{#1}}

\def\@phoneNumber{}
\long\def\phoneNumber#1{\def\@phoneNumber{#1}}

\def\@website{}
\long\def\website#1{\def\@website{#1}}
\def\@websiteDescription{}
\long\def\websiteDescription#1{\def\@websiteDescription{#1}}

%% Options
\RequirePackage{graphicx}
\RequirePackage{bold-extra}
\RequirePackage{tikzpagenodes}
\RequirePackage{tikz}


%% Underlying Class
\LoadClass{article}

% %% Page Layout
\RequirePackage[
  left    = 2.0cm,
  right   = 2.0cm,
  top     = 2.0cm,
  bottom  = 2.0cm
]{geometry}

%% PDF Metadata
\RequirePackage[hidelinks,
  pdftex,
  pdfauthor={Micha Bosshart},
  pdftitle={https://github.com/LaTeX-Template-Share}
]{hyperref}

%% Page Heading
\RequirePackage{fancyhdr}
\lhead{%
    \href{mailto:\@email}{\@email}%
        \hfill%
    \@phoneNumber \phantom{asdfas}%
        \hfill%
    \FancyLink{\@website}{\@websiteDescription}%
}
\cfoot{} % no page numbering

%% New Date Format
\RequirePackage{datetime}
\newdateformat{monthyeardate}{\monthname[\THEMONTH], \THEYEAR}

%% Spacing
\setlength{\parindent}{0.0em}
\renewcommand{\arraystretch}{1.2}

%% Section
\newcommand{\sectionHelper}[1]{%
    {\large\scshape\selectfont #1}\vskip2pt \hrule%
}
\renewcommand\section{\@startsection%
    {section}%
    {1}%
    {\z@}%
    {2.3ex \@plus.2ex}%
    {2.3ex \@plus.2ex}%
    {\sectionHelper}%
}

%% Subsection
\newcommand*{\subsectionHelper}[1]{%
    {\large\scshape\selectfont #1}\vskip2pt \hrule%
}
\renewcommand\subsection{\@startsection%
    {subsection}%
    {1}%
    {\z@}%
    {2.3ex \@plus.2ex}%
    {2.3ex \@plus.2ex}%
    {\subsectionHelper}%
}

%% Subsubsection
\newcommand{\sectionHelperFirst}[1]{%
    {\large\scshape\selectfont #1}\vskip2pt \hrule width 385pt%
}
\renewcommand\subsubsection{\@startsection%
    {subsubsection}%
    {1}%
    {\z@}%
    {2.3ex \@plus.2ex}%
    {2.3ex \@plus.2ex}%
    {\sectionHelperFirst}%
}

%% Section Counter Remove
\setcounter{secnumdepth}{0}

% Custom Icon
\newcommand{\FancyLinkIcon}{%
    \tikz[x=1.2ex, y=1.2ex, baseline=-0.05ex]{% 
        \begin{scope}[x=1ex, y=1ex]
            \clip (-0.1,-0.1) 
                --++ (-0, 1.2) 
                --++ (0.6, 0) 
                --++ (0, -0.6) 
                --++ (0.6, 0) 
                --++ (0, -1);
            \path[draw, 
                line width = 0.5, 
                rounded corners=0.5] 
                (0,0) rectangle (1,1);
        \end{scope}
        \path[draw, line width = 0.5] (0.5, 0.5) 
            -- (1, 1);
        \path[draw, line width = 0.5] (0.6, 1) 
            -- (1, 1) -- (1, 0.6);
    }
}

\newcommand{\FancyLink}[2]{%
    \href{#1}{\FancyLinkIcon #2}%
}

%% Portrait Picture
\AtBeginDocument{
    % remove page numbers in entire document
    \pagestyle{empty}

    % add fancy header on first page
    \thispagestyle{fancy}

    % full name at top of document
    \begin{center}
        {\LARGE \scshape{\@fullname}}
    \end{center}
}

%% Custom Helper Functions
\newcommand{\pc}{- }
\newcommand{\ppc}{\phantom{\pc -}}
\newcommand{\sectionheading}[1]{{\large\scshape #1}\vspace{0.75em}\newline}

