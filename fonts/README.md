# 准确字体配置

公开源码包不附带字体二进制。`bistu-doctoral.cls` 保留原工程的字体实现，通过本目录中的准确文件加载字体；缺失文件时会报错，不会自动使用替代字体。

## 所需文件

将具有相应使用授权的字体放在本目录，文件名须与下表完全一致。字体名称和字形必须对应，不能通过重命名不同字体来满足文件名检查。

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

1. 从已有合法授权的软件环境或字体提供方获取上述准确字体，并核对适用授权。字体随操作系统或办公软件安装，不代表允许将字体文件再次公开发布。
2. 在本地使用时，将获准使用的原字体文件放入此目录。仅在本机安装字体还不够，当前类文件按 `fonts/` 路径加载。
3. 在 Overleaf 使用时，还须确认许可允许将字体上传到该服务。满足授权条件后，上传至项目的 `fonts/` 目录，选择 `main.tex` 和 XeLaTeX 编译。
4. 字体缺失或名称不匹配时，先修正配置。不要启用 `portablefonts`，不要用 Fandol 等替代字体冒充学校规定字体。

`.gitignore` 默认排除字体二进制，防止配置个人工作副本时将它们意外提交至公共仓库。若要发布可独立编译的 Overleaf 模板库项目，应先取得所含字体的公开再分发权限或确认学校认可且具有合适许可的解决方案。未经确认，勿将个人字体配置目录打包公开。

本文档不提供字体下载链接，也不为第三方字体授予许可。第三方权利边界见 [THIRD_PARTY_NOTICES.md](../THIRD_PARTY_NOTICES.md)。
