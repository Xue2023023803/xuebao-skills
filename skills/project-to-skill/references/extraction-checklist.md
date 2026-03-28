# Extraction Checklist

Use this checklist when converting an existing project into a skill.

## 1. Confirm the project is mature enough

A project is a good candidate for skill extraction when at least one of these is true:
- The same workflow will likely be repeated in future tasks.
- The project contains non-obvious operational decisions worth preserving.
- The user wants a reusable way to reproduce the outcome without re-reading the whole repository.

## 2. Keep these parts

Retain only material that improves future execution:
- Trigger conditions and user intents.
- Ordered workflows that were proven in practice.
- Hard constraints, guardrails, and failure modes.
- Decision checklists and provider-selection logic.
- Small example prompts that show how to invoke the skill.
- Deterministic scripts only when they are genuinely reusable.

## 3. Drop these parts

Do not carry over repository noise:
- Logs, build output, checkpoints, caches, lockfiles, databases, model weights.
- Temporary debugging notes.
- One-off migration artifacts.
- Machine-local credentials, hostnames, usernames, and absolute paths.
- Full product documentation that does not help Codex execute the task.

## 4. Normalize the content

Before publishing a skill:
- Replace personal paths with placeholders such as `<project-root>` or `<vault-path>`.
- Generalize machine-bound ports and service names when possible.
- Remove dates unless chronology is essential.
- Convert long explanations into short operating rules.
- Move deep detail into `references/` instead of bloating `SKILL.md`.

## 5. Package shape

A practical default layout is:

```text
skill-name/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   └── checklist-or-notes.md
└── examples/
    └── example-prompt.md
```

Add `scripts/` only if the skill repeatedly benefits from a helper that is more reliable as code than prose.

## 6. Validate the result

Run one realistic prompt and ask:
- Would this skill trigger on its own metadata?
- Does `SKILL.md` tell Codex what to do without re-reading the whole project?
- Are references small and specific enough to be loaded only when needed?
- Did any machine-specific detail leak into the public version?
