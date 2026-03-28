# Packaging Checklist

Use this checklist when converting a finished project into a GitHub-ready skill repository.

## 1. Confirm the project is ready to be packaged

Package the project as a skill repo only when:
- The workflow is already proven in real use.
- The user wants a reusable Codex-facing artifact, not just project source code.
- The public-facing repository can omit most of the original implementation details without losing the operational workflow.

## 2. Repository root contents

A practical default repository should usually contain:

```text
repo-root/
├── README.md
├── README.zh-CN.md
├── LICENSE
├── scripts/
│   └── install_to_codex.sh
└── skills/
    └── <skill-name>/
        ├── SKILL.md
        ├── agents/
        │   └── openai.yaml
        ├── references/
        └── examples/
```

Add more root files only when they materially improve publishing or installation.

## 3. What to keep from the original project

Retain only what helps future Codex runs:
- Trigger conditions
- Ordered workflows
- Hard constraints and guardrails
- Validation order
- Decision checklists
- Representative prompts
- Small reusable helper scripts, if genuinely needed

## 4. What to remove

Do not ship:
- Build output, logs, caches, checkpoints, databases, lockfiles, model weights
- Downloaded remote assets
- Local machine paths, usernames, hostnames, ports, credentials
- One-off debugging notes
- Full project documentation that does not help Codex execute the workflow

## 5. Publishing hygiene

Before calling the repo GitHub-ready:
- Replace machine-bound values with placeholders
- Check bilingual README instructions against the real repo shape
- Ensure the install script matches the shipped layout
- Validate every skill directory
- Choose and include a license
- Make sure `git status` is clean after final edits

## 6. Final validation

At minimum, confirm all of the following:
- The new repo structure is coherent on its own
- `scripts/install_to_codex.sh --list` works
- Installing to a temporary target copies the expected skills
- The main skill validates successfully
- The README explains how to install and use the packaged skills
