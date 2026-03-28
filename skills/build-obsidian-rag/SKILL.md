---
name: build-obsidian-rag
description: Use when the user wants to analyze an Obsidian vault, choose embedding/chunking/vector DB/OCR/sync settings, and build or optimize a local RAG knowledge base. Trigger on requests like 构建知识库, 本地 RAG, Obsidian 入库, OCR 索引, 增量同步, 向量库选型, or knowledge base build planning and implementation.
---

# Build Obsidian RAG

## Overview

Build or refine a local RAG stack for an Obsidian vault. Use this skill when the work spans vault analysis, component selection, indexing, sync, OCR, GPU enablement, or quality tuning.

## Workflow

1. Gather hard constraints first.
   Confirm the vault path, where the project should live, whether storage must stay outside the synced vault, update cadence, local-only/privacy expectations, and whether the user already has Ollama/OpenAI/Codex plans.

2. Inspect the vault and machine before choosing components.
   Measure eligible markdown count, average and tail note size, heading density, code/list prevalence, image usage, language mix, and duplicate/conflict files. Inspect CPU, RAM, GPU, and VRAM.

3. Choose the stack from real constraints, not defaults.
   Decide embedding model, chunking, vector store, hybrid retrieval, reranker, OCR policy, and sync strategy from the actual vault shape and hardware.

4. Build in this order.
   First scan and clean markdown.
   Then chunk.
   Then embed and write the vector store.
   Then add sync, logs, checkpoints, and scheduled execution.

5. Validate with real queries.
   Do not stop at a green script. Run real retrieval queries from the user's notes, inspect irrelevant tail results, and tighten thresholds or top-k if needed.

## Non-Negotiables

- Keep `data/` and `state/` outside the synced vault unless the user explicitly wants otherwise.
- Treat OCR text and image-context chunks separately. OCR text can be cached by image signature; full image-context chunks can only be reused when the surrounding markdown context is unchanged.
- OCR parallelism must be chosen from measured runs on representative image-heavy notes. Do not assume that more workers are faster, especially on small GPUs.
- Remote images must have an explicit policy such as `skip` or `fetch-and-cache`. If they need to enter the knowledge base, fetch them over direct network access into a local cache outside the vault, then run the same OCR/image-context pipeline and log `remote_ready` versus skipped references.
- OCR cache needs lifecycle management, but TTL is optional. For personal vaults, prefer conservative invalid-only cleanup: prune missing-source or invalid entries on a throttled schedule and keep valid caches indefinitely unless the user wants aggressive reclamation.
- Add progress logs and checkpoint/resume for heavy full builds.
- Prefer GPU for embedding, reranking, and OCR when it is actually available. Verify runtime usage instead of assuming that package install implies acceleration.
- Default downloads to direct network access. Do not use VPN/proxy routes unless direct download fails and the user approves the fallback.

## Collaboration Lessons

- Be concrete when describing performance. Say whether the task is failing, CPU-bound, GPU-bound, or simply long-running.
- When the user questions an abstraction, tighten the explanation instead of repeating the abstraction.
- Image position matters. If OCR is used, preserve heading path and nearby text instead of appending all OCR as a flat appendix.
- Benchmark OCR workers on the user's actual machine and representative notes before locking the default. Hardware intuition is not enough.
- Remote images are common in real vaults. Treat them as a first-class policy decision, and if the user wants them searchable, make them real local cached inputs instead of silently dropping them.
- `max_images_per_note` is a build-time throttle, not a retrieval-time control. For personal vaults, set it to `0` for unlimited processing when full coverage matters more than build speed.
- OCR cache cleanup should be conservative: favor recomputation over deleting live data, and add throttling so cleanup itself does not become noise.
- Product shape matters. If the user asks for something that feels like a real tool, move from one-shot scripts to a stable web interaction surface.

## References

Read [references/decision-checklist.md](references/decision-checklist.md) when selecting models, chunking, sync, OCR, or validating a local RAG build.
