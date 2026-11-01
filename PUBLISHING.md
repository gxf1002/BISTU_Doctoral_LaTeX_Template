# GitHub 公开发布与 Overleaf 分享指南

核对日期：2026-11-02。

本指南记录模板发布与维护流程。现有公开仓库为 [gxf1002/BISTU_Doctoral_LaTeX_Template](https://github.com/gxf1002/BISTU_Doctoral_LaTeX_Template)，无需重复创建。原 Overleaf 工程保持不变；GitHub 公开版未导入原 Overleaf Git 历史；当前版本已同步原工程的 12 个字体文件，并提供完整导入包。公开仓库不表示已被 Overleaf 模板库收录。下方第 1—2 节保留为新建独立副本时的操作参考。

## 1. 在 GitHub 新建公开仓库

建议仓库名称：`BISTU_Doctoral_LaTeX_Template`。

建议描述：`北京信息科技大学博士学位论文 LaTeX 通用模板（社区维护），包含集中格式指南与排版示例。`

1. 登录 GitHub，打开 <https://github.com/new>。
2. Owner 选择自己的账号，填写上述仓库名称与描述。
3. Visibility 选择 **Public**。这样别人可以浏览、克隆和下载仓库。
4. 首次通过下面的 Git 命令推送时，不要让网页预先添加 README、.gitignore 或 LICENSE，本地已包含前两项。
5. 点击 **Create repository**。

官方操作说明：[创建仓库](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)。

## 2. 上传准备好的源码

解压完整源码 ZIP，进入直接含有 `main.tex` 的工程根目录。此处应当没有 `.git` 目录。以下命令仅用于新建独立公开副本；不要在原 Overleaf 克隆目录执行，以免将原工程的个人信息或不拟公开的历史版本一并推送。

在该文件夹打开终端，执行：

```powershell
git init -b main
git add .
git commit -m "Initial public template"
git remote add origin https://github.com/gxf1002/BISTU_Doctoral_LaTeX_Template.git
git push -u origin main
```

上面的地址以账号 `gxf1002` 为例；如果使用其他账号或名称，请替换对应部分。认证时使用 GitHub 正常登录流程，不要把密码或令牌写进仓库、README 或远程地址。

如果 Git 提示缺少作者身份，在这个新仓库内配置本人希望公开的署名和 GitHub 的隐私邮箱，再重新提交；不要随意填写他人身份。

不使用命令行时，也可以在新仓库页面选择 **uploading an existing file**，上传解压后的目录内容并提交。应让 `main.tex` 出现在仓库根目录；只上传 ZIP 不会显示完整源码目录。

## 3. 让别人直接用作模板

上传成功后，打开仓库 **Settings → General**，勾选 **Template repository**。访问者随后可点击 **Use this template** 创建自己的仓库，也可以通过 **Code → Download ZIP** 下载，或执行：

```powershell
git clone https://github.com/gxf1002/BISTU_Doctoral_LaTeX_Template.git
```

官方说明：[模板仓库](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)。

在未登录的浏览器窗口中检查仓库能否打开，确认可见性为 Public，并下载 ZIP 核对 `main.tex`、章节文件和字体说明均存在。完整导入包已包含模板使用的全部字体，字体相关实现没有改成替代字体。应同时检查 Overleaf 链接指定了 `engine=xelatex` 与 `main_document=main.tex`。

## 4. 源码许可证

维护者已为本仓库选择 **Apache License 2.0**，完整文本见 [LICENSE](LICENSE)。README 与第三方说明已按这一选择统一。自有源码的使用、修改及再分发应遵守该许可证；字体、校徽、校名图形和学校声明等第三方内容不因源码许可而额外获授权，见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

GitHub 的解释：[为仓库选择许可证](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository)。

## 5. 在 Overleaf 使用完整模板

README 的导入入口使用 GitHub 根据当前 `main` 分支自动生成的 ZIP，其中包含源码、字体和许可证，不嵌套旧的工程 ZIP。这样更新源码后，下载包会同步更新。导入链接同时指定 XeLaTeX 和主文档：

```markdown
[在 Overleaf 中打开完整模板](https://www.overleaf.com/docs?snip_uri=https%3A%2F%2Fgithub.com%2Fgxf1002%2FBISTU_Doctoral_LaTeX_Template%2Farchive%2Frefs%2Fheads%2Fmain.zip%3Fv%3Dfonts-20261102&engine=xelatex&main_document=main.tex)
```

也可以下载该 ZIP，在 Overleaf 选择 **New Project → Upload Project**，然后用 `main.tex` 与 XeLaTeX 编译。这个入口不表示已被 Overleaf Gallery 收录。此前导入的旧项目不会自动更新，需要重新导入或手动同步字体文件。

官方接口说明：[Open in Overleaf](https://www.overleaf.com/devs)。

## 6. 提交 Overleaf 模板库

截至核对日期，Overleaf 的规则明确表示不接收非官方高校论文模板。高校模板需要官方身份，并在投稿说明中提供学校官网上的论文规范或提交指南链接。依据学校 Word 模板自行实现的 LaTeX 模板，并不会因此自动成为官方模板；教师支持或致谢也不自动等于学校正式认可。

因此，本项目在尚未确认学校官方身份时，适合先采用 GitHub 公开分享和 Overleaf 导入方式。若学校确认将此项目作为官方模板发布，再按下列流程提交：

1. 准备校方认可信息和学校官网规范链接，不将个人网盘或 GitHub 地址充当官方规范链接。
2. 确认源码及所有附带素材适合公开分发；在 Overleaf 完整编译并检查目录、图表、交叉引用和示例。缺少字体的源码包不能直接作为完整投稿包。
3. 打开拟投稿项目，选择顶部 **File** 或项目名称菜单，再选 **Submit → Overleaf Gallery**。
4. 填写清晰的中英文模板名称、用途、编译方式、维护者信息、官方规范链接及适用许可证，提交审核。
5. 审核通过后才会在模板库展示；不能保证收录。

后续更新须在**原投稿项目**中修改后再次提交审核；GitHub 推送或 Overleaf 日常编译不会自动更新模板库版本。

以上依据：[Overleaf 模板库投稿规则与流程](https://docs.overleaf.com/templates/submitting-to-the-overleaf-template-gallery)。

## 7. 日后同步更新

继续在原 Overleaf 工程维护模板。需要公开新版本时，将本次实际修改的源码同步到独立 GitHub 工作副本，保留公开版 README、字体说明、第三方说明和 .gitignore，检查变更后再提交和推送。

不要对公开仓库直接执行原 Overleaf 仓库的镜像推送。当前 12 个字体已列入 `.gitignore` 的明确保留清单；新增或更换字体时应核对其权利信息。源码更新后，GitHub 自动生成的 ZIP 会同步变化；发布前下载该 ZIP，确认字体完整并重新编译，无需再向仓库上传一份工程 ZIP。
