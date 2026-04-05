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
- The user wants repo-level files such as `README.md`, `LICENSE`, `.gitignore`, install/run instructions, demo assets, or publish metadata.
- The original project contains reusable content plus machine-specific residue, debugging artifacts, legacy branches, or unpublished drafts that must be cleaned before publication.
- The user may need help with GitHub publishing details such as remote type, PAT vs password, SSH setup, or blocked SSH port 22.

## Do Not Use This Skill When

- The project is still exploratory and the workflow is not stable.
- The user only wants a local private skill with no GitHub-facing wrapper.
- The correct output is product code, marketing copy, or end-user documentation rather than a publishable repository package.

## Workflow

1. Audit the finished project and the publishing goal.
   Identify the real user outcome, maintained entry point, repeated workflow, required tools, constraints, validation steps, and what is reusable versus private or noisy.

2. Scan the repository and classify entry points before editing.
   Explicitly separate:
   - the primary user path: what a reader of the published repo should actually run, open, or follow first
   - auxiliary maintainer tooling: helper scripts, demo generators, migration tools, packaging helpers, or one-off utilities that may remain in the repo but are not part of the main usage path

   Use this classification when writing the README. The public README should foreground the primary user path and avoid promoting auxiliary tooling as if it were part of normal use.

3. Decide the repository type before editing.
   Pick one of these targets explicitly:
   - `skill repo`: root repo wraps one or more packaged skills inside `skills/`
   - `project repo`: root repo is the cleaned original project itself

4. Trim to the maintained mainline.
   Remove legacy branches, duplicate experimental directories, caches, generated outputs, one-off debug files, and unfinished helpers. Keep only the current maintained path plus assets that are genuinely needed.

5. Build the repo-level publishing layer.
   Add or fix the repository root files that make the repo understandable and publishable:
   - `README.md`
   - when bilingual docs are desired, prefer a single-page bilingual `README.md` with anchor links
   - `README.zh-CN.md` only when a redirect page or compatibility page is explicitly needed
   - `LICENSE`
   - `.gitignore`
   - `docs/assets/` or equivalent demo media when they materially help
   - install or run instructions that match the actual repo type

6. Normalize for public reuse.
   Remove usernames, absolute paths, private hosts, credentials, local ports, machine-bound assumptions, one-off logs, and stale screenshots. Demo images and videos must match the current maintained mainline rather than historical behavior.

7. Validate publishing hygiene.
   Confirm all of the following before calling the repo GitHub-ready:
   - the README matches the actual directory layout
   - examples reference files that really exist
   - the maintained entry point is obvious
   - `git status` is clean after the final edits
   - the chosen Git transport is workable: `HTTPS + PAT` or `SSH`
   - if SSH port 22 is blocked, switch to `ssh.github.com:443`

8. Commit the final packaging state.
   Leave the repo in a clean, pushable state with one or more commits that reflect the publication cleanup.

## README Writing Rules

Treat the repository README as a landing page for readers of the published repo, not as a maintainer checklist.

- Write for the person who lands on the repo page and wants to understand what the repo is, why it exists, and how to use it.
- Keep maintainer-only packaging rules in the skill instructions, checklist, or contribution docs rather than in the public README.
- Do not add low-value sections such as generic "Publishing Notes" or "发布说明" unless the repository is explicitly a publishing template and those notes are a real user-facing feature.
- Every README section should pass a usefulness test: a reader should learn what the repo does, how to run or install it, what the entry point is, what outputs to expect, or how to adapt it.
- If a section only says things like "do not publish credentials" or "replace placeholders before release", that usually belongs in the packaging checklist, not in the README.
- When bilingual docs are requested, prefer one single-page bilingual `README.md` with anchor links for English and Chinese sections. Use a separate `README.zh-CN.md` only when a redirect page or compatibility page is explicitly needed.
- Before writing README usage sections, scan the repository and classify what is a primary user entry point versus what is only helper tooling. The README should highlight the primary user path. Auxiliary scripts may stay in the repo, but they should not be presented as normal usage unless they are genuinely part of the user-facing workflow.

## Non-Negotiables

- Do not publish caches, logs, checkpoints, downloaded artifacts, private credentials, or machine-local paths.
- Do not leave README claims that contradict the cleaned repository layout.
- Do not keep misleading legacy screenshots or analysis outputs as if they represent the current mainline.
- Do not assume the final repo must be a skill repo; choose the repo type intentionally.
- Do not recommend GitHub account passwords for Git operations. Use `PAT` for HTTPS or SSH keys for SSH.
- If the repo claims an install or run path, verify that the commands match the shipped layout.
- Do not dump maintainer-only packaging reminders into the public README. Keep those in the skill checklist or contribution guidance instead.
- When bilingual docs are requested, prefer a single-page bilingual `README.md` with English and Chinese anchor navigation rather than two fully duplicated README bodies.

## Collaboration Lessons

- Many users ask for a “GitHub-ready skill” when they actually want either a cleaned project repo or both a project repo and a skill repo.
- Public repository quality depends as much on cleanup, docs consistency, and publish flow as on the packaged content itself.
- GitHub publishing often fails for operational reasons rather than code reasons: wrong remote URL, HTTPS password misuse, SSH key not uploaded, or SSH port 22 blocked by the network.
- A robust packaging pass should think about repo shape, demo accuracy, authentication path, and push readiness.

## References

Read these references as needed:
- [references/packaging-checklist.md](references/packaging-checklist.md)
- [references/github-publish-troubleshooting.md](references/github-publish-troubleshooting.md)
