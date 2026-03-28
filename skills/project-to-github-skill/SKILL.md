---
name: project-to-github-skill
description: Use when the user wants to package an already finished project into a GitHub-ready Codex skill repository with repo-level files, installation flow, and a clean skill folder. Trigger on requests like 项目包装成github skill, 完成项目转github skill仓库, 把项目做成可发布skill, or package a finished project as a GitHub-ready skill repo.
---

# Project To GitHub Skill

## Overview

Package an already finished project into a GitHub-ready Codex skill repository. Use this skill when the user does not just want a reusable skill in isolation, but a publishable repository structure with root documentation, installation flow, and one or more polished skills inside `skills/`.

## Use This Skill When

- The project already works and the user wants to publish the distilled workflow as a skill repository on GitHub.
- The user wants repo-level files such as bilingual README files, license, install script, and clean skill packaging.
- The original project contains both reusable knowledge and machine-specific noise that must be separated before publication.

## Do Not Use This Skill When

- The project is still unstable and the workflow has not converged.
- The user only wants a local private skill and does not need a public repository wrapper.
- The correct output is product code or end-user documentation rather than a Codex skill package.

## Workflow

1. Audit the finished project.
   Identify the user outcome, repeated workflow, required tools, important constraints, validation steps, and which artifacts are reusable versus project-specific noise.

2. Define the repository boundary.
   The GitHub repository is not the original project tree. Create a clean repo that contains only publishable skill material, such as `README.md`, `README.zh-CN.md`, `LICENSE`, `scripts/install_to_codex.sh`, and `skills/<skill-name>/...`.

3. Distill the project into skill content.
   Rewrite the operational knowledge into `SKILL.md`, move detailed checklists or provider notes into `references/`, add small representative prompts to `examples/`, and add `agents/openai.yaml` for UI-facing metadata.

4. Strip machine-specific residue.
   Remove logs, caches, checkpoints, downloaded artifacts, model files, absolute paths, usernames, hostnames, API keys, and one-off debugging residue. Replace environment-specific values with placeholders.

5. Make installation explicit.
   Provide a simple installation path, typically via `scripts/install_to_codex.sh`, so a reader can clone the repo and install the shipped skills into `~/.codex/skills` or a custom target directory.

6. Validate the publishable result.
   Validate each skill, test the installer, confirm the README instructions match the actual repository layout, and ensure the resulting repo can be committed cleanly.

## Non-Negotiables

- Do not publish generated caches, logs, checkpoints, databases, model weights, downloaded assets, or private credentials.
- Do not mirror the whole original project into the skill repo.
- Keep repo-level files at the repository root and keep actual skills inside `skills/`.
- Keep `SKILL.md` concise and operational; move deep detail into `references/`.
- Replace machine-specific absolute paths with placeholders unless the repository is intentionally private and machine-bound.
- If the repository claims an installation path, verify the script or commands actually work.

## Collaboration Lessons

- Users who ask to “make it a skill” often mean “make it publishable on GitHub,” not merely “write a `SKILL.md`.”
- The public repository should preserve the tested workflow, not the entire implementation history.
- A good packaging skill must think about repository shape, installation UX, and publication hygiene, not just the skill body.

## References

Read [references/packaging-checklist.md](references/packaging-checklist.md) when turning a finished project into a GitHub-ready skill repository.
