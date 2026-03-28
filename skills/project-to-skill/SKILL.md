---
name: project-to-skill
description: Use when the user wants to turn an existing finished project into a reusable Codex skill by extracting workflows, references, examples, and tool boundaries while removing machine-specific details. Trigger on requests like 项目转skill, 从项目提炼skill, 为现有项目写skill, pull项目经验到skill, or convert a finished project into a reusable skill.
---

# Project To Skill

## Overview

Turn a completed project into a reusable Codex skill. Use this skill when the user already has working project code or a mature workflow and wants to distill it into a clean skill rather than publishing the whole project as the skill.

## Use This Skill When

- The project already works and the user wants to preserve the repeatable workflow.
- The repository contains real operational decisions that should survive beyond one codebase.
- The user wants a skill package or a skill repository, not just a project README rewrite.

## Do Not Use This Skill When

- The project is still exploratory and the workflow is not stable yet.
- The user actually needs product documentation, user docs, or a marketing-facing repository.
- The best output is still project code rather than reusable execution guidance.

## Workflow

1. Inspect the finished project before drafting the skill.
   Identify the real user outcomes, repeated workflows, critical constraints, required tools, validation steps, and which parts are project-specific implementation detail.

2. Draw the boundary between the project and the skill.
   Keep the skill focused on decisions, operating order, guardrails, references, and reusable helpers. Do not mirror the full repository into the skill.

3. Split content by role.
   Keep `SKILL.md` short and operational.
   Move checklists, provider notes, schemas, troubleshooting, or migration notes into `references/`.
   Add `examples/` only for representative prompts.
   Add `scripts/` only when a deterministic helper is repeatedly needed.

4. Normalize for reuse.
   Replace absolute paths, usernames, keys, local ports, machine-specific cache paths, and personal logs with reusable placeholders unless the user explicitly wants a machine-bound private skill.

5. Package the public-facing repository separately from the skill.
   If the user wants a GitHub repository, keep repo-level files such as bilingual READMEs, installation scripts, and license choice at the repository root. Keep the skill itself inside `skills/<skill-name>/`.

6. Validate against a realistic prompt.
   After drafting the skill, test whether one natural user request would trigger the right workflow without needing the original project context.

## Non-Negotiables

- Do not publish generated caches, logs, checkpoints, database files, model weights, or downloaded artifacts as part of a skill.
- Do not copy entire project READMEs into `SKILL.md`; rewrite them into concise operational instructions.
- Keep `SKILL.md` focused on trigger conditions, workflow, and guardrails.
- If the project supports multiple providers, frameworks, or modes, keep selection logic in `SKILL.md` and move variant details into `references/`.
- Replace absolute machine paths with placeholders unless the skill is intentionally private and machine-specific.
- Preserve collaboration lessons that materially change execution quality; drop narrative project history that does not improve future runs.

## Collaboration Lessons

- Users often say “make it a skill” when they actually want two artifacts: a reusable skill and a GitHub-ready wrapper repo. Separate them early.
- The most valuable content is usually not the code itself, but the hard-won decisions, failure modes, and validation order.
- A good public skill package should read like an execution guide, not like a project diary.

## References

Read [references/extraction-checklist.md](references/extraction-checklist.md) when turning a finished project into a reusable skill package.
