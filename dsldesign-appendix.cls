\RequirePackage[l2tabu, orthodox]{nag}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dsldesign}[2022/04/08 dsldesign class]
\RequirePackage{pdf14}
\pdfminorversion=6

\newcommand*\openingoption{}
\DeclareOption{openany}{%
  \renewcommand*\openingoption{openany}%
}
\DeclareOption{openright}{%
  \renewcommand*\openingoption{openright}%
}
\ProcessOptions
\LoadClass[10pt,a4paper,\openingoption]{book}%__]

\RequirePackage{floatrow} % apparently cannot be later bcs it fails during build (with ' ! No room for a new \dimen ') see https://www.tug.org/pipermail/tex-live/2015-June/037043.html

\RequirePackage[strict]{changepage}
\RequirePackage{etex}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{rotating}
\PassOptionsToPackage{hyphens}{url}
\RequirePackage[hyphens]{url}
\RequirePackage[scaled=.83]{helvet}
\RequirePackage[scale=.8]{noto-mono}
\RequirePackage[flushmargin]{footmisc}
\RequirePackage[normalem]{ulem}
\RequirePackage[
  footnoteinside = false,
  framemethod = tikz
]{mdframed} % for making boxes around text, order sensitive

% Not used right now, so deactivate to speed up build
%\RequirePackage[acronyms,nopostdot]{glossaries}

\RequirePackage[
  defaultlines = 2,
  all
]{nowidow}

% \RequirePackage{tcolorbox} % a better replacement for mdframed
% We are not using yet, and for this project, it probably makes no
% sense to migrate.  But noting it here, just in case.

\RequirePackage{svg}

% \renewcommand{\rmdefault}{ptm}
% \usepackage[lite,subscriptcorrection,slantedGreek,nofontinfo]{mtpro2}

\RequirePackage{
  afterpage,
  amsmath,
  amssymb,
  amsthm,
  booktabs,      % we use \midrule here and there
  colortbl,
  % datetime, TODO: remove if nothing complains
  environ,
  fancyhdr,
  fontawesome,  % seems to be used in 13-pla
  footnote,     % for helping footnotes in boxes
  geometry,
  ifoddpage,    % for raggedright/left figure captions (\checkoddpage)
  lineno,
  lipsum,
  mathpartir,
  mathtools,
  mathptmx,     % this seems to be the required font by Springer
  mdd-tikz,
  microtype,
  morewrites,
  multicol,
  newfloat,
  nicefrac,
  relsize,
  sidenotes,
  soul,         % for underlining text
  subcaption,   % to format figure captions (very brittle)
  stmaryrd,     % for \llbracket, \rrbracket
  tablefootnote,% for footnotes inside mdframe and tables
  tabularx,
  thmtools,
  tocloft,
  totcount,
  % underscore, % can't have it, conflicts with ifoddpage
  versions,
  wrapfig,     % killed once docs for new newfloat available
  xparse,
  xr-hyper,
  xspace,
  tocloft
}

\RequirePackage{
  alphalph,
  listings,
  lst-xtext,
}

% this makes mdframed put references in the bottom of the page.  But they get a wrong number (a letter).  So better use \tablefootmark{\fullcite{..}} instead
\makesavenoteenv{mdframed}

% apparently this is needed to make tablefootnote make the job,
% and actually spew tablefootnotes at the bottom of the page
\AfterEndEnvironment{mdframed}{%
 \tfn@tablefootnoteprintout%
 \gdef\tfn@fnt{0}%
}

% Page Configuration

\geometry{
  driver = pdftex,
  includehead,
  includemp,
  paperwidth = 168mm,
  paperheight = 240mm,
  textheight = 192.29mm,
  textwidth = 104mm,
  marginparwidth = 31.5mm,
  marginparsep = 1.5mm,
  columnsep = 1.5mm, % used by floatrow instead of marginsep for caption sep
  headsep = 3mm,
  inner = 19.02mm,
  top =  13.13mm,
  %showframe,
  % footskip=6mm plus 1mm minus 2mm,
}

\renewcommand{\sectionmark}[1]%
  {\markboth{\leftmark}{\thesection\ {#1}}}
\renewcommand{\chaptermark}[1]%
  {\markboth{\thechapter\ {#1}}{\rightmark}}

\fancypagestyle{preface}{
  \fancyhf{} % sets both header and footer to nothing
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[LO]
    {\footnotesize Preface}
  \fancyhead[RE]
    {\footnotesize Domain-Specific Languages}
  \fancyhead[LE,RO]
    {\footnotesize\thepage}
}

\fancypagestyle{foreword}{
  \fancyhf{} % sets both header and footer to nothing
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[LO]
    {\footnotesize Foreword}
  \fancyhead[RE]
    {\footnotesize Domain-Specific Languages}
  \fancyhead[LE,RO]
    {\footnotesize\thepage}
}


\fancypagestyle{regular}{
  \fancyhf{} % sets both header and footer to nothing
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[LO]
    {\footnotesize\nouppercase{\rightmark}}
  \fancyhead[RE]
    {\footnotesize\nouppercase{\leftmark}}
  \fancyhead[LE,RO]
    {\footnotesize\thepage}
}

% I am not sure why but we need to adjust headers for geometry
\fancyhfoffset[LE]{\marginparwidth+\marginparsep+2.2mm}
\fancyhfoffset[RO]{\marginparwidth-\marginparsep}
\fancyhfoffset[RE]{-2.1mm}
\fancyhfoffset[LO]{3.0mm}


% Paragraph Setup

\setlength{\parindent}{1em}
\setlength{\parskip}{0pt plus 1pt minus 0.3pt}
\nonfrenchspacing

% TOC

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\setlength\cftaftertoctitleskip{.6em}
\setlength\cftbeforesecskip{0.7pt plus 0.1pt}
\setlength\cftbeforechapskip{2pt}
\setlength\cftparskip{0pt}
\renewcommand{\cftsecfont}{%
\fontsize{9}{9}\usefont{T1}{ptm}{bc}{b}\selectfont}
\renewcommand{\cftsecpagefont}{%
\fontsize{9}{9}\usefont{T1}{ptm}{bc}{b}\selectfont}
\renewcommand\cfttoctitlefont{\Large\bfseries\sffamily}

\urlstyle{sf}

% Color Theme

% hint: Light* colors should be used for diagrams; they add a transparency of 34% to the color
\xdefinecolor{LightLightGreen}{rgb}{0.95,1,0.81} % 242,255,206 #f2ffce
% 242,214,128 modified on purpose to correct the color slightly
\xdefinecolor{RomanticPaleYellow}{HTML}{F3D679} % 235,156,77
\xdefinecolor{SugarLove}{HTML}{EB9C4D}
\xdefinecolor{Memories}{rgb}{0.73,0.79,0.66} % 186, 201, 169 #bac9a9
\xdefinecolor{LightMemories}{HTML}{E7ECE1}
% the original color that we are asked to make more intensive
%\xdefinecolor{DarkGreenGray}{HTML}{697060} % 105,112,96 #697060
\xdefinecolor{olive}{cmyk}{0.64,0,0.95,0.4}
\xdefinecolor{darkolive}{cmyk}{0.7,0,1.0,0.6}
\xdefinecolor{DarkGreenGray}{cmyk}{0.45,0,0.51,0.71}

% colors below not really from our palette (for emergencies)

\xdefinecolor{DarkRed}{HTML}{800000}
\xdefinecolor{LightGray}{gray}{0.90}

\newcommand{\EcoreScale}{0.58}
\newcommand{\EcoreScaleBig}{0.78}

% Hyperref needs colors defined

\RequirePackage[
  pdftex,
  colorlinks = true,
  linkcolor = DarkGreenGray,
  citecolor = DarkGreenGray,
  urlcolor = DarkGreenGray,
  bookmarks = true,
  breaklinks = true
]{hyperref}


%style was: authoryear
\RequirePackage[
  backend = biber,
  backref = true,
  % style = numeric-comp,
  style = ext-numeric,
  natbib = true,
  maxbibnames = 7,
  bibtexcaseprotection = true,
  casechanger = auto,
  language = autobib
]{biblatex}

\DefineBibliographyStrings{english}{
  backrefpage={cit.\,p.},
  backrefpages={cit.\,pp.}
}

\DeclareFieldFormat
  [article,inbook,incollection,inproceedings,patent,report,thesis,unpublished]
  {titlecase:title}{\MakeSentenceCase{#1}}

\setlength\bibitemsep{.3pt}
\setlength\bibnamesep{.3pt}
\setlength\bibinitsep{0pt}

% Glossary

% \makeglossaries

% formatting of section and chapter headers

\RequirePackage[
  explicit,
  compact,
]{titlesec}
\RequirePackage{titletoc}

% from the titlesec documentation:
% \titleformat
%  {command-redefined}
%  [shape]    one of hang, block, display, runin, leftmargin, rightmargin,  drop, wrap, frame
%  {format}   vertical material (and horizontal with some shapes) which is typeset just after the space above
%  {label}    The label, eg. 'Chapter 1'
%  {sep}      horizontal separation between label and title body
%  (must be a non-empty length
%  {before code}
%  [after code]
%
% \titlespacing*
%   {command}
%   {left}       increases the left margin, except in the ...margin, and drop shape, where this parameter sets the title width, in wrap, the maximum width, and in runin, the indentation just before the title. With negative value the title overhangs
%   {beforesep} vertical space before the tile
%   {aftersep}  vertical space between the title and text ((for hang/block/display) and horizontal for others
%   [right]
% (the star kills indentation on the following paragraph)

\titleformat
  {name=\chapter}
  {\Large\bfseries\sffamily}
  {}
  {0ex}
  {{\Huge\textcolor{DarkGreenGray}{\thechapter~}}#1}

\titleformat
  {name=\chapter, numberless}
  {\Large\bfseries\sffamily}
  {}
  {0ex}
  {#1}

\titlespacing*
  {\chapter}
  {0pt}
  {18mm plus 2ex minus 1ex}
  {2.5ex plus 0.4ex minus 0.5ex}

\titleformat
  {\section}
  {\large\bfseries\sffamily}
  {}
  {0ex plus 1ex minus 0.2ex}
  {\textcolor{DarkGreenGray}{\thesection}~#1}

\titleformat
  {name=\section, numberless}
  {\large\bfseries\sffamily}
  {}
  {0ex}
  {#1}

\titlespacing*
  {\section}
  {0pt}
  {1.2\baselineskip plus 0.3ex minus 1.2ex}
  {1.15ex plus 0.3ex minus 0.3ex}

\titleformat
  {name=\subsection}
  {\color{DarkGreenGray}\normalsize\bfseries\sffamily}
  {}
  {0ex}
  {#1}

\titlespacing*
  {\subsection}
  {0pt}
  {1.0\baselineskip plus 0.2ex minus 0.8ex}
  {0.8ex plus 0.3ex minus 0.2ex}

\titleformat
  {name=\subsubsection}
  [runin]
  {\normalsize\bfseries\rmfamily}
  {}
  {0pt}
  {#1}

\titlespacing*
  {\subsubsection}
  {0pt}
  {0.8\baselineskip plus 0.3ex minus 0.5ex}
  {0.5em plus 0.3em}

\titleformat
  {\paragraph}
  [runin]
  {\color{DarkGreenGray}\itshape}
  {}
  {1.4pt plus 1pt minus 0.4pt}
  {#1}

\titlespacing*
  {\paragraph}
  {0pt}
  {1.0ex plus 0.3ex minus 0.5ex}
  {0.5em plus 0.3em}

% guidelines

\newcounter{guideline}
\counterwithin{guideline}{chapter}

\titleclass
  {\guideline}
  {straight}
  [\section]

\newcommand{\marginLabelCurrentLine}[1]%
{\protect\marginnote{%
  \smash{\raisebox{1\baselineskip}{\textbf{\textit{\footnotesize #1}}}\strut}}}

\titleformat
  {name=\guideline}
  [runin]
  {\color{DarkGreenGray}\sffamily}
  {\protect\marginLabelCurrentLine{Guideline\,\theguideline}}
  %{.4em plus 0.08em minus 0.04em}
  {0pt}
  {\rmfamily\itshape#1}

\titlespacing
  {\guideline}
  {0pt}
  {1.0ex plus 0.3ex minus 0.5ex}
  {0.5em plus 0.3em}

\titlecontents{guideline}
              [0em]
              {}
              {}
              {\hspace*{-2.3em}}
              {\hfill}

%  Make sure that PDF TOC (bookmarks) are not messed up by
%  guidelines
\def\toclevel@guideline{2}

% todo notes

\RequirePackage[
  color = Memories,
  textsize = tiny,
  shadow,
]{todonotes}

\RequirePackage{changepage}

\RequirePackage[
  inline
]{enumitem}

\setdescription{
  parsep=1mm,
  itemsep=2mm plus 0.5mm minus 0.3mm,
  leftmargin=0mm
}

\setitemize{
  topsep = 1mm plus 0.3mm minus 0.3mm,
  parsep = 0mm plus 0.3mm,
  itemsep = 0.7mm plus 0.3mm minus 0.3mm,
  leftmargin = 3.3mm
}

\setlist[enumerate]{
  topsep = 2mm plus 0.3mm minus 0.3mm,
  parsep = 0mm plus 0.3mm,
  itemsep = 0.7mm plus 0.3mm minus 0.3mm,
  leftmargin = 4.6mm,
  label=\textbf{\arabic*.},
}

\newcommand{\tb}[1]{\todo[color=orange]{\textsf{TB:} #1}}

% should be done before cleveref?
% https://tex.stackexchange.com/a/66041
\numberwithin{equation}{chapter}
\newtheorem{theorem}[equation]{Theorem}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{property}[theorem]{Property}

% must be loaded after hyperref, actually should be loaded last
\RequirePackage[capitalize]{cleveref}

% Second argument is singular, third is plural
\crefname{definition}{Def.}{Definitions}
\Crefname{definition}{Definition}{Definitions}

\crefname{figure}{Fig.}{Figures}
\Crefname{figure}{Figure}{Figures}

\crefname{table}{Tbl.}{Tables}
\Crefname{table}{Table}{Tables}

\Crefname{guideline}{Guideline}{Guidelines}
\crefname{guideline}{Guideline}{guidelines}

\crefname{page}{p.}{pages}
\Crefname{page}{Page}{Pages}

\crefname{section}{Sect.}{Sections}
\Crefname{section}{Section}{Sections}

\crefname{chapter}{Chapter}{Chapters}
\Crefname{chapter}{Chapter}{Chapters}

% make cleveref use the Oxford comma
\newcommand{\creflastconjunction}{, and\nobreakspace}

% Configure the layout of figures

\DeclareColorBox{MemoriesColorBox}{\fcolorbox{Memories}{white}}

\DeclareNewFloatType{infofloat}{
   fileext = frm,
   placement = {t},
   within = {chapter}
}

\floatsetup[infofloat]{
  capposition=below,
  floatwidth=sidefil,
  objectset=justified,
  style = plain,
}

\floatsetup{
  style=Boxed,
  facing=yes,
  margins=hangoutside,
  floatwidth=sidefil,
  framestyle=colorbox,
  capbesideframe=yes,
  capposition=beside,
  capbesidewidth=\marginparwidth,
  capbesideposition={outside,bottom},
  frameset={\fboxrule0.4pt\fboxsep5pt},
  % postcode=captionskip,
  % captionskip=5pt,
}

\floatsetup[table]{%
  capbesidewidth = \marginparwidth,
  objectset = justified,
  colorframeset = MemoriesColorBox,
  floatwidth = \textwidth
}

\floatsetup[figure]{%
  capbesidewidth = \marginparwidth,
  objectset = justified,
  colorframeset = MemoriesColorBox,
  floatwidth = \textwidth
}

\floatsetup[figure*]{%
  facing=yes,
  style=Boxed,
  margins=hangoutside,
  capbesidewidth=\marginparwidth,
  capbesideposition={outside,bottom},
  capposition=below,
  floatwidth=sidefil,
  frameset={\fboxsep8pt},
  objectset=justified,
  capbesideframe=yes,
  framestyle=colorbox,
  colorframeset=MemoriesColorBox,
}

\DeclareCaptionJustification%
  {raggedAuto}%
  {\checkoddpage%
   \ifoddpage%
     \raggedright%
  \else%
    \raggedleft%
  \fi}

\captionsetup{
  %strut = yes,
  labelfont={color={DarkGreenGray},bf,sf},
  font={footnotesize,sf,it},
  justification=raggedAuto,
  singlelinecheck=false
  % labelsep=newline (puts a newline after the label)
}

\setlength{\textfloatsep}{2ex plus 1.0pt minus .5pt}
\setlength{\floatsep}{2ex plus 1.0pt minus .5pt}
\setlength{\intextsep}{2ex plus 1.0pt minus .5pt}


% listings setup

\lstset{
  % footnotesize only in display (otherwise wrong size in inline listings)
  basicstyle = {\ttfamily\lst@ifdisplaystyle\footnotesize\fi},
  tabsize = 3,
  columns = fixed,
  numbers = left,
  numberstyle = {\tiny\sffamily},
  stepnumber = 1,
  aboveskip = -0.1\baselineskip,
  belowskip = -0.1\baselineskip,
  numbersep = 3pt,
  xleftmargin = 7pt,
  keywordstyle = \color{DarkGreenGray}\ttfamily,
  stringstyle = \color{DarkGreenGray}\ttfamily,
  commentstyle = \color{DarkGreenGray}\itshape\ttfamily,
  escapechar=^,
  numberblanklines = false
}

% boxes


\mdfdefinestyle{MDSEBOOK}{
  backgroundcolor = Memories!34,
  font = \normalfont\small,
  hidealllines = true,
  innerbottommargin = 2ex plus 1pt minus 1pt,
  innerleftmargin = 1em,
  innerrightmargin = 1em,
  innertopmargin = 1.3ex plus 1pt minus 1pt,
  leftmargin = 0pt,
  linecolor = DarkGreenGray,
  linewidth = .5,
  rightmargin = 0pt,
  shadowcolor = DarkGreenGray,
  shadowsize = .66pt,
  skipabove = 1ex plus 1pt minus 1pt,
  skipbelow = 1ex plus 1pt minus 1pt,
  splittopskip = 3ex plus 1pt minus 1pt,
  splitbottomskip = 2.0ex plus 1pt minus 1pt,
  frametitlefont = \large\sffamily\bfseries,
  frametitleaboveskip = 2ex plus 0.3ex minus 0.1ex,
  frametitlebelowskip = -1ex
}

\mdfdefinestyle{MDEXERCISE}{
  topline = false,
  bottomline = false,
  rightline = false,
  leftline = true,
  linewidth = 1mm,
  linecolor =  Memories!18,
  skipabove = 0ex,
  skipbelow = 0ex,
  innerleftmargin = 0.5em,
  innerbottommargin = 0ex,
  innerrightmargin = 0ex,
  innertopmargin = 0ex,
  frametitleaboveskip = 0ex,
  splitbottomskip = 0pt,
}

\newenvironment{NamedBox}[1]{%
  \begin{mdframed}[
    style = MDSEBOOK,
    frametitle={#1}
  ]}%
{\end{mdframed}}

\newenvironment{infobox}[1]{%
  \thisfloatsetup{capposition=below}
  \begin{infofloat}[t!]
  \begin{NamedBox}{#1}\parskip=0.4\baselineskip%
}%
{%
  \end{NamedBox}
  \end{infofloat}
}%

% theorem-like environments setup (handled using thmtools.sty)

\declaretheoremstyle[
  spaceabove = 4pt plus 1pt minus 1pt,
  spacebelow = 5pt plus 1pt minus 1pt,
  headfont = \rmfamily\bfseries\color{DarkGreenGray},
  bodyfont = \itshape
]{mddthm}

\theoremstyle{mddthm}

\theoremstyle{definition}

\declaretheoremstyle[
  spaceabove = 0pt, % these are  inside the frame,
  spacebelow = 0pt, % so better keep at zero
  headfont = \sffamily\bfseries\color{DarkGreenGray},
  bodyfont = \small,
]{exerciseStyle}

\declaretheorem[
  style = exerciseStyle,
  name = Exercise,
  numberwithin = chapter,
]{exxxercise}

\newtotcounter{lastExercise}
\newenvironment{exercise}%
{\refstepcounter{lastExercise}%
 \addvspace{1.9ex plus 0.1ex minus 1pt}

 \begin{mdframed}[ style = MDEXERCISE ]%
 \begin{exxxercise}%
   \setenumerate[0]{
     label=\textbf{\alph*)},
     leftmargin = 4.8mm,
     itemsep = 0mm plus 0.3mm minus 0.2mm,
   }%
}%
{\end{exxxercise}%
 \end{mdframed}
 \addvspace{0ex plus 0.1ex minus -2pt}}

\declaretheoremstyle[%
  headfont = \sffamily\bfseries\color{DarkGreenGray},
  bodyfont = \small,
  mdframed = { style = MDSEBOOK,
               backgroundcolor = Memories!18 }
]{exampleStyle}

\declaretheorem[
  name = Example,
  style = exampleStyle
]{example}


% I think math displays are too large.  This is an experiment to
% make some of them smaller (in a way that we can easily revert
% globally)


\newlength\smallcorrectionPRE
\newlength\smallcorrectionPOST
\setlength{\smallcorrectionPRE}{-1.3ex plus 0.1ex}
\setlength{\smallcorrectionPOST}{-1.3ex plus 0.1ex minus 0.1ex}

\NewEnviron{smallEquation}%
{
  \addvspace{\smallcorrectionPRE}

  \begin{small}
    \begin{equation}%
    \displaystyle \BODY%
    \end{equation}
  \end{small}

  \addvspace{\smallcorrectionPOST}
}

\NewEnviron{smallAlign}%
{
  \addvspace{\smallcorrectionPRE}

  \begin{small}
    \begin{align}%
    \displaystyle \BODY%
    \end{align}
  \end{small}

  \addvspace{\smallcorrectionPOST}
}

\NewEnviron{smallAlign*}%
{
  \addvspace{\smallcorrectionPRE}

  \begin{small}
    \begin{align*}%
    \displaystyle \BODY%
    \end{align*}
  \end{small}

  \addvspace{\smallcorrectionPOST}
}

\NewEnviron{smallGather}%
{
  \addvspace{\smallcorrectionPRE}

  \begin{small}
    \begin{gather}%
      \displaystyle \BODY%
    \end{gather}
  \end{small}

  \addvspace{\smallcorrectionPOST}
}

\NewEnviron{smallMultline}%
{
  \addvspace{\smallcorrectionPRE}

  \begin{small}
    \begin{multline}%
      \displaystyle \BODY%
    \end{multline}
  \end{small}

  \addvspace{\smallcorrectionPOST}
}

\newcommand{\motto}[1]{%
  \rightline{\smash{\raisebox{20mm}{\begin{minipage}[b][][t]{60mm}%
      \begin{flushright}%
        \small\textit{#1}
      \end{flushright}%
\end{minipage}}}}
\vspace{-\baselineskip}}

% patch normalsize to use slightly tighter math spacing

\g@addto@macro\normalsize{%
  \setlength\abovedisplayskip{1.5ex}
  \setlength\belowdisplayskip{1.5ex}
  \setlength\abovedisplayshortskip{0.8ex}
  \setlength\belowdisplayshortskip{0.8ex}
}

\renewcommand{\implies}{\rightarrow}

% standardized repo links

\newcommand{\srclinktext}[1]{{%
    \sffamily%
    \href%
      {https://bitbucket.org/dsldesign/dsldesign/src/master/dsldesign.#1}%
      {\nolinkurl{#1}}%
}}

\newcommand{\srclink}[1]{%
  {\scriptsize\sffamily source:
\href{https://bitbucket.org/dsldesign/dsldesign/src/master/dsldesign.#1}{#1}}}
\newcommand{\srclinkline}[1]{\rightline{\srclink{#1}}}

\newcommand{\extsrclink}[1]{{%
  \sffamily%
  source: \href{http://#1}{#1}%
}}
\newcommand{\extsrclinkline}[1]{\rightline{\scriptsize\extsrclink{#1}}}


\newcommand{\rname}[1]{{\footnotesize\left(\textsc{#1}\right)}}
\newcommand{\rlname}[1]{\mathllap{\ensuremath\footnotesize\left(\textsc{#1}\right)}}

% Put this in every cell in the header

\newcommand{\thdr}[1]{{%
  \narrowfont%
  \footnotesize%
  \bfseries%
  #1%
}}

\def\PTSansNarrow@scale{0.88}

\newcommand*%
  {\narrowfont}%
  {\fontfamily{PTSansNarrow-TLF}\selectfont}

% Allow some hyphenation

\pretolerance=80
\tolerance=200
\hyphenpenalty=200
\clubpenalty80 % allow to break lines on relations

\renewcommand{\arraystretch}{1.35}


% some macros for processes with activities

\newcommand{\co}{clone\,\&\,own\xspace}
\newcommand{\Co}{Clone\,\&\,own\xspace}
\newcommand{\CO}{Clone\,\&\,Own\xspace}
\newcommand{\hashifdef}{\inline{\#ifdef}\xspace}
\newcommand{\hashifndef}{\inline{\#ifndef}\xspace}
\newcommand{\ifndef}{\inline{\#ifndef}\xspace}
\newcommand{\hashelse}{\inline{\#else}\xspace}
\newcommand{\hashendif}{\inline{\#endif}\xspace}
\newcommand{\hashelif}{\inline{\#elif}\xspace}
\newcommand{\hashif}{\inline{\#if}\xspace}

\definecolor{myRed}{HTML}{EE2967}
\definecolor{myGreen}{HTML}{3C8031}
\definecolor{myBlue}{HTML}{006EB8}
\definecolor{lightBlue}{HTML}{90B0C6}
\newcommand{\activity}{{\color{olive}\larger\faCog}\xspace}
\newcommand{\compositeactivity}{{\color{olive}\larger\faCogs}\xspace}
\newcommand{\optionalcompositeactivity}{{\color{RomanticPaleYellow}\larger(\faCogs)}\xspace}
\newcommand{\subactivity}{{\color{Memories}\larger\faCog}\xspace}
\newcommand{\optionalactivity}{{\color{RomanticPaleYellow}\larger{(\faCog})}\xspace}
\newcommand{\question}{{\color{SugarLove}\larger\faQuestionCircleO}\xspace}


% vim:ft=tex:tw=66:cc=66:nospell
