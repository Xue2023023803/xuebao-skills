---
name: project-to-github-skill
description: Use when the user wants to package a finished project into a GitHub-ready repository, usually a publishable Codex skill repo, with clean repo-level files, publishing hygiene, installation or run instructions, and a validated push path. Trigger on requests like 项目包装成github skill, 项目整理后上传github, 完成项目转github 仓库, 把项目做成可发布 skill, 仓库发布前整理, or package a finished project as a GitHub-ready skill or project repo.
---

# Project To GitHub Skill

## Overview

Package a finished project into a GitHub-ready repository. The default target is a publishable Codex skill repo, but this skill must first determine whether the user actually wants:
- a distilled `skills/<skill-name>/...` repository, or
- the original project itself cleaned up and made publishable on GitHub.

Treat repository packaging as a release task, not just a file-generation task.

## Use This Skill When

- The project already works and the user wants a GitHub-ready public or shareable repository.
- The user wants repo-level files such as `README.md`, `README.zh-CN.md`, `LICENSE`, `.gitignore`, install/run instructions, demo assets, or publish metadata.
- The original project contains reusable content plus machine-specific residue, debugging artifacts, legacy branches, or unpublished drafts that must be cleaned before publication.
- The user may need help with GitHub publishing details such as remote type, PAT vs password, SSH setup, or blocked SSH port 22.

## Do Not Use This Skill When

- The project is still exploratory and the workflow is not stable.
- The user only wants a local private skill with no GitHub-facing wrapper.
- The correct output is product code, marketing copy, or end-user documentation rather than a publishable repository package.

## Workflow

1. Audit the finished project and the publishing goal.
   Identify the real user outcome, maintained entry point, repeated workflow, required tools, constraints, validation steps, and what is reusable versus private or noisy.

2. Decide the repository type before editing.
   Pick one of these targets explicitly:
   - `skill repo`: root repo wraps one or more packaged skills inside `skills/`
   - `project repo`: root repo is the cleaned original project itself

3. Trim to the maintained mainline.
   Remove legacy branches, duplicate experimental directories, caches, generated outputs, one-off debug files, and unfinished helpers. Keep only the current maintained path plus assets that are genuinely needed.

4. Build the repo-level publishing layer.
   Add or fix the repository root files that make the repo understandable and publishable:
   - `README.md`
   - `README.zh-CN.md` when bilingual docs are desired
   - `LICENSE`
   - `.gitignore`
   - `docs/assets/` or equivalent demo media when they materially help
   - install or run instructions that match the actual repo type

5. Normalize for public reuse.
   Remove usernames, absolute paths, private hosts, credentials, local ports, machine-bound assumptions, one-off logs, and stale screenshots. Demo images and videos must match the current maintained mainline rather than historical behavior.

6. Validate publishing hygiene.
   Confirm all of the following before calling the repo GitHub-ready:
   - the README matches the actual directory layout
   - examples reference files that really exist
   - the maintained entry point is obvious
   - `git status` is clean after the final edits
   - the chosen Git transport is workable: `HTTPS + PAT` or `SSH`
   - if SSH port 22 is blocked, switch to `ssh.github.com:443`

7. Commit the final packaging state.
   Leave the repo in a clean, pushable state with one or more commits that reflect the publication cleanup.

## Non-Negotiables

- Do not publish caches, logs, checkpoints, downloaded artifacts, private credentials, or machine-local paths.
- Do not leave README claims that contradict the cleaned repository layout.
- Do not keep misleading legacy screenshots or analysis outputs as if they represent the current mainline.
- Do not assume the final repo must be a skill repo; choose the repo type intentionally.
- Do not recommend GitHub account passwords for Git operations. Use `PAT` for HTTPS or SSH keys for SSH.
- If the repo claims an install or run path, verify that the commands match the shipped layout.

## Collaboration Lessons

- Many users ask for a “GitHub-ready skill” when they actually want either a cleaned project repo or both a project repo and a skill repo.
- Public repository quality depends as much on cleanup, docs consistency, and publish flow as on the packaged content itself.
- GitHub publishing often fails for operational reasons rather than code reasons: wrong remote URL, HTTPS password misuse, SSH key not uploaded, or SSH port 22 blocked by the network.
- A robust packaging pass should think about repo shape, demo accuracy, authentication path, and push readiness.

## References

Read these references as needed:
- [references/packaging-checklist.md](references/packaging-checklist.md)
- [references/github-publish-troubleshooting.md](references/github-publish-troubleshooting.md)
