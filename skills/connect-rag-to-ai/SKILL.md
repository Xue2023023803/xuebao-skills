---
name: connect-rag-to-ai
description: Use when the user wants to connect an existing local RAG knowledge base to an AI backend such as Ollama, OpenAI, or Codex, and expose it through web interaction. Trigger on requests like 接入AI, Ollama聊天, Codex接入, prompt拼接, Web问答, or RAG-to-LLM integration.
---

# Connect RAG To AI

## Overview

Connect a working retrieval layer to an LLM and expose it through a usable local web surface. Use this skill only after retrieval is already returning usable evidence.

## Workflow

1. Verify retrieval before touching the model layer.
   Make sure the knowledge base can already return relevant evidence with source paths and scores.

2. Build the bridge layer.
   The AI should not query the vector store directly. Create a stable path like `question -> retrieve evidence -> build prompt -> call provider -> return answer + citations`.

3. Add interfaces in this order.
   First make the provider path and prompt assembly stable.
   Then expose the system through a local web surface with citations and session continuity.

4. Keep citations visible.
   Return note paths, titles, and evidence snippets with the answer. Do not hide the evidence layer behind a plain model response.

5. Validate the real backend.
   Confirm the service is up, the model is actually installed, networking is correct, and the response path works end to end.

## Non-Negotiables

- Retrieval quality comes before UI polish.
- Persistent interaction should keep real session continuity instead of stateless one-shot requests.
- If the user wants a product-like experience, expose timings, evidence count, sources, and session continuity.
- Keep provider configuration explicit: backend, model, host, API key, and session file.
- Default downloads to direct network access; only switch to VPN/proxy after direct failure and explicit approval.

## Collaboration Lessons

- Users often say “接入 AI” but actually mean “make it usable like a real chat product.” Clarify the interaction surface early.
- Explain whether the blocker is retrieval, provider setup, model download, service health, or prompt assembly.
- When the user asks “是不是搞定了”, answer in terms of end-to-end usability, not just whether files exist.
- Web should be built on top of a verified retrieval and provider path, not used to hide an unstable backend.

## References

Read [references/integration-checklist.md](references/integration-checklist.md) when wiring a RAG stack into Ollama, OpenAI, Codex, and a local web UI.
