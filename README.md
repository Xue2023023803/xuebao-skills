# personal-codex-skills

A personal Codex skill library for reusable workflows.

中文说明见 [README.zh-CN.md](README.zh-CN.md).

## Included Skills

- `build-obsidian-rag`
  Analyze an Obsidian vault, choose a practical local RAG stack, and build or optimize indexing, OCR, and sync.
- `connect-rag-to-ai`
  Connect a working retrieval layer to Ollama, OpenAI, or Codex and expose it through a usable web interaction surface.
- `project-to-github-skill`
  Package an already finished project into a GitHub-ready Codex skill repository with clean repo structure, install flow, and publishable skill content.

## Repository Layout

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

## Installation

Clone the repository and run the installer:

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

Install all skills to the default target:

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

- `install_to_codex.sh` copies skills from this repository into the target directory. Running it is enough to make the copied skills available to Codex in that target.
- Existing directories with the same skill name in the target are replaced. Unrelated skills in the target are left untouched.
- Keep skill content generic where possible. Avoid publishing machine-specific absolute paths, credentials, caches, logs, or generated artifacts.
- Before publishing, replace `<your-repo-url>` and choose a license that matches how you want others to use the repository.
