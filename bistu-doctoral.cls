\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesClass{bistu-doctoral}[2026/09/27 BISTU doctoral thesis]
% The source of the layout is the supplied Word template dated 2026-06-23.
% Word uses PostScript points: use bp (1/72 inch), not TeX pt.
\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{bistu-doctoral}{Please compile with XeLaTeX}{Select XeLaTeX as the compiler.}
\fi
\DeclareOption{portablefonts}{%
  \ClassError{bistu-doctoral}{Substitute fonts are not permitted}%
    {Remove the portablefonts option. Keep all required original fonts in fonts/.}}
\DeclareOption*{\ClassWarning{bistu-doctoral}{Unknown option '\CurrentOption'}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,twoside,openright]{book}
\PassOptionsToPackage{no-math}{fontspec}
% 连续标题之间取段后、段前间距的较大值，避免省略后一个标题的24磅段前。
\PassOptionsToPackage{largestsep}{titlesec}
\RequirePackage{geometry,fontspec,xeCJK,graphicx,fancyhdr,titlesec}
\RequirePackage{indentfirst,ragged2e,booktabs,array,longtable,tabularx,needspace}
\RequirePackage{amsmath,amssymb,fix-cm,caption,tocloft,enumitem,etoolbox,tikz}
\RequirePackage{mathspec}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage[unicode,hidelinks,bookmarksnumbered]{hyperref}
\RequirePackage{bookmark}
% 兼容旧稿的备注命令；通用模板的全部格式说明集中在第一章。
\providecommand{\bistuformatnote}[3]{}

% 【格式备注｜Word模板】A4；上下边距2.54 cm，左3 cm、右2.5 cm，装订线0。
% 【学校要求】每页固定左3 cm、右2.5 cm；双面页眉和各章右开独立保留。
% Body box: 15.5 cm wide. Footer bottom: 2.0 cm from the paper edge.
% Reserve 18 bp for the 1.5-spaced header; retain the head rule and body positions.
% asymmetric保留twoside，但使偶数页与奇数页的正文位置一致。
\geometry{a4paper,asymmetric,left=3cm,right=2.5cm,top=2.54cm,bottom=2.54cm,
  bindingoffset=0cm,headheight=18bp,
  headsep=\dimexpr0.54cm-13bp\relax,
  footskip=0.54cm}

% Load the same original Word fonts on Windows and Overleaf by file path.
% Missing files must cause a compilation error; never substitute other fonts.
\setmainfont[Path=fonts/,
  BoldFont=timesbd.ttf,ItalicFont=timesi.ttf,BoldItalicFont=timesbi.ttf]{times.ttf}
% Original Times New Roman: Latin/Greek variables, digits, functions and units.
% Extensible delimiters, large operators and calligraphic alphabets retain
% their dedicated TeX math glyphs; they are not advertised as Times New Roman.
\setmathsfont(Digits,Latin,Greek)[Path=fonts/,
  BoldFont=timesbd.ttf,ItalicFont=timesi.ttf,BoldItalicFont=timesbi.ttf,
  Uppercase=Italic,Lowercase=Italic]{times.ttf}
\setmathrm[Path=fonts/,
  BoldFont=timesbd.ttf,ItalicFont=timesi.ttf,BoldItalicFont=timesbi.ttf]{times.ttf}
% Freeze mathspec's family aliases before later fontspec declarations change
% the scratch family used for Greek glyph bearings and text-math spacing.
\edef\eu@Digitsmathsfont{\eu@Digitsmathsfont}
\edef\eu@Latinmathsfont{\eu@Latinmathsfont}
\edef\eu@Greekmathsfont{\eu@Greekmathsfont}
\edef\eu@mathrm{\eu@mathrm}
\SetSymbolFont{Latin:m:n}{bold}{TU}{\eu@Latinmathsfont}{b}{n}
\SetSymbolFont{Latin:m:it}{bold}{TU}{\eu@Latinmathsfont}{b}{it}
\SetSymbolFont{Greek:m:n}{bold}{TU}{\eu@Greekmathsfont}{b}{n}
\SetSymbolFont{Greek:m:it}{bold}{TU}{\eu@Greekmathsfont}{b}{it}
\SetSymbolFont{Digits:m:n}{bold}{TU}{\eu@Digitsmathsfont}{b}{n}
\newcommand{\bistuvec}[1]{\boldsymbol{#1}}
\newcommand{\bistumat}[1]{\boldsymbol{#1}}
\setsansfont[Path=fonts/,
  BoldFont=arialbd.ttf,ItalicFont=ariali.ttf,BoldItalicFont=arialbi.ttf]{arial.ttf}
% simsun.ttc index 0 is SimSun; index 1 is NSimSun.
\setCJKmainfont[Path=fonts/,FontIndex=0,AutoFakeBold=2]{simsun.ttc}
\setCJKsansfont[Path=fonts/,AutoFakeBold=2]{simhei.ttf}
% 命令示例中的中文仍用宋体，避免未定义中文等宽字族的警告。
\setCJKmonofont[Path=fonts/,FontIndex=0]{simsun.ttc}
\newCJKfontfamily\fsong[Path=fonts/]{simfang.ttf}
% 【格式备注｜Word模板及用户确认】封面单位代码与五行培养信息用仿宋_GB2312，
% 与普通仿宋FangSong区分；本地和Overleaf加载同一原字体文件，不使用替代字体。
\newCJKfontfamily\fsonggb[Path=fonts/]{fangsong-gb2312.ttf}
\newcommand{\songti}{\CJKfamily{\CJKrmdefault}}
\newcommand{\heiti}{\CJKfamily{\CJKsfdefault}}
\newcommand{\arial}{\sffamily}
\newcommand{\tnr}{\rmfamily}
% 【格式备注｜Word模板】正文宋体小四（12磅），英文Times New Roman；
% 两端对齐、首行缩进两汉字，固定20磅行距，段前后0磅。
\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=10bp plus 2bp minus 2bp
  \belowdisplayskip=10bp plus 2bp minus 2bp
  \abovedisplayshortskip=0bp plus 2bp
  \belowdisplayshortskip=6bp plus 2bp minus 2bp}
\renewcommand\small{\@setfontsize\small{10.5bp}{14bp}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{9bp}{12bp}}
\newcommand{\bistubodyformat}{\normalfont\songti\normalsize\justifying
  \setlength{\parindent}{24bp}\setlength{\parskip}{0bp}}
% 表中允许含数学表达式的段落局部调整行距，环境结束后自动恢复。
% 示例：\begin{bistumathparagraph}[24bp] ... \end{bistumathparagraph}
\newenvironment{bistumathparagraph}[1][24bp]{%
  \par\begingroup\bistubodyformat\fontsize{12bp}{#1}\selectfont
}{\par\endgroup}
\AtBeginDocument{\bistubodyformat}
\raggedbottom
% 避免普通段落的首行或末行单独出现在相邻页；保持既定行距和页边距。
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000
% 【格式备注｜用户要求】各章首页右开；补白左页保留当前部分的页眉、横线与
% 居中页码，参与连续计数。摘要、目录和清单仍连续排页，不逐项补白。
\renewcommand{\cleardoublepage}{\clearpage
  \if@twoside\ifodd\c@page\else
    \hbox{}\thispagestyle{bistublank}\newpage
    \if@twocolumn\hbox{}\thispagestyle{bistublank}\newpage\fi
  \fi\fi}
% Front matter runs continuously after the cover/declaration pages. Keep the
% internal counter aligned with physical sheets for right-opening chapters, while
% displaying Roman numbers starting at I on the first abstract page.
\newcount\bistu@frontoffset
\renewcommand{\frontmatter}{%
  \clearpage\@mainmatterfalse\@openrightfalse
  \global\bistu@frontoffset=\ReadonlyShipoutCounter\relax
  \global\c@page=\numexpr\bistu@frontoffset+1\relax
  \gdef\thepage{\@Roman{\numexpr\c@page-\bistu@frontoffset\relax}}}
% Reset Arabic numbering only after the next physical page is a right page.
\renewcommand{\mainmatter}{%
  \clearpage
  \ifodd\ReadonlyShipoutCounter
    \hbox{}\thispagestyle{bistublank}\newpage
  \fi
  \@openrighttrue\@mainmattertrue\pagenumbering{arabic}}

% Metadata defaults. Edit thesis-info.tex, not this class.
\newcommand{\thesistitlezh}{博士学位论文中文题目}
\newcommand{\thesistitleen}{Title of the Doctoral Dissertation}
\newcommand{\thesisauthorzh}{张三}
\newcommand{\thesisauthoren}{Zhang San}
\newcommand{\thesisstudentid}{0000000000}
\newcommand{\thesissupervisorzh}{李四 教授}
\newcommand{\thesissupervisoren}{Prof. Li Si}
\newcommand{\thesismajorzh}{学科专业名称}
\newcommand{\thesismajoren}{Name of the Discipline}
\newcommand{\thesisdirection}{研究方向名称}
\newcommand{\thesisschool}{学院名称}
\newcommand{\thesistype}{学术型/专业型}
\newcommand{\thesischair}{王五 教授}
\newcommand{\thesiscommittee}{王五 教授\\王五 教授\\王五 教授\\王五 教授}
\newcommand{\defensedate}{20XX 年 X 月 X 日}
\newcommand{\submitdate}{20XX 年 X 月 X 日}
\newcommand{\completiondate}{20XX 年 X 月 X 日}
\newif\ifconfidential
\confidentialfalse
% Compatibility with the old nine-argument metadata interface.
\newcommand{\setthesisinfo}[9]{\renewcommand{\thesistitlezh}{#1}%
  \renewcommand{\thesistitleen}{#2}\renewcommand{\thesisauthorzh}{#3}%
  \renewcommand{\thesisauthoren}{#4}\renewcommand{\thesisstudentid}{#5}%
  \renewcommand{\thesissupervisorzh}{#6}\renewcommand{\thesissupervisoren}{#7}%
  \renewcommand{\thesismajorzh}{#8}\renewcommand{\thesismajoren}{#9}}

% One shared page style, including chapter opening pages (plain).
\newif\ifbistumainheaders
\bistumainheadersfalse
\newcommand{\bistuheadtext}{\thesistitlezh}
\newcommand{\bistuinstitutionheader}{北京信息科技大学博士学位论文}
% Size 5 (10.5 bp): Chinese in SimSun; Latin (including Abstract) in Times New Roman.
% Apply the 1.5 multiplier inside the header, after fancyhdr resets line spacing.
\newcommand{\bistuheaderfont}{\normalfont\tnr\songti
  \fontsize{10.5bp}{12bp}\linespread{1.5}\selectfont}
% 【格式备注｜学校要求】页码宋体五号居中；仅英文摘要用Times New Roman。
% 数字/罗马数字属于西文字形，须显式选SimSun，不能仅用CJK的songti切换。
\newfontfamily\bistupagenumbersong[Path=fonts/,FontIndex=0]{simsun.ttc}
\newif\ifbistuenglishpagenumber
% 正常页与为右开补出的空白页共用同一页码字形和位置。
\newcommand{\bistupagenumber}{\normalfont\songti
  \ifbistuenglishpagenumber\tnr\else\bistupagenumbersong\fi
  \fontsize{10.5bp}{12bp}\linespread{1}\selectfont\thepage}
\newcommand{\bistupagestyle}{%
  \fancyhf{}\fancyhfoffset{0pt}\setlength{\headwidth}{\textwidth}%
  \ifbistumainheaders
    \fancyhead[CO]{\bistuheaderfont\centering\bistuinstitutionheader}%
    \fancyhead[CE]{\bistuheaderfont\centering\nouppercase{\leftmark}}%
  \else
    \fancyhead[C]{\bistuheaderfont\centering\bistuheadtext}%
  \fi
  \fancyfoot[C]{\bistupagenumber}%
  \renewcommand{\headrulewidth}{0.4bp}\renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{bistu}{\bistupagestyle}
\fancypagestyle{plain}{\bistupagestyle}
% 补白页与普通页共用页眉页脚；空白左页承接上一章/当前前置部分的页眉。
\fancypagestyle{bistublank}{\bistupagestyle}
\pagestyle{bistu}
\renewcommand{\chaptermark}[1]{\markboth{%
  \if@mainmatter 第\thechapter 章\quad\fi #1}{}}
\newcommand{\bistufrontheader}[1]{\bistumainheadersfalse
  \ifstrequal{#1}{Abstract}{\bistuenglishpagenumbertrue}{\bistuenglishpagenumberfalse}%
  \renewcommand{\bistuheadtext}{#1}\pagestyle{bistu}}
\newcommand{\bistubackheader}[1]{\bistumainheaderstrue\bistuenglishpagenumberfalse
  \markboth{#1}{#1}\pagestyle{bistu}}
\newcommand{\bistumainheader}{\bistumainheaderstrue\bistuenglishpagenumberfalse\markboth{}{}\pagestyle{bistu}}
% 【格式备注｜Word模板】章标题：黑体二号22磅，加粗居中，单倍行距，
% 段前24磅、段后18磅；章序号与章名空一个汉字符（22磅）。
% Chapter headings: use SimHei for both Chinese text and chapter digits.
\newfontfamily\bistuchapterlatin[Path=fonts/,AutoFakeBold=2]{simhei.ttf}
\newcommand{\bistuchapterfont}{\normalfont\centering\bistuchapterlatin\heiti\bfseries
  \fontsize{22bp}{22bp}\linespread{1}\selectfont}
% 序号和题名间距固定为该级标题的一汉字宽度，不依赖西文字体的 em。
\titleformat{\chapter}[block]{\bistuchapterfont}{第\thechapter 章}{22bp}{}
\titlespacing{\chapter}{0pt}{24bp}{18bp}
% 【格式备注｜Word模板】一级节标题黑体三号16磅；二级节标题黑体四号14磅；
% 三级节标题黑体小四12磅。均加粗左对齐、单倍行距，段前24磅、段后6磅，
% 序号与题名间空该字号的一个汉字符。
\titleformat{\section}{\normalfont\heiti\bfseries\fontsize{16bp}{16bp}\linespread{1}\selectfont}{\thesection}{16bp}{}
\titleformat{\subsection}{\normalfont\heiti\bfseries\fontsize{14bp}{14bp}\linespread{1}\selectfont}{\thesubsection}{14bp}{}
\titleformat{\subsubsection}{\normalfont\heiti\bfseries\fontsize{12bp}{12bp}\linespread{1}\selectfont}{\thesubsubsection}{12bp}{}
% Unstarred spacing retains first-line indentation after section headings.
\titlespacing{\section}{0pt}{24bp}{6bp}
\titlespacing{\subsection}{0pt}{24bp}{6bp}
\titlespacing{\subsubsection}{0pt}{24bp}{6bp}
% 自然分页时，titlesec 默认丢弃节标题前的竖直胶，导致页首标题贴近页眉。
% 仅修正非连续标题分支，保留其段前间距；连续标题仍由 largestsep 取较大值。
% 先抵消已有的末尾胶，再加入不可在页首丢弃的间距，避免重复累加。
\newcommand{\bistukeepheadingspace}[1]{%
  \begingroup
    \skip@=#1\relax
    \@tempskipb=\lastskip
    \ifdim\@tempskipb>\skip@ \skip@=\@tempskipb\fi
    \vskip-\@tempskipb
    \vspace*{\skip@}%
  \endgroup}
\patchcmd{\ttl@straight@ii}
  {\addvspace{\@tempskipa}}
  {\bistukeepheadingspace{\@tempskipa}}
  {}{\ClassError{bistu-doctoral}{Heading spacing patch failed}%
    {The titlesec implementation has changed. Check heading spacing before use.}}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\newcommand{\bistuunnumbered}[2]{\chapter*{#1}\markboth{#2}{#2}%
  \addcontentsline{toc}{chapter}{#2}}
\newcommand{\bistuchineseabstract}{\bistuunnumbered{摘\quad 要}{摘 要}}
\newcommand{\bistuenglishabstract}{%
  \begingroup
  \titleformat{\chapter}[block]{\centering\arial\bfseries\fontsize{16bp}{16bp}\selectfont}{}{0pt}{}
  \bistuunnumbered{Abstract}{Abstract}\endgroup}
\newcommand{\cnkeywords}[1]{\par\vspace{20bp}\noindent\textbf{关键词：}#1\par}
\newcommand{\enkeywords}[1]{\par\vspace{40bp}\noindent\textbf{KEY WORDS: }#1\par}

% 【格式备注｜Word模板】图题在下、表题在上；宋体五号10.5磅，居中、单倍行距；
% 图题段前6磅、段后12磅；表题段前后均6磅；编号与名称空一个汉字符。
% Captions and automatic chapter-based numbering.
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\DeclareCaptionFont{bistu}{\normalfont\songti\fontsize{10.5bp}{12bp}\selectfont}
\DeclareCaptionLabelFormat{bistu}{#1\,#2}
\DeclareCaptionLabelSeparator{bistuchar}{\hspace{10.5bp}}
\captionsetup{font=bistu,labelformat=bistu,labelsep=bistuchar,
  justification=centering,singlelinecheck=true}
\captionsetup[figure]{position=bottom,aboveskip=6bp,belowskip=12bp}
\captionsetup[table]{position=top,aboveskip=6bp,belowskip=6bp}
% longtable题注的顶端补偿必须与表行支架一致，而非正文20磅行距的支架。
% 否则五号表格的题注段前6磅会被正文与表格支架的高度差抵消一部分。
\AtBeginDocument{%
  \patchcmd{\LT@makecaption}
    {\vskip-\ht\strutbox}
    {\vskip-\ht\@arstrutbox}
    {}{\ClassError{bistu-doctoral}{Longtable caption spacing patch failed}%
      {Check the caption and longtable versions before use.}}}
% 图、表、公式各自独立计数，每进入新章归零；编号格式为“章.序号”。
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\numberwithin{equation}{chapter}

% 【格式备注｜老师意见】三线表，表内水平与垂直居中、无竖线。
% 【本稿实现】表内宋体/Times New Roman五号；顶底线1.5磅，中线0.75磅。
% 线宽是本稿统一值，不视为原Word明定值。
% Reusable three-line table style; C columns center content in both directions.
\newcommand{\bistutablefont}{\normalfont\songti
  \fontsize{10.5bp}{12bp}\linespread{1}\selectfont}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newenvironment{bistuthreelinetabular}[1]{%
  \begingroup\bistutablefont\renewcommand{\arraystretch}{1.4}%
  \setlength{\heavyrulewidth}{1.5bp}\setlength{\lightrulewidth}{0.75bp}%
  \begin{tabular}{#1}%
}{\end{tabular}\endgroup}

% 【格式备注｜Word模板】脚注宋体小五9磅、带圈数字；全文连续编号。
% Continuous circled footnotes, including across chapters.
\counterwithout{footnote}{chapter}
\DeclareRobustCommand{\circlednum}[1]{\tikz[baseline=(n.base)]{%
  \node[draw,circle,line width=.3pt,inner sep=.5pt,minimum size=1.2em,
    font=\fontsize{7bp}{7bp}\selectfont] (n) {#1};}}
\renewcommand{\thefootnote}{\protect\circlednum{\arabic{footnote}}}

% 【格式备注｜Word模板】目录条目宋体小四12磅，单倍行距，段前6磅、段后0磅；
% 两端对齐、页码右对齐；章无缩进，一级节缩进一汉字，二级节再加一汉字。
% TOC: 12 bp, single spacing, 6 bp before entries, one/two-character level indents.
\renewcommand{\contentsname}{目\quad 录}
\renewcommand{\listfigurename}{插图清单}
\renewcommand{\listtablename}{表格清单}
\newcommand{\bistutocfont}{\normalfont\songti\fontsize{12bp}{12bp}\selectfont}
\renewcommand{\cfttoctitlefont}{\hfill\heiti\bfseries\fontsize{16bp}{16bp}\selectfont}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill\bistuchapterfont}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\bistuchapterfont}
\renewcommand{\cftafterlottitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{24bp}
\setlength{\cftaftertoctitleskip}{18bp}
\setlength{\cftbeforeloftitleskip}{24bp}
\setlength{\cftafterloftitleskip}{18bp}
\setlength{\cftbeforelottitleskip}{24bp}
\setlength{\cftafterlottitleskip}{18bp}
\renewcommand{\cftdotsep}{1.5}
\newcommand{\bistusetlist}[1]{%
  \expandafter\renewcommand\csname cft#1font\endcsname{\bistutocfont}%
  \expandafter\renewcommand\csname cft#1pagefont\endcsname{\bistutocfont}%
  \expandafter\renewcommand\csname cft#1leader\endcsname{\cftdotfill{\cftdotsep}}%
  \expandafter\setlength\csname cftbefore#1skip\endcsname{6bp}}
\bistusetlist{chap}\bistusetlist{sec}\bistusetlist{subsec}
\bistusetlist{fig}\bistusetlist{tab}
\renewcommand{\cftchappresnum}{第}
\renewcommand{\cftchapaftersnum}{章\quad}
\cftsetindents{chapter}{0bp}{48bp}
\cftsetindents{section}{12bp}{30bp}
\cftsetindents{subsection}{24bp}{42bp}
\cftsetindents{figure}{0bp}{48bp}
\cftsetindents{table}{0bp}{48bp}
\renewcommand{\cftfigpresnum}{图\,}
\renewcommand{\cfttabpresnum}{表\,}
\newcommand{\bistutableofcontents}{\clearpage\bistufrontheader{目\quad 录}%
  \begingroup\bistutocfont\tableofcontents\endgroup
\clearpage}
\newcommand{\bistulistoffigures}{\clearpage\bistufrontheader{插图清单}%
  \phantomsection\addcontentsline{toc}{chapter}{插图清单}%
  \begingroup\bistutocfont\listoffigures\endgroup
\clearpage}
\newcommand{\bistulistoftables}{\clearpage\bistufrontheader{表格清单}%
  \phantomsection\addcontentsline{toc}{chapter}{表格清单}%
  \begingroup\bistutocfont\listoftables\endgroup
\clearpage}

% 【格式备注｜Word模板】参考文献正文宋体小四12磅，英文Times New Roman，
% 行距20磅；顺序编码制。通过BibTeX自动生成编号，不手工写编号。
% References are generated exclusively from .bib with BibTeX.
% 自定义 BST 使用数字制 bibitem；正文维持上标方括号。
\setcitestyle{super,square,comma}
\urlstyle{same}
\renewcommand{\bibname}{参考文献}
\renewcommand{\bibsection}{\bistuunnumbered{参考文献}{参考文献}%
%
  }
\renewcommand{\bibfont}{\bistubodyformat}
\setlength{\bibsep}{0bp}
\setlength{\bibhang}{24bp}
\providecommand{\inlinecite}[1]{\begingroup\setcitestyle{numbers}\citep{#1}\endgroup}
\endinput
