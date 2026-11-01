# 北京信息科技大学博士学位论文通用模板

贡献者：
BISTU-Doctoral-General-Template开发过程中，主要的维护者：
高雪峰(gxf951002@163.com):最早的开发者，2026年10月创建BISTU-Doctoral-General-Template。
同时，也要感谢北京信息科技大学光电学院李伟仙院长与孙继超老师的大力支持！


本工程是社区维护的独立通用模板，依据学校 Word 模板及已确认的排版要求整理，目前未提供学校将本工程认定为官方 LaTeX 模板的证明。维护者署名与致谢保留真实信息；论文示例中的作者、导师、委员会成员、学号、日期、简历及成果均为占位内容。学校名称、单位代码、校徽和学校声明保留，相关权利说明见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

本项目的自有源码采用 [Apache License 2.0](LICENSE)。该许可不为字体、学校标识及学校声明等第三方内容额外授予权利，详见 [第三方说明](THIRD_PARTY_NOTICES.md)。当前版本已同步原工程使用的全部 12 个字体文件，可按模板原有字体设置编译，无需另行补齐字体。字体清单与权利说明见 [fonts/README.md](fonts/README.md)。GitHub 发布与 Overleaf 模板库提交说明见 [PUBLISHING.md](PUBLISHING.md)。


公开仓库：[gxf1002/BISTU_Doctoral_LaTeX_Template](https://github.com/gxf1002/BISTU_Doctoral_LaTeX_Template)。根目录中的 `main.tex` 为编译入口。通过 [下载完整模板 ZIP](https://github.com/gxf1002/BISTU_Doctoral_LaTeX_Template/archive/refs/heads/main.zip) 或 **Code → Download ZIP** 获取源码、12 个字体文件及许可证，也可克隆本仓库。下载包由 GitHub 根据当前 `main` 分支自动生成，与仓库内容一致；旧的缺字体 ZIP 已从仓库根目录移除。

[在 Overleaf 中打开完整模板](https://www.overleaf.com/docs?snip_uri=https%3A%2F%2Fgithub.com%2Fgxf1002%2FBISTU_Doctoral_LaTeX_Template%2Farchive%2Frefs%2Fheads%2Fmain.zip%3Fv%3Doverleaf-81962d9&engine=xelatex&main_document=main.tex)（已包含字体，并指定 XeLaTeX 与 main.tex）。

## 快速开始

1. 点击上方“在 Overleaf 中打开完整模板”，或下载完整导入包，在 Overleaf 选择“新建项目 → 上传项目”。也可在本地解压使用。
2. 主文档使用 `main.tex`，编译器使用 **XeLaTeX**；一键导入链接已指定这两个参数。保留完整的 `fonts/`、`.cls`、`.bst` 和源文件，点击重新编译。
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
| `fonts/` | 模板使用的 12 个原字体文件及说明 |
| `figures/` | 学校标识；自己的图片也放在这里 |

## 编译

在 Overleaf 使用 XeLaTeX 编译 `main.tex`。完整导入包已经包含所需字体；必要时使用“从头重新编译”清除旧缓存。此前已经导入的旧项目不会随 GitHub 更新而自动同步，请从上方入口重新导入，或为旧项目同步 `fonts/` 中的 12 个文件。

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

当前版本与最新 Overleaf 工程一致，默认显示封面“内部资料，注意保存”。需要关闭时，在 `thesis-info.tex` 将 `\confidentialtrue` 改为 `\confidentialfalse`；需要恢复显示时改回 `\confidentialtrue`。该开关只控制封面文字，不会自动勾选或改变授权书的公开、保密选项。

## 排页说明

前五页封面及声明不显示页眉页码。摘要、目录和各清单连续排页；正文各章与后置部分从右页开始。为右开补出的空白左页仍有页眉、横线和页码，属于双面印刷排版，应保留。所有页面固定左边距 3 cm、右边距 2.5 cm，不采用镜像边距。

模板按学校 Word 模板及已确认的排版要求整理；第一章将学校明定参数与模板统一实现区分说明。提交前请再依据本人适用的学院要求核对。
