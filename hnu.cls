\LoadClass[UTF8, openright, a4paper, twoside, zihao=-4]{ctexbook}

% 目录章节格式（阿拉伯数字）
\ctexset{
    chapter={
        name={,},
        number={\arabic{chapter}}
    }}

\RequirePackage{amsmath}
\numberwithin{equation}{chapter}

% 上边距：30mm；下边距：25mm；左边距：30mm；右边距：20mm
\RequirePackage{geometry}
\RequirePackage{emptypage} % 新增：确保由于右页起产生的空白背页完全空白（无页眉页码）
\geometry{
    top=30mm,
    bottom=25mm,
    inner=30mm, % 建议：双面打印时，原先的left(30)应当作为装订边(inner)
    outer=20mm, % 原先的right(20)应当作为外侧边(outer)
}

% 行间距为1.5倍行距(1.5 * 1.2(latex默认) ÷ 1.3(word默认))
\linespread{1.625}

% 默认中文字体：宋体, 英文字体：Times New Roman
% 为英文完整映射：常规、加粗、斜体、加粗斜体
\setmainfont[
    Path=fonts/,
    BoldFont=mTimesNewRomanBold.ttf,
    ItalicFont=mTimesNewRomanItalic.ttf,
    BoldItalicFont=mTimesNewRomanBoldItalic.ttf
]{mTimesNewRoman.ttf}

% 为中文映射：常规、加粗（使用宋体加粗）
\setCJKmainfont[
    Path=fonts/,
    BoldFont=mSimsunBold.ttf
]{mSimsun.ttc}

% 页眉预定义格式
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand\headrule{
    \hrule height 1.2pt width\headwidth
    \vskip 0.6pt
    \hrule height 0.7pt width\headwidth
}
\fancyhead[C]{
    \sizeFivel \fontSimsun 湖南大学本科生毕业论文（设计）
}
\fancyhead[L]{}
\fancyhead[R]{}

% 页码：五号宋体
\fancyfoot[C]{
    \fontTimesNewRoman\fontSimsun\sizeFive \thepage
}

\renewcommand\frontmatter{
    \clearpage
    \@mainmatterfalse
    \@openrightfalse  % 取消章节奇数页起，消除多余空白页，页码连续
    \@twosidefalse    % 临时关闭边距交替，强制纯单面印刷排版（左30右20）
    \pagenumbering{Roman}
    \topmargin -11mm
    \headsep 12mm
    \footskip 6.5mm
}

% 新增正文区重定义
\renewcommand\mainmatter{
    \cleardoublepage  % 保证正文从奇数页（正面）开始
    \@mainmattertrue
    \@openrighttrue   % 恢复章节奇数页起
    \@twosidetrue     % 恢复双面印刷的边距交替（内装订30，外侧20）
    \pagenumbering{arabic}
}

% 中文摘要预定义格式
\newenvironment{abstractCN}{
    \clearpage
    \phantomsection\addcontentsline{toc}{chapter}{摘~~要}
    \begin{center}
        % 论文题目（小3号黑体，数字字母TNR）
        \fontTimesNewRoman\fontSimhei\sizeThreel{
            \thesisTitle
        }
        
        \vspace{\baselineskip} % 空一行

        % “摘要”字样（3号黑体）
        \fontSimhei\sizeThree{
            摘~~~~~~~~要
        }
    \end{center}

    \vspace{\baselineskip} % 摘要正文前空行
}{}

% 中文关键词预定义格式
\newcommand\keywordsCN{
    \vspace{\baselineskip} % 摘要正文后下空一行
    % “关键词”三字为4号黑体，后续关键词内容设为小4号宋体(含TNR数字字母)
    \raggedright\fontSimhei\sizeFour 关键词：\fontTimesNewRoman\fontSimsun\sizeFourl
}

% 英文摘要预定义格式
\newenvironment{abstractENG}{
    \clearpage % 英文摘要另起一页
    \phantomsection\addcontentsline{toc}{chapter}{A\hspace{0.1em}b\hspace{0.1em}s\hspace{0.1em}t\hspace{0.1em}r\hspace{0.1em}a\hspace{0.1em}c\hspace{0.1em}t}
    \begin{center}
        % The title（小3号 Times New Roman 加粗）
        \fontTimesNewRomanBold\sizeThreel{
            \thesisTitleENG
        }

        \vspace{\baselineskip} 

        % Abstract (3号 Times New Roman 加粗)
        \fontTimesNewRomanBold\sizeThree{
            Abstract
        }
    \end{center}

    \vspace{\baselineskip} % 然后隔行书写摘要的文字部分
}{}

% 英文关键词预定义格式
\newcommand\keywordsENG{
    \vspace{\baselineskip} % 摘要正文后下空一行
    % “Keywords:” 4号TNR加粗，后续关键词为 小4号TNR加粗
    \raggedright\fontTimesNewRomanBold\sizeFour Keywords: \fontTimesNewRomanBold\sizeFourl
}

% 章（如“1”）、节（如“1.1”）、条（如“1.1.1”）、款（如“1.”）、项（如“（1）”）
% “节”、“条”的段前、段后各设为0.5行
\RequirePackage{titlesec}
% Chapter格式
\titleformat{\chapter}{\fontTimesNewRomanBold\fontSimhei\sizeThree}{\thechapter}{1em}{}
\titlespacing{\chapter}{0pt}{0pt}{2pt}
% Section格式
\titleformat{\section}{\fontTimesNewRoman\fontSimhei\sizeFourl}{\thesection}{1em}{}
\titlespacing{\section}{0pt}{7.5pt}{7.5pt}
% Subsection格式
\titleformat{\subsection}{\fontTimesNewRoman\fontSimhei\sizeFourl}{\thesubsection}{1em}{}
\titlespacing{\subsection}{0pt}{7.5pt}{7.5pt}
% Subsubsection格式
\titleformat{\subsubsection}{\fontTimesNewRoman\fontSimhei\sizeFourl}{\thesubsubsection}{1em}{}
\titlespacing{\subsubsection}{0pt}{7.5pt}{7.5pt}

% 致谢预定义格式
\newenvironment{newThanks}{
    \cleardoublepage % 修改：强制致谢在奇数页起
    \phantomsection\addcontentsline{toc}{chapter}{致~谢}
    \begin{center}
        \fontSimhei\sizeThree 致~谢
    \end{center}


    }{}

% 插图&表格格式
\RequirePackage{caption}
\RequirePackage{subcaption} % 引入子图宏包，处理 (a)、(b) 分图

% 保证图表按章编号 (例如：表1.1, 图1.1)
\numberwithin{table}{chapter}
\numberwithin{figure}{chapter}

% 图名：5号宋体加粗 (数字字母自动TNR加粗)
\DeclareCaptionFont{figureFont}{\fontTimesNewRomanBold\fontSimsunBold\sizeFive}
% 表名：5号黑体加粗 (数字字母自动TNR加粗)
\DeclareCaptionFont{tableFont}{\fontTimesNewRomanBold\fontSimheiBold\sizeFive}

% 插图的全局设置
\captionsetup[figure]{
    font=figureFont,
    labelfont=figureFont,
    labelformat=default,
    labelsep=space, % 图号在图名之后空一格
    justification=centering, % 居中
    position=bottom, % 图题置于图下
    aboveskip=6pt,
}

% 分图的全局设置：用(a)、(b)等置于分图之下，5号宋体
\captionsetup[subfigure]{
    font=figureFont,
    labelformat=simple, % 仅显示(a), (b)
    labelsep=space,
    justification=centering,
}
\renewcommand{\thesubfigure}{(\alph{subfigure})}

% 表格的全局设置
\captionsetup[table]{
    font=tableFont,
    labelfont=tableFont,
    labelformat=default,
    labelsep=space, % 表序与表名之间空一格
    justification=centering, % 置于表上居中
    position=top,
    aboveskip=6pt,
    belowskip=6pt,
}

% 参考文献以上标形式置于所引用内容最末句的右上角
\renewcommand{\@cite}[1]{\textsuperscript{\,[#1]}}
% 与正文排齐的直接说明引用
\newcommand{\inlinecite}[1]{[\citenum{#1}]}

% 代码块预定义格式
\RequirePackage{listings}
\RequirePackage{xcolor}
\lstset{
    basicstyle=\footnotesize\fontJetBrainsMonoMedium,
    breaklines=true,
    frame=single,
    backgroundcolor=\color{gray!10},
    framexleftmargin=5pt,
    framexrightmargin=5pt,
    xleftmargin=10pt,
    xrightmargin=10pt,
    frameshape={RYR}{Y}{Y}{RYR}
}

% ==========================================
% 表格与图注专属设置
% ==========================================
% 表内文字说明：5号宋体。
% (注意：由于正文是小4号，每次写表格时，建议在 \begin{table} 后使用 \tableBodyFont 命令)
\newcommand{\tableBodyFont}{\fontTimesNewRoman\fontSimsun\sizeFive}

% 表注环境：小5号宋体，写在表的下方。
\newcommand{\tablenotes}[1]{
    \vspace{2pt} % 距离表格底部的细微间距
    \par\noindent % 换行顶格
    {\fontTimesNewRoman\fontSimsun\sizeFivel #1} % 小5号宋体
}

% 图注环境：小5号宋体，应置于图题之上。
% (在主文档中，写在 \includegraphics 和 \caption 之间即可)
\newcommand{\figurenotes}[1]{
    \vspace{4pt} % 与图之间的间距
    \par
    {\centering \fontTimesNewRoman\fontSimsun\sizeFivel #1 \par}
    \vspace{4pt} % 与下方图题的间距
}

%超链接
\usepackage{hyperref}
\hypersetup{
	colorlinks=false,    % 关闭彩色链接
	pdfborder={0 0 0}    % 去掉链接的方框
}

\usepackage{pkgs/cover}
\usepackage{pkgs/copyright}
\usepackage{pkgs/tocloflot}
\usepackage{pkgs/bibliography}
\usepackage{pkgs/appendix}

%参考文献格式
\usepackage{gbt7714}
\setlength{\bibsep}{0ex}