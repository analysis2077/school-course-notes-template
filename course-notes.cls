% School Course Notes LaTeX Class
% Version 1.0.1
% Compile with XeLaTeX or pdfLaTeX.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{course-notes}[2026/07/15 v1.0.1 Clean school course notes class]

% -----------------------------------------------------------------------------
% Class options
% -----------------------------------------------------------------------------
\newif\ifcourseshowsolutions
\courseshowsolutionstrue
\DeclareOption{solutions}{\courseshowsolutionstrue}
\DeclareOption{nosolutions}{\courseshowsolutionsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax

\LoadClass[
  11pt,
  a4paper,
  twoside,
  open=any,
  headings=normal,
  parskip=half-
]{scrreprt}

% -----------------------------------------------------------------------------
% Core packages
% -----------------------------------------------------------------------------
\RequirePackage{iftex}
\RequirePackage[T1]{fontenc}
\ifPDFTeX
  \RequirePackage[utf8]{inputenc}
\fi
\RequirePackage{newpxtext}
\RequirePackage{amsthm}
\RequirePackage{newpxmath}
\RequirePackage[scaled=0.92]{sourcesanspro}
\RequirePackage{microtype}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{cancel}
\RequirePackage{siunitx}
\RequirePackage{tcolorbox}
\tcbuselibrary{breakable,skins,theorems}
\RequirePackage{comment}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{lastpage}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}
\RequirePackage[nameinlink,noabbrev,capitalise]{cleveref}

% -----------------------------------------------------------------------------
% Page geometry and typography
% -----------------------------------------------------------------------------
\geometry{
  top=27mm,
  bottom=29mm,
  inner=28mm,
  outer=24mm,
  headheight=15pt,
  headsep=8mm,
  footskip=13mm
}

\setlength{\emergencystretch}{2em}
\setlist{itemsep=0.25em,topsep=0.4em,parsep=0pt}
\setlist[enumerate,1]{label=\textup{(\alph*)},ref=\textup{(\alph*)}}
\setlist[enumerate,2]{label=\textup{(\roman*)},ref=\textup{(\roman*)}}
\renewcommand{\arraystretch}{1.18}
\sisetup{detect-all}

% -----------------------------------------------------------------------------
% Colour system: restrained and print-friendly
% -----------------------------------------------------------------------------
\definecolor{CourseNavy}{HTML}{23364D}
\definecolor{CourseBlue}{HTML}{3F6488}
\definecolor{CourseTeal}{HTML}{3F7672}
\definecolor{CourseGray}{HTML}{5D6670}
\definecolor{CourseLightGray}{HTML}{F3F5F7}
\definecolor{CourseRule}{HTML}{D6DBE0}
\definecolor{CourseAmber}{HTML}{8A6425}
\definecolor{CourseAmberBg}{HTML}{FBF7EF}
\definecolor{CourseRed}{HTML}{8A3B3B}
\definecolor{CourseRedBg}{HTML}{FBF1F1}

% -----------------------------------------------------------------------------
% Course metadata
% -----------------------------------------------------------------------------
\newcommand{\courseschool}{School / Department}
\newcommand{\coursecode}{COURSE000}
\newcommand{\coursetitle}{Course Title}
\newcommand{\coursesubtitle}{Course Notes, TTL Solutions, and Past Papers}
\newcommand{\courseyear}{Academic Year}
\newcommand{\courseterm}{Term}
\newcommand{\courseinstructor}{Instructor}
\newcommand{\coursecoordinator}{Course Society / Editorial Team}
\newcommand{\courseversion}{1.0.0}
\newcommand{\courseupdated}{15 July 2026}
\newcommand{\coursewebsite}{}
\newcommand{\courselicence}{Internal educational use}

\newcommand{\School}[1]{\renewcommand{\courseschool}{#1}}
\newcommand{\CourseCode}[1]{\renewcommand{\coursecode}{#1}}
\newcommand{\CourseTitle}[1]{\renewcommand{\coursetitle}{#1}}
\newcommand{\CourseSubtitle}[1]{\renewcommand{\coursesubtitle}{#1}}
\newcommand{\AcademicYear}[1]{\renewcommand{\courseyear}{#1}}
\newcommand{\Term}[1]{\renewcommand{\courseterm}{#1}}
\newcommand{\Instructor}[1]{\renewcommand{\courseinstructor}{#1}}
\newcommand{\Coordinator}[1]{\renewcommand{\coursecoordinator}{#1}}
\newcommand{\DocumentVersion}[1]{\renewcommand{\courseversion}{#1}}
\newcommand{\LastUpdated}[1]{\renewcommand{\courseupdated}{#1}}
\newcommand{\CourseWebsite}[1]{\renewcommand{\coursewebsite}{#1}}
\newcommand{\CourseLicence}[1]{\renewcommand{\courselicence}{#1}}

% -----------------------------------------------------------------------------
% Hyperlinks and PDF metadata
% -----------------------------------------------------------------------------
\hypersetup{
  colorlinks=true,
  linkcolor=CourseNavy,
  citecolor=CourseTeal,
  urlcolor=CourseBlue,
  pdfauthor={\coursecoordinator},
  pdftitle={\coursecode\space -- \coursetitle},
  pdfsubject={School course notes},
  bookmarksnumbered=true,
  bookmarksopen=true
}

% -----------------------------------------------------------------------------
% Header and footer
% -----------------------------------------------------------------------------
\clearpairofpagestyles
\automark[section]{chapter}
\ihead{\footnotesize\sffamily\color{CourseGray}\coursecode}
\ohead{\footnotesize\sffamily\color{CourseGray}\headmark}
\ifoot{\footnotesize\sffamily\color{CourseGray}Version \courseversion}
\ofoot{\footnotesize\sffamily\color{CourseGray}\thepage\ / \pageref*{LastPage}}
\setkomafont{pageheadfoot}{\normalfont}
\setkomafont{pagenumber}{\normalfont}
\KOMAoptions{headsepline=0.4pt,footsepline=0pt}
\addtokomafont{headsepline}{\color{CourseRule}}

% -----------------------------------------------------------------------------
% Heading design
% -----------------------------------------------------------------------------
\setkomafont{part}{\sffamily\bfseries\color{CourseNavy}}
\setkomafont{chapter}{\sffamily\bfseries\color{CourseNavy}}
\setkomafont{section}{\sffamily\bfseries\color{CourseNavy}}
\setkomafont{subsection}{\sffamily\bfseries\color{CourseBlue}}
\setkomafont{subsubsection}{\sffamily\bfseries\color{CourseGray}}
\setkomafont{disposition}{\normalcolor}

\renewcommand*{\chapterformat}{%
  \makebox[0pt][r]{\color{CourseBlue}\fontsize{34}{34}\selectfont\thechapter\enskip}%
}
\RedeclareSectionCommand[beforeskip=-1.2\baselineskip,afterskip=0.75\baselineskip]{chapter}
\RedeclareSectionCommand[beforeskip=1.5\baselineskip,afterskip=0.55\baselineskip]{section}
\RedeclareSectionCommand[beforeskip=1.1\baselineskip,afterskip=0.35\baselineskip]{subsection}
\RedeclareSectionCommand[beforeskip=0.9\baselineskip,afterskip=0.25\baselineskip]{subsubsection}

\AtBeginDocument{%
  \addtokomafont{partnumber}{\color{CourseBlue}}
  \setcounter{tocdepth}{1}
  \setcounter{secnumdepth}{3}
  \hypersetup{%
    pdfauthor={\coursecoordinator},%
    pdftitle={\coursecode\space -- \coursetitle}%
  }%
}

% -----------------------------------------------------------------------------
% Title page and information page
% -----------------------------------------------------------------------------
\newcommand{\makecoursetitle}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \vspace*{18mm}
    {\sffamily\small\bfseries\color{CourseBlue}\MakeUppercase{\courseschool}\par}
    \vspace{16mm}
    {\sffamily\fontsize{17}{20}\selectfont\bfseries\color{CourseGray}\coursecode\par}
    \vspace{4mm}
    {\sffamily\fontsize{34}{40}\selectfont\bfseries\color{CourseNavy}\coursetitle\par}
    \vspace{6mm}
    {\Large\color{CourseGray}\coursesubtitle\par}
    \vspace{12mm}
    {\color{CourseBlue}\rule{0.62\textwidth}{1.2pt}\par}
    \vfill
    {\large
    \begin{coursemetatable}[34mm]
      \coursemetakey{Academic year} & \courseyear \\
      \coursemetakey{Term} & \courseterm \\
      \coursemetakey{Instructor} & \courseinstructor \\
      \coursemetakey{Prepared by} & \coursecoordinator \\
      \coursemetakey{Version} & \courseversion \\
      \coursemetakey{Last updated} & \courseupdated \\
    \end{coursemetatable}
    }
    \vspace{20mm}
  \end{titlepage}
}

\newcommand{\makecourseinformation}{%
  \chapter*{Document Information}
  \addcontentsline{toc}{chapter}{Document Information}
  \begin{coursemetatable}[42mm]
    \coursemetakey{Course code} & \coursecode \\
    \coursemetakey{Course title} & \coursetitle \\
    \coursemetakey{School / department} & \courseschool \\
    \coursemetakey{Academic year} & \courseyear \\
    \coursemetakey{Term} & \courseterm \\
    \coursemetakey{Instructor} & \courseinstructor \\
    \coursemetakey{Editorial responsibility} & \coursecoordinator \\
    \coursemetakey{Document version} & \courseversion \\
    \coursemetakey{Last updated} & \courseupdated \\
    \coursemetakey{Distribution} & \courselicence \\
    \ifdefempty{\coursewebsite}{}{\coursemetakey{Project page} & \url{\coursewebsite} \\
}
  \end{coursemetatable}
  \section*{Scope}
  This document is organised into three independent but connected components:
  \begin{enumerate}
    \item \textbf{Knowledge Notes}: definitions, results, methods, examples, and common errors;
    \item \textbf{TTL Materials}: tutorial or task-sheet problems with structured solutions;
    \item \textbf{Past Papers}: archived examination questions, complete solutions, and marking guidance where available.
  \end{enumerate}

  \section*{Editorial Notice}
  Every result and solution should be checked against official materials whenever
  possible. Corrections must be recorded in the revision history. Original university
  papers and official solutions must retain their source labels and should be shared
  only when distribution is permitted.
}

% -----------------------------------------------------------------------------
% Tables and utility commands
% -----------------------------------------------------------------------------
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

% Metadata table helpers
\newcommand{\coursemetakey}[1]{\sffamily\bfseries\footnotesize\color{CourseGray}#1}
\newenvironment{coursemetatable}[1][36mm]{%
  \setlength{\tabcolsep}{0pt}%
  \renewcommand{\arraystretch}{1.28}%
  \begin{tabular}{@{}p{#1}@{\hspace{1.25em}}p{\dimexpr\linewidth-#1-1.25em\relax}@{}}%
}{%
  \end{tabular}%
}

\newcommand{\dd}{\,\mathrm{d}}
\newcommand{\e}{\mathrm{e}}
\newcommand{\ii}{\mathrm{i}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\Span}{span}
\DeclareMathOperator{\tr}{tr}

% -----------------------------------------------------------------------------
% Tags
% -----------------------------------------------------------------------------
\newcommand{\coursetag}[2]{%
  \tcbox[
    on line,
    boxrule=0.35pt,
    arc=1.5pt,
    left=3pt,right=3pt,top=1pt,bottom=1pt,
    colback=#1!7,
    colframe=#1!55,
    coltext=#1!85!black
  ]{\sffamily\scriptsize\bfseries\MakeUppercase{#2}}%
}
\newcommand{\CoreTag}{\coursetag{CourseBlue}{Core}}
\newcommand{\ExamTag}{\coursetag{CourseTeal}{Exam}}
\newcommand{\ProofTag}{\coursetag{CourseNavy}{Proof}}
\newcommand{\CalculationTag}{\coursetag{CourseAmber}{Calculation}}
\newcommand{\ExtensionTag}{\coursetag{CourseGray}{Extension}}
\newcommand{\CheckTag}{\coursetag{CourseRed}{Check}}

% -----------------------------------------------------------------------------
% Theorem environments
% -----------------------------------------------------------------------------
\newtheoremstyle{courseplain}
  {0.8\baselineskip}{0.8\baselineskip}
  {\itshape}{}
  {\sffamily\bfseries\color{CourseNavy}}
  {.}{0.5em}{}
\newtheoremstyle{coursedefinition}
  {0.8\baselineskip}{0.8\baselineskip}
  {\normalfont}{}
  {\sffamily\bfseries\color{CourseNavy}}
  {.}{0.5em}{}
\newtheoremstyle{courseremark}
  {0.65\baselineskip}{0.65\baselineskip}
  {\normalfont}{}
  {\sffamily\bfseries\color{CourseGray}}
  {.}{0.5em}{}

\theoremstyle{courseplain}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}

\theoremstyle{coursedefinition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
\newtheorem{exercise}[theorem]{Exercise}
\newtheorem{assumption}[theorem]{Assumption}

\theoremstyle{courseremark}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{observation}[theorem]{Observation}

\renewcommand{\proofname}{Proof}
\AtBeginEnvironment{proof}{\color{black}}

% -----------------------------------------------------------------------------
% Clean information boxes
% -----------------------------------------------------------------------------
\newtcolorbox{learningobjectives}[1][Learning Objectives]{
  breakable,
  enhanced,
  colback=CourseLightGray,
  colframe=CourseRule,
  boxrule=0.5pt,
  arc=1.5pt,
  left=8pt,right=8pt,top=7pt,bottom=7pt,
  title={#1},
  fonttitle=\sffamily\bfseries\color{CourseNavy},
  coltitle=CourseNavy,
  attach boxed title to top left={xshift=0pt,yshift=-2pt},
  boxed title style={colback=CourseLightGray,colframe=CourseLightGray,boxrule=0pt}
}

\newtcolorbox{keypoint}[1][Key Point]{
  breakable,
  enhanced,
  colback=CourseBlue!4,
  colframe=CourseBlue!55,
  boxrule=0pt,
  borderline west={2.2pt}{0pt}{CourseBlue},
  arc=0pt,
  left=9pt,right=8pt,top=7pt,bottom=7pt,
  title={#1},
  fonttitle=\sffamily\bfseries\color{CourseNavy},
  coltitle=CourseNavy
}

\newtcolorbox{examnote}[1][Exam Note]{
  breakable,
  enhanced,
  colback=CourseTeal!4,
  colframe=CourseTeal!55,
  boxrule=0pt,
  borderline west={2.2pt}{0pt}{CourseTeal},
  arc=0pt,
  left=9pt,right=8pt,top=7pt,bottom=7pt,
  title={#1},
  fonttitle=\sffamily\bfseries\color{CourseTeal!80!black},
  coltitle=CourseTeal!80!black
}

\newtcolorbox{commonerror}[1][Common Error]{
  breakable,
  enhanced,
  colback=CourseRedBg,
  colframe=CourseRed!55,
  boxrule=0pt,
  borderline west={2.2pt}{0pt}{CourseRed},
  arc=0pt,
  left=9pt,right=8pt,top=7pt,bottom=7pt,
  title={#1},
  fonttitle=\sffamily\bfseries\color{CourseRed},
  coltitle=CourseRed
}

\newtcolorbox{editorialnote}[1][Editorial Note]{
  breakable,
  colback=CourseAmberBg,
  colframe=CourseAmber!50,
  boxrule=0.5pt,
  arc=1.5pt,
  left=8pt,right=8pt,top=7pt,bottom=7pt,
  title={#1},
  fonttitle=\sffamily\bfseries\color{CourseAmber},
  coltitle=CourseAmber
}

% -----------------------------------------------------------------------------
% TTL and past-paper problem environments
% -----------------------------------------------------------------------------
\newtcbtheorem[number within=chapter]{ttlproblem}{TTL Problem}{
  breakable,
  enhanced,
  colback=white,
  colframe=CourseBlue!65,
  boxrule=0.6pt,
  arc=1.5pt,
  left=8pt,right=8pt,top=8pt,bottom=8pt,
  fonttitle=\sffamily\bfseries,
  coltitle=CourseNavy,
  separator sign={.}
}{ttl}

\newtcbtheorem[number within=chapter]{pastpaperproblem}{Past-Paper Problem}{
  breakable,
  enhanced,
  colback=white,
  colframe=CourseTeal!70,
  boxrule=0.6pt,
  arc=1.5pt,
  left=8pt,right=8pt,top=8pt,bottom=8pt,
  fonttitle=\sffamily\bfseries,
  coltitle=CourseTeal!80!black,
  separator sign={.}
}{paper}

\newtcolorbox{markscheme}[1][Marking Guidance]{
  breakable,
  colback=CourseLightGray,
  colframe=CourseRule,
  boxrule=0.5pt,
  arc=1.5pt,
  left=8pt,right=8pt,top=7pt,bottom=7pt,
  title={#1},
  fonttitle=\sffamily\bfseries\color{CourseNavy},
  coltitle=CourseNavy
}

\newtcolorbox{solutionbox}[1][Solution]{
  breakable,
  enhanced,
  colback=CourseLightGray,
  colframe=CourseRule,
  boxrule=0.5pt,
  arc=1.5pt,
  left=8pt,right=8pt,top=7pt,bottom=7pt,
  title={#1},
  fonttitle=\sffamily\bfseries\color{CourseNavy},
  coltitle=CourseNavy
}

\ifcourseshowsolutions
  \newenvironment{coursesolution}[1][Solution]
    {\begin{solutionbox}[#1]}
    {\end{solutionbox}}
\else
  \excludecomment{coursesolution}
\fi

% -----------------------------------------------------------------------------
% Problem metadata and revision history
% -----------------------------------------------------------------------------
\newcommand{\probleminfo}[4]{%
  \begin{tabularx}{\textwidth}{@{}>{\sffamily\bfseries\color{CourseGray}}L{27mm}Y
      >{\sffamily\bfseries\color{CourseGray}}L{22mm}Y@{}}
    Topic & #1 & Difficulty & #2 \\
    Source & #3 & Marks & #4
  \end{tabularx}
  \vspace{0.4\baselineskip}
}

\newenvironment{revisionhistory}
  {\begin{longtable}{@{}L{17mm}L{20mm}L{25mm}L{60mm}@{}}
   \toprule
   \textbf{Version} & \textbf{Date} & \textbf{Editor} & \textbf{Change} \\
   \midrule
   \endhead}
  {\bottomrule\end{longtable}}

% -----------------------------------------------------------------------------
% Front-matter helpers
% -----------------------------------------------------------------------------
\newcommand{\CourseFrontMatter}{%
  \pagenumbering{roman}
  \makecoursetitle
  \makecourseinformation
  \tableofcontents
  \clearpage
  \pagenumbering{arabic}
}

% -----------------------------------------------------------------------------
% End of class
% -----------------------------------------------------------------------------
