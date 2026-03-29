<a id="top"></a>

# personal-codex-skills

Language: [English](#english) | [简体中文](#zh-cn)

---

<a id="english"></a>

# personal-codex-skills

A personal Codex skill library for reusable workflows and GitHub-ready skill packaging.

## Project Overview

This repository collects maintained Codex skills that support repeatable technical workflows. The current library includes:

- `build-obsidian-rag`: build or optimize a local RAG pipeline for an Obsidian vault
- `connect-rag-to-ai`: connect an existing retrieval layer to Ollama, OpenAI, or Codex
- `project-to-github-skill`: package a finished project into a GitHub-ready skill repo or cleaned project repo

The repository is designed for direct installation into `~/.codex/skills/`, and each skill is kept as a reusable, publishable unit.

## Repository Layout

```text
personal-codex-skills/
├── README.md          # single-page bilingual README
├── LICENSE
├── scripts/
│   └── install_to_codex.sh
└── skills/
    ├── build-obsidian-rag/
    ├── connect-rag-to-ai/
    └── project-to-github-skill/
```

## Installation

```bash
git clone <your-repo-url>
cd personal-codex-skills
bash scripts/install_to_codex.sh
```

By default, this installs all skills in the repository into:

```text
~/.codex/skills/
```

## Installer Usage

Install all skills:

```bash
bash scripts/install_to_codex.sh
```

Install to a custom target:

```bash
bash scripts/install_to_codex.sh --target ~/.codex/skills
```

Install only one skill:

```bash
bash scripts/install_to_codex.sh --only build-obsidian-rag
```

List available skills without installing:

```bash
bash scripts/install_to_codex.sh --list
```

Show help:

```bash
bash scripts/install_to_codex.sh --help
```

## Publishing Notes

- Keep skill content generic where possible.
- Do not publish credentials, local paths, caches, logs, or generated artifacts.
- When bilingual docs are needed, prefer a single-page bilingual `README.md` with anchor links for English and Chinese sections.
- Add a separate `README.zh-CN.md` only when a redirect page or platform-specific compatibility page is explicitly needed.

[Back to top](#top)

---

<a id="zh-cn"></a>

# personal-codex-skills

一个用于沉淀可复用工作流和 GitHub 发布包装经验的个人 Codex skill 仓库。

## 项目介绍

这个仓库收集了一组当前在维护的 Codex skill，用来支持可重复的技术工作流。当前包含：

- `build-obsidian-rag`：为 Obsidian 笔记库构建或优化本地 RAG 流程
- `connect-rag-to-ai`：把已经可用的检索层接到 Ollama、OpenAI 或 Codex
- `project-to-github-skill`：把一个完成项目整理成可直接发布到 GitHub 的 skill 仓库或项目仓库

这个仓库默认面向 `~/.codex/skills/` 的直接安装，每个 skill 都尽量保持为可复用、可发布的独立单元。

## 仓库结构

```text
personal-codex-skills/
├── README.md          # 单页双语 README
├── LICENSE
├── scripts/
│   └── install_to_codex.sh
└── skills/
    ├── build-obsidian-rag/
    ├── connect-rag-to-ai/
    └── project-to-github-skill/
```

## 安装方式

```bash
git clone <your-repo-url>
cd personal-codex-skills
bash scripts/install_to_codex.sh
```

默认会把仓库中的全部 skill 安装到：

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

只列出可安装 skill：

```bash
bash scripts/install_to_codex.sh --list
```

查看帮助：

```bash
bash scripts/install_to_codex.sh --help
```

## 发布说明

- 尽量保持 skill 内容通用，不要带入机器私有信息。
- 不要发布凭证、本地路径、缓存、日志或生成产物。
- 如果需要双语说明，优先使用单个 `README.md`，通过锚点链接在英文和中文之间切换。
- 只有在确实需要跳转页或平台兼容页时，才额外添加 `README.zh-CN.md`。

[返回顶部](#top)
