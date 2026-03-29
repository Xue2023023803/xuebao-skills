# Packaging Checklist

Use this checklist when converting a finished project into a GitHub-ready repository.

## 1. Decide the target repository type

Do not assume the answer is always a skill repo. Pick one:

- `skill repo`: the repository exists mainly to ship reusable skills inside `skills/`
- `project repo`: the repository exists mainly to publish the cleaned working project itself

If the user is unclear, resolve this first.

## 2. Confirm the project is ready to be packaged

Proceed only when:
- the workflow is proven in real use
- there is a maintained entry point or maintained mainline
- the public-facing repo can omit noisy implementation history without losing the operational workflow

## 3. Trim to the maintained mainline

Before polishing docs, remove or archive:
- duplicate historical branches and abandoned experiments
- debug-only scripts
- unfinished helpers and one-off migration files
- generated caches and outputs
- stale screenshots or analysis figures that no longer match the current mainline

## 4. Choose the root repo shape

### Skill repo default

```text
repo-root/
├── README.md
├── LICENSE
├── .gitignore
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

### Project repo default

```text
repo-root/
├── README.md
├── LICENSE
├── .gitignore
├── docs/assets/
└── <maintained-project-root>/
```

Add more files only when they materially improve publishing or installation.

## 5. What to keep

Retain only what helps future execution or reuse:
- maintained entry points
- ordered workflows
- hard constraints and guardrails
- validation order
- real configuration examples
- representative prompts
- small reusable helper scripts, if genuinely needed
- demo assets that reflect the current mainline

## 5a. README audience test

Before finalizing a public README, ask:
- Is this section useful to a reader of the repo, or only to the maintainer who packaged it?
- Does this section explain what the repo is, how to use it, where to start, or what it outputs?
- If the text is really a packaging reminder, should it live in the skill checklist instead of the README?

Avoid low-value boilerplate such as generic "Publishing Notes" sections unless the repo is actually a publishing template and those notes are part of the user-facing purpose.

## 6. What to remove

Do not ship:
- build output, logs, caches, checkpoints, databases, lockfiles, model weights
- downloaded remote assets unless they are intentionally part of the published repo
- local machine paths, usernames, hostnames, credentials
- one-off debugging notes or debug-only scripts
- obsolete branches kept only out of habit
- README references to files or directories that no longer exist

## 7. Publishing hygiene

Before calling the repo GitHub-ready:
- replace machine-bound values with placeholders
- when bilingual docs are needed, prefer a single-page bilingual `README.md` with anchor links for English and Chinese
- add `README.zh-CN.md` only when a redirect page or compatibility page is explicitly useful
- check README instructions against the real repo shape
- add a license intentionally
- add a minimal `.gitignore`
- ensure demo images and videos represent the maintained path
- make sure `git status` is clean after final edits

## 8. GitHub transport and authentication

Check the actual push path, not just the code:
- verify `git remote -v`
- if using `HTTPS`, use `PAT`, not the GitHub account password
- if using `SSH`, verify the public key is uploaded to GitHub
- if `ssh -T git@github.com` fails on port 22, try `ssh -T -p 443 git@ssh.github.com`
- if needed, configure `github.com` to use `ssh.github.com:443`
- confirm whether the user prefers direct network access or a proxy/VPN path

## 9. Final validation

At minimum, confirm:
- the cleaned repo is coherent on its own
- the README matches the shipped layout
- install or run commands match the real repository
- the main packaged skill or main project entry path is obvious
- demo assets are accurate
- the repo can be committed cleanly and is ready to push
