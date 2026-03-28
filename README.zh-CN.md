# personal-codex-skills

一个用于沉淀可复用工作流的个人 Codex skill 仓库。

English version: [README.md](README.md)

## 包含的 Skill

- `build-obsidian-rag`
  分析 Obsidian 笔记库，选择合适的本地 RAG 方案，并落实索引、OCR 与同步。
- `connect-rag-to-ai`
  将已经可用的检索层接到 Ollama、OpenAI 或 Codex，并通过可用的 Web 交互层暴露出去。
- `project-to-github-skill`
  将一个已经完成的项目包装成可直接放到 GitHub 的 Codex skill 仓库，包含干净的仓库结构、安装流程与可发布的 skill 内容。

## 仓库结构

```text
personal-codex-skills/
├── README.md
├── README.zh-CN.md
├── .gitignore
├── scripts/
│   └── install_to_codex.sh
└── skills/
    ├── build-obsidian-rag/
    ├── connect-rag-to-ai/
    └── project-to-github-skill/
```

## 安装方式

先克隆仓库，然后直接运行安装脚本：

```bash
git clone <your-repo-url>
cd personal-codex-skills
bash scripts/install_to_codex.sh
```

默认会将仓库中的所有 skill 安装到：

```text
~/.codex/skills/
```

## 安装脚本用法

安装全部 skill：

```bash
bash scripts/install_to_codex.sh
```

安装到自定义目录：

```bash
bash scripts/install_to_codex.sh --target ~/.codex/skills
```

只安装单个 skill：

```bash
bash scripts/install_to_codex.sh --only build-obsidian-rag
```

只列出可安装的 skill，不执行安装：

```bash
bash scripts/install_to_codex.sh --list
```

查看帮助：

```bash
bash scripts/install_to_codex.sh --help
```

## 发布说明

- `install_to_codex.sh` 会把当前仓库 `skills/` 目录中的 skill 复制到目标目录；直接运行它，就可以把这些 skill 配置到指定位置。
- 目标目录中同名的 skill 会被替换；其他无关 skill 不会被删除。
- 如果准备公开到 GitHub，建议继续保持 skill 内容通用化，避免提交机器绝对路径、凭证、缓存、日志和生成产物。
- 正式发布前，记得替换 `<your-repo-url>`，并补上你希望采用的许可证。
