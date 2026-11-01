# BIB 著录格式与字段填写

所有条目保存在 `bib/references.bib`。BibTeX 根据随工程提供的 `bistu-thesis.bst` 自动生成 `main.bbl` 和 PDF 中的参考文献；不要编辑生成的 `.bbl`，也不要手工填写 `[1]` 等序号。

该样式按本次提供的学校模板示例定制。保留顺序编码制，按首次引用顺序排列，并针对学校模板示例调整论文集标记位置、译者括号、出版年后的页码以及网上文章的日期位置。它不再直接使用通用 `gbt7714-numerical.bst`。

| 类型 | BIB 类型 | 输出结构 |
| --- | --- | --- |
| 期刊文章 | `@article` | 作者. 文章名[J]. 刊名, 年, 卷(期): 起～止页码. |
| 专著、译著 | `@book` | 作者. 书名[M]. (译者, 译). 出版地: 出版者, 出版年. 起～止页码. |
| 会议论文 | `@inproceedings` | 作者. 题名. 论文集名[C]. 出版地: 出版者, 出版年. 起～止页码. |
| 整本论文集 | `@proceedings` | 作者或编者. 论文集名[C]. 出版地: 出版者, 出版年. 起～止页码. |
| 学位论文 | `@phdthesis` / `@mastersthesis` | 姓名. 论文题目[D]. 授予地: 授予单位, 授予年. |
| 报告 | `@techreport` | 作者或机构. 报告题名[R]. 出版地: 发布机构, 年. |
| 标准 | `@standard` | 发布单位. 标准编号. 标准名称[S]. 出版地: 出版者, 年. |
| 专利 | `@patent` | 申请者. 专利名: 国名, 专利号[P]. 出版日期. |
| 网上文章 | `@online` | 作者, 文章名[EB/OL]. 网址或文章出处, 发表或更新日期. |
| 报纸文章 | `@newspaper` | 作者. 文章名[N]. 报纸名, 出版日期(版次). |
| 论文集析出文献 | `@incollection` | 作者. 析出题名[A]. 论文集名[C]. 出版地: 出版者, 年. 起～止页码. |

学校模板示例明确给出了期刊、专译著、论文集、学位论文、专利、网上文章的字段顺序；报告、报纸和析出文献按学校模板示例的类型标记补全相应结构。标准的编号顺序依据原 Word 模板中的说明。

## 字段填写

- 中文作者：`author = {{张三} and {李四}}`；英文作者：`author = {Zhang, San and Li, Si}`。多个作者必须用 `and` 分隔。
- 中文条目填写 `language = {chinese}`，英文条目填写 `language = {english}`。超过三位作者时保留前三位，追加“等”或“et al.”；也可用 `and others` 标记省略作者。
- 专著的译者填 `translator`；没有译者时不显示译者括号。版次可在 `edition` 中写完整文字，例如 `{第2版}` 或 `{2nd ed.}`。
- 出版地或授予地填 `address`；出版社填 `publisher`；授予学校填 `school`；报告发布机构填 `institution`。
- 论文集名称填 `booktitle`；整本论文集使用 `@proceedings` 时书名填 `title`，编者可填 `editor`。
- 专利国名填 `address`，专利号填 `number`，出版日期填 `date`。
- 网上文章网址填 `url`；没有网址时可用 `howpublished` 填出处。发表或更新日期填 `date`，输出位于网址或出处之后。
- 报纸名填 `journal`，日期填 `date`，版次填 `number`。
- 页码填 `pages = {10--18}`，输出为 `10～18`；期刊使用冒号引出页码，专著和论文集按学校模板示例在出版年后用句点引出页码。
- 类型标记自动生成，无需把 `[J]`、`[M]` 等写进标题。通常不需要 `mark` 字段；确需覆盖类型时可显式填写。

学校模板示例未列出的 DOI、访问日期不自动追加到文献尾部，且普通期刊/专著不会因填了 URL 就自动变成 `[J/OL]`、`[M/OL]`。如需明确使用混合类型，可填写 `mark = {J/OL}`。纯网上文章请使用 `@online`。

## 已提供的演示条目

`demoJournal`、`demoTranslation`、`demoConference`、`demoThesis`、`demoReport`、`demoStandard`、`demoPatent`、`demoOnline`、`demoNews`、`demoContribution` 覆盖学校模板示例中的十种类型标记。

这十条是明确标识的虚构格式示例，不能作为真实研究依据。第一章集中说明引用与著录规则，参考文献页以 nocite 命令展示这十条演示条目；正式写作时替换演示条目并移除展示命令。模板未保留原研究文献；实际参考文献应按原始出版物核实。

正文使用 `\cite{文献键}` 生成上标引用，`\inlinecite{文献键}` 生成行内引用。编译顺序为 XeLaTeX → BibTeX → XeLaTeX → XeLaTeX，或直接运行 `build.ps1` / `latexmk -xelatex main.tex`。
