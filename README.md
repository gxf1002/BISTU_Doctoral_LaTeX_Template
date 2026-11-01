# 北京信息科技大学博士学位论文通用模板

贡献者：
BISTU-Doctoral-General-Template开发过程中，主要的维护者：
高雪峰(gxf951002@163.com):最早的开发者，2026年10月创建BISTU-Doctoral-General-Template。
同时，也要感谢北京信息科技大学光电学院李伟仙院长与孙继超老师的大力支持！


本工程是社区维护的独立通用模板，依据学校 Word 模板及已确认的排版要求整理，目前未提供学校将本工程认定为官方 LaTeX 模板的证明。维护者署名与致谢保留真实信息；论文示例中的作者、导师、委员会成员、学号、日期、简历及成果均为占位内容。学校名称、单位代码、校徽和学校声明保留，相关权利说明见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

本项目的自有源码采用 [Apache License 2.0](LICENSE)。该许可不为字体、学校标识及学校声明等第三方内容额外授予权利，详见 [第三方说明](THIRD_PARTY_NOTICES.md)。本公开源码包不附带字体文件。模板仍要求与学校格式一致的准确字体，须按 [字体配置说明](fonts/README.md) 配齐具有相应使用授权的字体后才能编译。GitHub 发布与 Overleaf 模板库提交说明见 [PUBLISHING.md](PUBLISHING.md)。


公开仓库：[gxf1002/BISTU_Doctoral_LaTeX_Template](https://github.com/gxf1002/BISTU_Doctoral_LaTeX_Template)。根目录中的 `main.tex` 为编译入口，可通过 **Code → Download ZIP** 获取完整源码，或克隆本仓库。仓库保留的 `BISTU-Doctoral-LaTeX-Template.zip` 为首次上传的历史打包版本；最新说明和许可证以根目录文件为准。

[在 Overleaf 中导入源码](https://www.overleaf.com/docs?snip_uri=https%3A%2F%2Fgithub.com%2Fgxf1002%2FBISTU_Doctoral_LaTeX_Template%2Farchive%2Frefs%2Fheads%2Fmain.zip)（导入后仍需按下文配置获准使用的准确字体）。

## 快速开始

1. 在 Overleaf 选择“新建项目 → 上传项目”，上传本模板 ZIP；也可在本地解压使用。
2. 先按 [fonts/README.md](fonts/README.md) 配置全部 12 个准确字体文件，再将主文档设为 `main.tex`，编译器设为 **XeLaTeX**。保留 `.cls`、`.bst` 和所有源文件。仅上传此公开 ZIP、未配置字体时会因缺少字体而停止编译。
3. 编辑 `thesis-info.tex`，填写中英文题目、姓名、学号、导师、学院、专业、方向、日期和答辩委员会；学位类型请从“学术型/专业型”中选定一种。
4. 第一章“绪论”集中给出全部格式说明、学校写作规范表以及图、表、公式、参考文献示例。先阅读这一章，再将其替换为自己的绪论正文。
5. 替换其余章节的占位正文及中英文摘要，核实每一条引用与学术成果。模板的演示书目和成果均为虚构占位，不可作为真实研究证据。
6. 重新编译，确认目录、图表清单和交叉引用更新。

## 文件结构

| 文件 | 用途 |
| --- | --- |
| `main.tex` | 文档入口、章节顺序、页眉与页码切换 |
| `thesis-info.tex` | 全部个人及论文基本信息、封面标记开关 |
| `bistu-doctoral.cls` | 字体、页面、标题、页眉页脚、图表和数学样式 |
| `chapters/ch01.tex` | 集中的格式指南，正文及排版示例 |
| `chapters/format-requirements.tex` | 第一章中的学校写作规范汇总表 |
| `chapters/reference-format-notes.tex` | 第一章中的文献类型及著录格式示例 |
| `chapters/ch02.tex` 至 `chapters/ch06.tex` | 通用章节占位结构 |
| `chapters/conclusion.tex` | 无“第7章”字样的结论 |
| `chapters/notation.tex` | 左侧符号、右侧说明，无横线的符号清单 |
| `bib/references.bib` | 明确标识的虚构书目演示条目，正式写作时替换 |
| `bistu-thesis.bst` | 配套 BibTeX 样式 |
| `fonts/` | 准确字体文件清单与配置说明；公开源码包不附带字体二进制 |
| `figures/` | 学校标识；自己的图片也放在这里 |

## 编译

完成准确字体配置并确认所需上传权限后，在 Overleaf 选择 XeLaTeX 并点击重新编译。必要时使用“从头重新编译”清除旧缓存。当前公开包不含字体，不能单独作为开箱即用的 Overleaf 模板库提交包。

本地安装完整 TeX Live 后，在工程目录依次执行：

```text
xelatex -interaction=nonstopmode -halt-on-error main.tex
bibtex main
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

也可执行 `latexmk -xelatex main.tex`，或在 PowerShell 中执行 `./build.ps1`。结果为 `main.pdf`。本模板使用 BibTeX，不使用 Biber；不要另外加载 `biblatex`、`natbib` 或 `cite` 宏包。

## 格式说明的集中模式

封面、摘要、目录、符号清单、参考文献和其它章节不再插入分散的“格式备注”。所有说明均为第一章普通正文，规范表和示例也位于第一章。

`thesis-info.tex` 中保留的 `\bistuformatnotesfalse` 仅用于兼容旧工程；它不控制第一章指南。`format-notes.tex` 是空兼容入口，主文件不再载入它。

正式写作时，用自己的绪论替换 `chapters/ch01.tex`，并移除其中对两个说明文件的 `\input`；无需逐页删除备注。保留本模板的独立备份，便于查阅格式。

## 内部资料标记

模板默认不显示。需要显示封面“内部资料，注意保存”时，在 `thesis-info.tex` 将 `\confidentialfalse` 改为 `\confidentialtrue`。该开关只控制封面文字，不会自动勾选或改变授权书的公开、保密选项。

## 排页说明

前五页封面及声明不显示页眉页码。摘要、目录和各清单连续排页；正文各章与后置部分从右页开始。为右开补出的空白左页仍有页眉、横线和页码，属于双面印刷排版，应保留。所有页面固定左边距 3 cm、右边距 2.5 cm，不采用镜像边距。

模板按学校 Word 模板及已确认的排版要求整理；第一章将学校明定参数与模板统一实现区分说明。提交前请再依据本人适用的学院要求核对。
