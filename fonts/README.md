# 准确字体配置

本目录已同步维护者原工程使用的 12 个字体文件。`bistu-doctoral.cls` 仍通过本目录的原文件加载字体，排版规则及字体选择未改变；不会自动使用替代字体。

## 所需文件

以下文件已经随完整模板提供。若手动迁移工程，请保持文件名和目录不变；字体名称和字形必须对应，不能通过重命名不同字体来满足文件名检查。

| 文件名 | 字体及字形 |
| --- | --- |
| `times.ttf` | Times New Roman，常规 |
| `timesbd.ttf` | Times New Roman，粗体 |
| `timesi.ttf` | Times New Roman，斜体 |
| `timesbi.ttf` | Times New Roman，粗斜体 |
| `arial.ttf` | Arial，常规 |
| `arialbd.ttf` | Arial，粗体 |
| `ariali.ttf` | Arial，斜体 |
| `arialbi.ttf` | Arial，粗斜体 |
| `simsun.ttc` | 宋体 SimSun；模板使用集合中索引 0 |
| `simhei.ttf` | 黑体 SimHei |
| `simfang.ttf` | 仿宋 FangSong |
| `fangsong-gb2312.ttf` | 仿宋_GB2312；与普通仿宋是不同字体 |

其中，普通仿宋与仿宋_GB2312分别用于不同位置，不能互换。正文西文与相关数学字母使用 Times New Roman，英文摘要的相应位置使用 Arial。可伸缩数学符号等仍由专用 TeX 数学字形提供，具体实现见类文件。

## 配置与编译

1. 保留本目录中的全部 12 个字体文件，路径应为 `fonts/times.ttf` 等，而非 `fonts/fonts/times.ttf`。
2. 使用 `main.tex` 和 XeLaTeX 编译。README 的 Overleaf 导入链接已指定主文件与编译器。
3. 旧版工程出现 `The font "times" cannot be found` 时，将本目录完整同步到旧项目，再从头重新编译；也可以从 README 链接重新导入完整模板。
4. 不要启用 `portablefonts`，不要用 Fandol 等替代字体冒充学校规定字体。

## 权利说明

字体文件取自维护者原工程，保留原文件及其内嵌权利信息。字体的权利属于相应权利人，源码的 Apache License 2.0 不覆盖这些字体，也不为字体额外授予使用或再分发许可。具体使用范围以各字体适用许可为准；详见 [THIRD_PARTY_NOTICES.md](../THIRD_PARTY_NOTICES.md)。
